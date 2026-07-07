import requests
import sys
import io
import os
import re
from bs4 import BeautifulSoup, Tag

ENUM_LIB_URL: str = "https://dev-wiki.mini1.cn/ugc-wiki/apis/global.html"
ENUM_LIB_FILE_PATH: str = os.getcwd() + r"\multiple\\3.0\MNEnumLib.d.lua"
CLASS_RE: str = r"--- @class"
FIELD_RE: str = r"--- @field"
MINI: list[str] = [
    "Block",
    "Bool",
    "Buff",
    "Effect",
    "MobType",
    "Model",
    "Number",
    "Picture",
    "Sound",
    "String",
    "Vec3",
    "Color",
    "Item",
]


def init() -> None:
    """初始化
    Returns:
        None: 无返回值
    """
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")


def analyze_file(path: str) -> dict[str, list[str]]:
    """分析文件
    Args:
        path (str): 文件路径
    Returns:
        dict[str, list[str]]: 分析结果
    """
    out_dict: dict[str, list[str]] = {}
    class_name: str | None = None
    with open(path, "r", encoding="utf-8") as file:
        for line in file:
            if re.match(CLASS_RE, line):
                match: re.Match | None = re.search(r"--- @class (\w+)", line)
                if match:
                    current_class_name: str = match.group(1)
                    class_name: str | None = current_class_name
                    out_dict[current_class_name] = []
            elif re.match(FIELD_RE, line):
                match: re.Match | None = re.search(r"--- @field (\w+)", line)
                if match and class_name and class_name in out_dict:
                    field_name: str = match.group(1)
                    out_dict[class_name].append(field_name)

    return out_dict


def analyze_web(url: str) -> dict[str, list[str]]:
    """分析网页内容
    Args:
        url (str): 网页URL
    Returns:
        dict[str, list[str]]: 分析结果
    """
    out_dict: dict[str, list[str]] = {}
    response: requests.Response = requests.get(url, timeout=10)
    response.encoding = "utf-8"
    soup: BeautifulSoup = BeautifulSoup(response.text, "html.parser")
    all_enums: list[Tag] = soup.find_all("table", attrs={"tabindex": "0"})
    if all_enums:
        all_enums.pop(0)  # 移除第一个表格
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
        # 合并同名类的字段，避免重复覆盖（并去重）
        if class_name in out_dict:
            existing: list[str] = out_dict[class_name]
            for f in current_fields:
                if f not in existing:
                    existing.append(f)
        else:
            out_dict[class_name] = current_fields
    return out_dict


def compare_enums(local_enums: dict[str, list[str]], web_enums: dict[str, list[str]]) -> list[str]:
    """比较本地枚举定义和网页枚举定义之间的差异
    Args:
        local_enums (dict[str, list[str]]): 本地文件中的枚举定义
        web_enums (dict[str, list[str]]): 网页中的枚举定义
    Returns:
        list[str]: 差异描述列表
    """
    diff_lines: list[str] = []
    all_classes: list[str] = sorted(set(local_enums) | set(web_enums))
    for class_name in all_classes:
        local_fields: set[str] = set(local_enums.get(class_name, []))
        web_fields: set[str] = set(web_enums.get(class_name, []))
        if class_name not in local_enums:
            if class_name != "Mini":
                diff_lines.append(f"此class只在网页: {class_name}")
            continue
        if class_name not in web_enums:
            if class_name != "Mini":
                diff_lines.append(f"此class只在本地: {class_name}")
            continue
        only_local: list[str] = sorted(local_fields - web_fields)
        only_web: list[str] = sorted(web_fields - local_fields)
        if only_local or only_web:
            if class_name != "Mini":  # Mini类的差异不报告
                diff_lines.append(f"Class: {class_name}")
            for field in only_web:
                diff_lines.append(f"  此field只在网页: {field}")
            for field in only_local:
                if not (class_name == "Mini" and field in MINI):
                    diff_lines.append(f"  此field只在本地: {field}")
    return diff_lines


def main() -> None:
    """主函数
    Returns:
        None: 无返回值
    """
    init()
    local_enums: dict[str, list[str]] = analyze_file(ENUM_LIB_FILE_PATH)
    web_enums: dict[str, list[str]] = analyze_web(ENUM_LIB_URL)
    diff_lines: list[str] = compare_enums(local_enums, web_enums)

    if not diff_lines:
        print("没有不同之处，枚举定义完全一致")
        return

    print("发现的差异：")
    for line in diff_lines:
        print(line)


if __name__ == "__main__":
    main()
