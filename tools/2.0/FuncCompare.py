"""对比 2.0 本地声明文件与 2.0 网页 API 文档的函数差异"""

import os
import re
import sys
from pathlib import Path

import requests
from bs4 import BeautifulSoup

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common.io_utils import init_stdout
from common.lua_parser import get_function_names
from common.compare import compare_funcs, build_summary
from common.config import FUNC_URLS_20, MULTIPLE_20_DIR, WEB_FILTER_BLACKLIST_20

FUNC_URLS = FUNC_URLS_20
FUNC_FILES_PATH = str(MULTIPLE_20_DIR)
WEB_FILTER_BLACKLIST = WEB_FILTER_BLACKLIST_20


def analyze_web(url: str) -> set[str]:
    """从 2.0 网页 API 文档中提取函数名

    从表格第二列和标题中提取函数名。

    Args:
        url: 文档页面 URL

    Returns:
        函数名集合
    """
    out_funcs: set[str] = set()
    try:
        response = requests.get(url, timeout=15)
        response.encoding = "utf-8"
    except Exception as e:
        print(f"  请求失败: {url} -> {e}")
        return out_funcs

    soup = BeautifulSoup(response.text, "html.parser")

    # 方法1：从表格中提取函数名
    for table in soup.find_all("table"):
        for row in table.find_all("tr"):
            cells = row.find_all("td")
            if len(cells) >= 2:
                func_cell = cells[1]
                func_text = func_cell.get_text(strip=True)
                func_name = re.sub(r"\(.*\)$", "", func_text).strip()
                if func_name and func_name not in WEB_FILTER_BLACKLIST:
                    if re.fullmatch(r"[A-Za-z_]\w*", func_name):
                        out_funcs.add(func_name)

    # 方法2：从标题（h2/h3/h4）中提取函数名
    for heading in soup.find_all(["h2", "h3", "h4"]):
        text = heading.get_text(strip=True)
        text = re.sub(r"[\u200b\u200c\u200d\ufeff]+", "", text)
        if text and re.fullmatch(r"[A-Za-z_]\w*", text):
            if text not in WEB_FILTER_BLACKLIST:
                out_funcs.add(text)

    return out_funcs


def module_name_from_file(filename: str) -> str:
    """从文件名推断模块名称

    Args:
        filename: 文件名（如 MNActor.d.lua）

    Returns:
        模块名称（如 Actor）
    """
    base = filename.replace(".d.lua", "")
    return base.replace("MN", "", 1) if base.startswith("MN") else base


def main() -> None:
    """主程序：对比本地声明和网页 API 文档函数"""
    init_stdout()

    if not os.path.exists(FUNC_FILES_PATH):
        print(f"错误：2.0 声明目录不存在: {FUNC_FILES_PATH}")
        return

    all_diff: list[str] = []
    local_count = 0
    web_count = 0
    only_local_count = 0
    only_web_count = 0

    # 收集本地所有 .d.lua 文件
    local_files: list[str] = sorted(
        f for f in os.listdir(FUNC_FILES_PATH) if f.endswith(".d.lua")
    )

    for filename in local_files:
        module_name: str = module_name_from_file(filename)
        local_path: str = os.path.join(FUNC_FILES_PATH, filename)

        # 读取本地函数
        local_funcs: set[str] = get_function_names(local_path)

        # 获取网页函数
        web_funcs: set[str] = set()
        matched_url: str | None = None
        for key, url in FUNC_URLS.items():
            if key.lower() == module_name.lower():
                matched_url = url
                break

        if matched_url:
            print(f"抓取 {module_name} ...")
            web_funcs = analyze_web(matched_url)
            local_count += 1
            web_count += 1
        else:
            all_diff.append(f"[{module_name}]  ⚠ 未配置网页文档 URL")
            local_count += 1
            only_local_count += 1
            continue

        diff = compare_funcs(local_funcs, web_funcs, module_name)
        all_diff.extend(diff)

        # 统计计数
        if local_funcs and not web_funcs:
            only_local_count += 1
        elif web_funcs and not local_funcs:
            only_web_count += 1

    print()
    summary = build_summary(
        "函数对比",
        local_count,
        web_count,
        local_count
        - only_local_count
        - (local_count - web_count if local_count > web_count else 0),
        only_local_count,
        only_web_count,
    )
    for line in summary:
        print(line)
    print()
    for line in all_diff:
        print(line)


if __name__ == "__main__":
    main()
