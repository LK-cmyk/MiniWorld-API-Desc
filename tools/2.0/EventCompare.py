"""对比 2.0 MNEvent.d.json 与 2.0 网页事件文档的事件名称和参数差异"""

import json
import re
import sys
import os
from pathlib import Path

import requests
from bs4 import BeautifulSoup

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common.io_utils import init_stdout
from common.compare import build_summary
from common.config import (
    EVENT_URL_20,
    MULTIPLE_20_DIR,
    IGNORE_EVENT_PARAMS,
    COORD_PARAMS,
)

EVENT_URL = EVENT_URL_20
JSON_PATH = str(MULTIPLE_20_DIR / "MNEvent.d.json")
IGNORE_PARAMS = IGNORE_EVENT_PARAMS


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
        lines.append("  ✓ 事件名称完全一致")
        return lines

    lines.append("[事件名称]")
    if only_json:
        count = len(only_json)
        items = ", ".join(only_json[:10])
        suffix = f" ... 等 {count} 项" if count > 10 else ""
        lines.append(f"  仅在本地 ({count}): {items}{suffix}")
    if only_web:
        count = len(only_web)
        items = ", ".join(only_web[:10])
        suffix = f" ... 等 {count} 项" if count > 10 else ""
        lines.append(f"  仅在网页 ({count}): {items}{suffix}")

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
    has_any_diff = False

    for name in common:
        json_info = json_events[name].get("event_info", {}) or {}
        web_params = web_events[name].get("params", [])
        web_param_desc = web_events[name].get("param_desc", {})

        json_param_set = set(json_info.keys())
        web_param_set = {p for p in web_params if p.lower() not in IGNORE_PARAMS}

        only_json = sorted(json_param_set - web_param_set)
        only_web = sorted(web_param_set - json_param_set)
        common_params = sorted(json_param_set & web_param_set)

        if not only_json and not only_web:
            desc_diffs: list[str] = []

            has_all_coords = COORD_PARAMS.issubset(json_param_set & web_param_set)
            coord_ref_desc = web_param_desc.get("x", "") if has_all_coords else None

            for p in common_params:
                j_desc = json_info.get(p, "")
                if has_all_coords and p in COORD_PARAMS and p != "x":
                    w_desc = coord_ref_desc or ""
                else:
                    w_desc = web_param_desc.get(p, "")
                if j_desc != w_desc:
                    if not w_desc:
                        continue
                    desc_diffs.append(
                        f"    参数 {p}: 本地「{j_desc}」≠ 网页「{w_desc}」"
                    )
            if not desc_diffs:
                continue
            lines.append(f"[{name}]")
            lines.extend(desc_diffs)
            has_any_diff = True
        else:
            lines.append(f"[{name}]")
            if only_json:
                lines.append(f"  仅在本地 ({len(only_json)}): {', '.join(only_json)}")
            if only_web:
                lines.append(f"  仅在网页 ({len(only_web)}): {', '.join(only_web)}")
            has_any_diff = True

    if not has_any_diff:
        lines.append("  ✓ 所有共同事件的参数完全一致")
    return lines


def main() -> None:
    init_stdout()

    json_events = load_json_events(JSON_PATH)
    if not json_events:
        return

    html = fetch_page(EVENT_URL)
    if not html:
        return
    web_events = parse_web_events(html)

    common_set = sorted(set(json_events) & set(web_events))
    only_json_set = sorted(set(json_events) - set(web_events))
    only_web_set = sorted(set(web_events) - set(json_events))

    # 统计摘要（放在最前）
    summary = build_summary(
        "事件对比",
        len(json_events),
        len(web_events),
        len(common_set),
        len(only_json_set),
        len(only_web_set),
    )
    for line in summary:
        print(line)

    # 事件名称对比
    print()
    name_diff = compare_event_names(json_events, web_events)
    for line in name_diff:
        print(line)

    # 参数对比
    print()
    param_diff = compare_event_params(json_events, web_events)
    for line in param_diff:
        print(line)


if __name__ == "__main__":
    main()
