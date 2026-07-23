"""对比 2.0 MNEnumLib.d.lua 与 2.0 维基枚举文档的差异"""

import sys
from pathlib import Path

import requests
from bs4 import BeautifulSoup, Tag

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common.io_utils import init_stdout
from common.lua_parser import get_enum_definitions
from common.compare import compare_enums, build_summary
from common.config import ENUM_URL_20, MULTIPLE_20_DIR, SKIP_ENUM_CLASSES_20

ENUM_LIB_URL = ENUM_URL_20
ENUM_LIB_FILE_PATH = str(MULTIPLE_20_DIR / "MNEnumLib.d.lua")
SKIP_CLASSES = SKIP_ENUM_CLASSES_20


def analyze_web(url: str) -> dict[str, list[str]]:
    """从 2.0 维基页面中提取枚举定义

    维基页面中的枚举表格格式为：名称 | 数值 | 用法描述
    名称列格式为: ClassName.FieldName

    Args:
        url: 维基页面 URL

    Returns:
        {本地类名: [字段名列表]}
    """
    out_dict: dict[str, list[str]] = {}
    response = requests.get(url, timeout=15)
    response.encoding = "utf-8"
    soup = BeautifulSoup(response.text, "html.parser")
    all_tables: list[Tag] = soup.find_all("table")

    for table in all_tables:
        rows: list[Tag] = table.find_all("tr")
        if not rows:
            continue

        # 找到第一个包含数据的行（跳过表头行）
        first_data_row: Tag | None = None
        for row in rows:
            cells: list[Tag] = row.find_all(["td", "th"])
            if not cells:
                continue
            text = cells[0].get_text(strip=True)
            if text in ("名称", "数据名称", "字符串", ""):
                continue
            first_data_row = row
            break

        if not first_data_row:
            continue

        first_cell: Tag | None = first_data_row.td
        if not first_cell:
            continue

        first_text = first_cell.get_text(strip=True)
        if "." not in first_text:
            continue

        wiki_class_name = first_text.split(".", 1)[0]
        if wiki_class_name in SKIP_CLASSES:
            continue

        current_fields: list[str] = []
        for row in rows:
            field_cell: Tag | None = row.td
            if not field_cell or not field_cell.get_text(strip=True):
                continue
            field_text = field_cell.get_text(strip=True)
            if "." not in field_text:
                continue
            row_class = field_text.split(".", 1)[0]
            if row_class != wiki_class_name:
                continue
            current_fields.append(field_text.split(".", 1)[1])

        # 合并同名类的字段，去重
        if wiki_class_name in out_dict:
            existing = out_dict[wiki_class_name]
            for f in current_fields:
                if f not in existing:
                    existing.append(f)
        else:
            out_dict[wiki_class_name] = current_fields

    return out_dict


def main() -> None:
    """主函数"""
    init_stdout()

    if not os.path.exists(ENUM_LIB_FILE_PATH):
        print(f"错误：本地枚举文件不存在: {ENUM_LIB_FILE_PATH}")
        return

    print(f"分析本地文件: {ENUM_LIB_FILE_PATH}")
    local_enums = get_enum_definitions(ENUM_LIB_FILE_PATH)
    print(f"  本地共 {len(local_enums)} 个枚举类")

    print(f"抓取维基页面: {ENUM_LIB_URL}")
    web_enums = analyze_web(ENUM_LIB_URL)
    print(f"  网页共 {len(web_enums)} 个枚举类")

    diff_lines = compare_enums(local_enums, web_enums, skip_classes={"BLOCKID"})

    local_set = set(local_enums)
    web_set = set(web_enums)
    common = local_set & web_set
    only_local = local_set - web_set
    only_web = web_set - local_set

    print()
    summary = build_summary(
        "枚举对比",
        len(local_enums),
        len(web_enums),
        len(common),
        len(only_local),
        len(only_web),
    )
    for line in summary:
        print(line)
    print()
    for line in diff_lines:
        print(line)


if __name__ == "__main__":
    main()
