import requests
import sys
import io
import os
import re
from bs4 import BeautifulSoup
from typing import Optional, Dict, List, Any

ENUM_LIB_URL: str = "https://dev-wiki.mini1.cn/ugc-wiki/apis/global.html"
ENUM_LIB_FILE_PATH: str = os.getcwd() + r"\multiple\MNEnumLib.d.lua"
CLASS_RE = r'--- @class'
FIELD_RE = r'--- @field'

def init() -> None:
    """初始化
    Returns:
        None: 无返回值
    """
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

def analyze_file(path: str) -> Dict[str, list[str]]:
    """分析文件
    Args:
        path (str): 文件路径
    Returns:
        Dict[str, list[str]]: 分析结果
    """
    out_dict: Dict[str, list[str]] = {}
    with open(path, 'r', encoding='utf-8') as file:
        for line in file:
            if re.match(CLASS_RE, line):
                class_name: str = re.search(r'--- @class (\w+)', line).group(1)
                out_dict[class_name] = []
            elif re.match(FIELD_RE, line):
                field_name: str = re.search(r'--- @field (\w+)', line).group(1)
                if class_name in out_dict:
                    out_dict[class_name].append(field_name)

    return out_dict

def analyze_web(url: str) -> Dict[str, list[str]]:
    """分析网页内容
    Args:
        url (str): 网页URL
    Returns:
        Dict[str, list[str]]: 分析结果
    """
    out_dict: Dict[str, list[str]] = {}
    response: requests.Response = requests.get(url, timeout=10)
    response.encoding = 'utf-8'
    soup: BeautifulSoup = BeautifulSoup(response.text, 'html.parser')
    all_enums: List[BeautifulSoup] = soup.find_all('table', attrs={'tabindex': '0'})
    if all_enums:
        all_enums.pop(0)  # 移除第一个表格
    current_class: str = ""
    for enum in all_enums:
        class_name: str = enum.tbody.tr.td.text.strip().split('.')[0]
        if class_name != current_class:
            current_class = class_name
            current_fields: List[str] = []
            for field in enum.tbody.find_all('tr'):
                current_fields.append(field.td.text.strip().split('.')[1])
            out_dict[current_class] = current_fields
    return out_dict


def compare_enums(local_enums: Dict[str, list[str]], web_enums: Dict[str, list[str]]) -> list[str]:
    """比较本地枚举定义和网页枚举定义之间的差异
    Args:
        local_enums (Dict[str, list[str]]): 本地文件中的枚举定义
        web_enums (Dict[str, list[str]]): 网页中的枚举定义
    Returns:
        list[str]: 差异描述列表
    """
    diff_lines: list[str] = []
    all_classes = sorted(set(local_enums) | set(web_enums))
    for class_name in all_classes:
        local_fields = set(local_enums.get(class_name, []))
        web_fields = set(web_enums.get(class_name, []))
        if class_name not in local_enums:
            diff_lines.append(f'此class只在网页: {class_name}')
            continue
        if class_name not in web_enums:
            diff_lines.append(f'此class只在本地: {class_name}')
            continue
        only_local = sorted(local_fields - web_fields)
        only_web = sorted(web_fields - local_fields)
        if only_local or only_web:
            diff_lines.append(f'Class: {class_name}')
            for field in only_local:
                diff_lines.append(f'  此field只在本地: {field}')
            for field in only_web:
                diff_lines.append(f'  此field只在网页: {field}')
    return diff_lines


def main() -> None:
    """主函数
    Returns:
        None: 无返回值
    """
    init()
    local_enums = analyze_file(ENUM_LIB_FILE_PATH)
    web_enums = analyze_web(ENUM_LIB_URL)
    diff_lines = compare_enums(local_enums, web_enums)

    if not diff_lines:
        print('没有不同之处，枚举定义完全一致')
        return

    print('Differences found:')
    for line in diff_lines:
        print(line)

if __name__ == "__main__":
    main()