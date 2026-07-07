"""对比 2.0 MNEvent.d.json 与 2.0 网页事件文档的事件名称和参数差异"""

import json
import os
import re
import sys
import io
from pathlib import Path
from collections import defaultdict

import requests
from bs4 import BeautifulSoup

EVENT_URL: str = "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d391"
SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
JSON_PATH: str = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir, os.pardir, "multiple", "2.0", "MNEvent.d.json"))
IGNORE_PARAMS: set[str] = {"eventworldid"}  # 对比时忽略的参数字段名
# x, y, z 在网页中通常共用同一个描述（如"方块坐标"），视为同组
COORD_PARAMS: set[str] = {"x", "y", "z"}


def init() -> None:
    """初始化输出编码"""
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")


def load_json_events(path: str) -> dict[str, dict]:
    """加载本地 MNEvent.d.json，返回 {事件全名: {desc, event_info}}"""
    if not os.path.exists(path):
        print(f"本地 JSON 文件不存在: {path}")
        return {}
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def fetch_page(url: str) -> str | None:
    """请求网页并返回 HTML 文本"""
    try:
        resp = requests.get(url, timeout=20)
        resp.encoding = "utf-8"
        return resp.text
    except Exception as e:
        print(f"请求失败: {url} -> {e}")
        return None


def parse_web_events(html: str) -> dict[str, dict]:
    """从网页 HTML 中提取事件定义

    表格列：名称 | 用法描述 | 接口参数 | 参数说明

    Returns:
        {事件全名: {"desc": 用法描述, "params": [参数名列表], "param_desc": {参数名: 说明}}}
    """
    soup = BeautifulSoup(html, "html.parser")
    result: dict[str, dict] = {}

    for table in soup.find_all("table"):
        for row in table.find_all("tr"):
            cells = row.find_all("td")
            if len(cells) < 4:
                continue

            name = cells[0].get_text(strip=True)
            usage = cells[1].get_text(strip=True)
            params_raw = cells[2].get_text(strip=True)
            desc_raw = cells[3].get_text(strip=True)

            # 跳过标题行和无效行
            if not name or name in {"名称", "用法描述", "接口参数", "参数说明"}:
                continue
            if not re.fullmatch(r"[A-Za-z0-9_.]+", name):
                continue

            # 解析接口参数
            param_names = [p.strip() for p in params_raw.split(",") if p.strip()]
            desc_parts = [p.strip() for p in desc_raw.split(",") if p.strip()]

            param_desc_map: dict[str, str] = {}
            for i, pn in enumerate(param_names):
                if i < len(desc_parts):
                    param_desc_map[pn] = desc_parts[i]
                else:
                    param_desc_map[pn] = ""

            result[name] = {
                "desc": usage,
                "params": param_names,
                "param_desc": param_desc_map,
            }

    return result


def compare_event_names(
    json_events: dict[str, dict],
    web_events: dict[str, dict],
) -> list[str]:
    """比较事件名称差异

    Returns:
        差异描述行列表
    """
    lines: list[str] = []
    json_names = set(json_events)
    web_names = set(web_events)

    only_json = sorted(json_names - web_names)
    only_web = sorted(web_names - json_names)

    if not only_json and not only_web:
        lines.append("事件名称完全一致，无差异。")
        return lines

    if only_json:
        lines.append(f"仅在本地 JSON 存在的事件（{len(only_json)} 个）：")
        for name in only_json:
            lines.append(f"  - {name}")
    if only_web:
        lines.append(f"仅在网页存在的事件（{len(only_web)} 个）：")
        for name in only_web:
            lines.append(f"  - {name}")

    return lines


def compare_event_params(
    json_events: dict[str, dict],
    web_events: dict[str, dict],
) -> list[str]:
    """比较共同事件的参数差异

    Returns:
        差异描述行列表
    """
    lines: list[str] = []
    common = sorted(set(json_events) & set(web_events))

    for name in common:
        json_info = json_events[name].get("event_info", {}) or {}
        web_params = web_events[name].get("params", [])
        web_param_desc = web_events[name].get("param_desc", {})

        # JSON 参数名集合
        json_param_set = set(json_info.keys())
        # 网页参数名集合（过滤忽略项）
        web_param_set = {p for p in web_params if p.lower() not in IGNORE_PARAMS}

        only_json = sorted(json_param_set - web_param_set)
        only_web = sorted(web_param_set - json_param_set)
        common_params = sorted(json_param_set & web_param_set)

        if not only_json and not only_web:
            # 参数名完全一致时，检查描述是否一致
            desc_diffs: list[str] = []

            # 判断 x,y,z 是否全部在双方参数中（即坐标参数齐全）
            has_all_coords = COORD_PARAMS.issubset(json_param_set & web_param_set)
            # 获取网页侧坐标的描述基准（取 x 的描述作为 x/y/z 的标准）
            coord_ref_desc = web_param_desc.get("x", "") if has_all_coords else None

            for p in common_params:
                j_desc = json_info.get(p, "")
                # 对于 y/z，使用网页 x 的描述作为比较基准
                if has_all_coords and p in COORD_PARAMS and p != "x":
                    w_desc = coord_ref_desc or ""
                else:
                    w_desc = web_param_desc.get(p, "")
                if j_desc != w_desc:
                    # 网页描述为空 → 网页不提供该参数的独立描述，不以差异报告
                    if not w_desc:
                        continue
                    desc_diffs.append(f"    参数 {p}: 本地描述「{j_desc}」≠ 网页描述「{w_desc}」")
            if not desc_diffs:
                continue  # 完全一致，跳过
            lines.append(f"[{name}] 参数描述差异：")
            lines.extend(desc_diffs)
        else:
            lines.append(f"[{name}] 参数差异：")
            if only_json:
                lines.append(f"  仅在本地 JSON 的参数：{', '.join(only_json)}")
            if only_web:
                lines.append(f"  仅在网页的参数：{', '.join(only_web)}")

    return lines


def main() -> None:
    init()

    # 加载本地 JSON
    print(f"加载本地 JSON: {JSON_PATH}")
    json_events = load_json_events(JSON_PATH)
    if not json_events:
        return
    print(f"  本地 JSON 共 {len(json_events)} 个事件\n")

    # 抓取网页
    print(f"抓取网页: {EVENT_URL}")
    html = fetch_page(EVENT_URL)
    if not html:
        return
    web_events = parse_web_events(html)
    print(f"  网页共解析到 {len(web_events)} 个事件\n")

    # 事件名称对比
    print("=" * 60)
    print("一、事件名称对比")
    print("=" * 60)
    name_diff = compare_event_names(json_events, web_events)
    for line in name_diff:
        print(line)

    # 参数对比
    print()
    print("=" * 60)
    print("二、共同事件的参数对比")
    print("=" * 60)
    param_diff = compare_event_params(json_events, web_events)
    if param_diff:
        for line in param_diff:
            print(line)
    else:
        print("所有共同事件的参数完全一致，无差异。")

    # 统计摘要
    common = sorted(set(json_events) & set(web_events))
    only_json = sorted(set(json_events) - set(web_events))
    only_web = sorted(set(web_events) - set(json_events))

    print()
    print("=" * 60)
    print("统计摘要")
    print("=" * 60)
    print(f"  本地 JSON 事件数: {len(json_events)}")
    print(f"  网页事件数: {len(web_events)}")
    print(f"  共同事件数: {len(common)}")
    print(f"  仅在本地 JSON: {len(only_json)}")
    print(f"  仅在网页: {len(only_web)}")


if __name__ == "__main__":
    main()
