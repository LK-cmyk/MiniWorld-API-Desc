import sys
from pathlib import Path

import requests
from bs4 import BeautifulSoup, Tag

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common.io_utils import init_stdout
from common.lua_parser import get_enum_definitions
from common.compare import compare_enums, build_summary
from common.config import ENUM_URL_30, MULTIPLE_30_DIR, MINI_FIELDS_30

ENUM_LIB_URL = ENUM_URL_30
ENUM_LIB_FILE_PATH = str(MULTIPLE_30_DIR / "MNEnumLib.d.lua")
MINI_FIELDS = MINI_FIELDS_30


def analyze_web(url: str) -> dict[str, list[str]]:
    """从 3.0 网页枚举页面提取枚举定义

    表格格式要求 tabindex="0" 属性，且每行格式为 ClassName.FieldName。

    Args:
        url: 网页 URL

    Returns:
        {类名: [字段名列表]}
    """
    out_dict: dict[str, list[str]] = {}
    response = requests.get(url, timeout=10)
    response.encoding = "utf-8"
    soup = BeautifulSoup(response.text, "html.parser")
    all_enums: list[Tag] = soup.find_all("table", attrs={"tabindex": "0"})
    if all_enums:
        all_enums.pop(0)  # 移除第一个表格（非枚举表）

    for enum in all_enums:
        tbody: Tag | None = enum.tbody
        if not tbody:
            continue

        first_row: Tag | None = tbody.tr
        if not first_row:
            continue

        first_cell: Tag | None = first_row.td
        if not first_cell or not first_cell.text:
            continue

        first_text: str = first_cell.text.strip()
        if "." not in first_text:
            continue

        class_name: str = first_text.split(".", 1)[0]
        current_fields: list[str] = []
        for field in tbody.find_all("tr"):
            field_cell: Tag | None = field.td
            if not field_cell or not field_cell.text:
                continue
            field_text: str = field_cell.text.strip()
            if "." not in field_text:
                continue
            current_fields.append(field_text.split(".", 1)[1])

        # 合并同名类的字段，去重
        if class_name in out_dict:
            existing: list[str] = out_dict[class_name]
            for f in current_fields:
                if f not in existing:
                    existing.append(f)
        else:
            out_dict[class_name] = current_fields
    return out_dict


def main() -> None:
    """主函数"""
    init_stdout()
    local_enums = get_enum_definitions(ENUM_LIB_FILE_PATH)
    web_enums = analyze_web(ENUM_LIB_URL)

    diff_lines = compare_enums(
        local_enums,
        web_enums,
        skip_web_only_classes={"Mini"},
        skip_local_only_classes={"Mini"},
        skip_fields={"Mini": MINI_FIELDS},
    )

    local_set = set(local_enums) - {"Mini"}
    web_set = set(web_enums) - {"Mini"}
    common = local_set & web_set
    only_local = local_set - web_set
    only_web = web_set - local_set

    print()
    summary = build_summary(
        "枚举对比",
        len(local_set),
        len(web_set),
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
