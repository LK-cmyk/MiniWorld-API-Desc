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
from common.config import (
    FUNC_URL_30_PREFIX,
    FUNC_URL_30_LIST,
    MULTIPLE_30_DIR,
    FUNC_TITLE_FILTER_30,
)

FUNC_URL_START = FUNC_URL_30_PREFIX
FUNC_URL = FUNC_URL_30_LIST
FUNC_FILES_PATH = str(MULTIPLE_30_DIR)


def analyze_web(url: str) -> set[str]:
    """从网页 API 文档中提取函数名

    从标题（h2/h3/h4）中提取纯函数名，若未找到则从 Markdown 表格中提取。

    Args:
        url: 文档 URL 的相对路径

    Returns:
        函数名集合
    """
    full_url: str = FUNC_URL_START + url
    response = requests.get(full_url, timeout=10)
    response.encoding = "utf-8"
    soup = BeautifulSoup(response.text, "html.parser")
    out_funcs: set[str] = set()

    for heading in soup.find_all(["h2", "h3", "h4"]):
        text = heading.get_text(strip=True)
        if not text:
            continue
        text = re.sub(r"[\u200b\u200c\u200d\ufeff]+", "", text)
        if not text:
            continue
        if re.fullmatch(r"[A-Za-z_]\w*", text) and text not in FUNC_TITLE_FILTER_30:
            out_funcs.add(text)

    # 降级方案：从表格中提取
    if not out_funcs:
        page_text = soup.get_text(separator="\n")
        for line in page_text.splitlines():
            line = line.strip()
            if not line.startswith("|"):
                continue
            parts = [part.strip() for part in line.split("|")]
            if len(parts) >= 3 and parts[1].isdigit():
                func_part = re.sub(r"\(.*\)$", "", parts[2])
                if func_part:
                    out_funcs.add(func_part)
    return out_funcs


def module_name_from_url(url: str) -> str:
    """从文档 URL 推断模块名称

    Args:
        url: 文档 URL 的相对路径

    Returns:
        模块名称
    """
    base = os.path.splitext(os.path.basename(url))[0]
    if base.lower() == "timeline":
        return "TimeLine"
    return base.capitalize()


def local_file_for_module(module_name: str) -> str:
    """从模块名生成本地声明文件路径

    Args:
        module_name: 模块名称

    Returns:
        本地声明文件路径
    """
    return os.path.join(FUNC_FILES_PATH, f"MN{module_name}.d.lua")


def main() -> None:
    """主程序：对比本地声明和网页 API 文档函数"""
    init_stdout()
    all_diff: list[str] = []
    local_count = 0
    web_count = 0
    only_local_count = 0
    only_web_count = 0

    for url in FUNC_URL:
        module_name = module_name_from_url(url)
        local_path = local_file_for_module(module_name)
        web_funcs = analyze_web(url)
        local_funcs: set[str] = set()
        if os.path.exists(local_path):
            local_funcs = get_function_names(local_path)
            local_count += 1
        else:
            all_diff.append(f"[{module_name}]  ⚠ 本地文件不存在")
        web_count += 1

        diff = compare_funcs(local_funcs, web_funcs, module_name)
        all_diff.extend(diff)

        if local_funcs and not web_funcs:
            only_local_count += 1
        elif web_funcs and not local_funcs:
            only_web_count += 1

    common_count = local_count - only_local_count
    print()
    summary = build_summary(
        "函数对比",
        local_count,
        web_count,
        common_count,
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
