"""3.0 版本专用解析函数：从网页提取函数/枚举/事件数据

本模块仅提供纯数据采集函数，不包含任何编排或输出逻辑。
"""

from __future__ import annotations

import os
import re

import requests
from bs4 import BeautifulSoup, Tag

from common.config import (
    COMPONENT_EVENT_URL_30,
    ENUM_URL_30,
    FUNC_TITLE_FILTER_30,
    FUNC_URL_30_LIST,
    FUNC_URL_30_PREFIX,
    IGNORE_EVENT_PARAMS,
    MULTIPLE_30_DIR,
    TRIGGER_EVENT_URL_30,
)

# FuncCompare

FUNC_URL_START: str = FUNC_URL_30_PREFIX
FUNC_URL: list[str] = FUNC_URL_30_LIST
FUNC_FILES_PATH: str = str(MULTIPLE_30_DIR)


def func_analyze_web(url: str) -> set[str]:
    """从网页 API 文档中提取函数名
    从标题（h2/h3/h4）中提取纯函数名，若未找到则从 Markdown 表格中提取

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
        text: str = heading.get_text(strip=True)
        if not text:
            continue
        text: str = re.sub(r"[\u200b\u200c\u200d\ufeff]+", "", text)
        if not text:
            continue
        if re.fullmatch(r"[A-Za-z_]\w*", text) and text not in FUNC_TITLE_FILTER_30:
            out_funcs.add(text)

    # 降级方案：从表格中提取
    if not out_funcs:
        page_text = soup.get_text(separator="\n")
        for line in page_text.splitlines():
            line: str = line.strip()
            if not line.startswith("|"):
                continue
            parts: list[str] = [part.strip() for part in line.split("|")]
            if len(parts) >= 3 and parts[1].isdigit():
                func_part: str = re.sub(r"\(.*\)$", "", parts[2])
                if func_part:
                    out_funcs.add(func_part)
    return out_funcs


def func_local_file_for_module_name(module_name: str) -> str | None:
    """按模块名（大小写不敏感）在本地声明目录中解析真实文件名。

    磁盘上的文件名大小写并不统一（如 MNGameObject / MNTimeline / MNCustomUI），
    用 base.capitalize() 猜测会在大小写敏感的文件系统（Linux/CI）上误判为文件不存在。
    这里直接扫描目录、按小写匹配，返回真实路径；找不到返回 None。
    """
    target = f"mn{module_name.lower()}.d.lua"
    try:
        for filename in os.listdir(FUNC_FILES_PATH):
            if filename.lower() == target:
                return os.path.join(FUNC_FILES_PATH, filename)
    except OSError:
        return None
    return None


def func_module_name_from_url(url: str) -> str:
    """从文档 URL 推断模块名称
    Args:
        url: 文档 URL 的相对路径
    Returns:
        模块名称（用于展示），文件名解析请用 func_local_file_for_module_name
    """
    return os.path.splitext(os.path.basename(url))[0].capitalize()


def func_local_file_for_module(module_name: str) -> str:
    """从模块名生成本地声明文件路径（兼容旧调用）"""
    resolved = func_local_file_for_module_name(module_name)
    return resolved if resolved is not None else os.path.join(FUNC_FILES_PATH, f"MN{module_name}.d.lua")


# EnumLibCompare

ENUM_LIB_URL: str = ENUM_URL_30
ENUM_LIB_FILE_PATH: str = str(MULTIPLE_30_DIR / "MNEnumLib.d.lua")


def enum_analyze_web(url: str) -> dict[str, list[str]]:
    """从 3.0 网页枚举页面提取枚举定义
    表格格式要求 tabindex="0" 属性，且每行格式为 ClassName.FieldName
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


# EventCompare

TRIGGER_EVENT_URL: str = TRIGGER_EVENT_URL_30
COMPONENT_EVENT_URL: str = COMPONENT_EVENT_URL_30
LOCAL_FILE_PATH: str = str(MULTIPLE_30_DIR / "MNEvent.d.lua")
IGNORE_WEB_FIELDS: set[str] = IGNORE_EVENT_PARAMS


def event_analyze_web(url: str) -> dict[str, list[str]]:
    """从指定 URL 的网页内容中提取事件定义
    在页面文本中查找 TriggerEvent/ObjectEvent/CurEventParam 的事件名
    Args:
        url: 网页 URL
    Returns:
        {类名: [字段名列表]}
    """
    out_dict: dict[str, list[str]] = {}
    try:
        response: requests.Response = requests.get(url, timeout=10)
        response.encoding = "utf-8"
        text: str = response.text
    except Exception:
        return out_dict

    pattern: re.Pattern[str] = re.compile(r"(TriggerEvent|ObjectEvent|CurEventParam)\.([A-Za-z0-9_]+)")
    matches = pattern.findall(text)
    if not matches:
        return out_dict

    groups: dict[str, set[str]] = {}
    for cls, fld in matches:
        groups.setdefault(cls, set()).add(fld)

    for k, s in groups.items():
        out_dict[k] = sorted(s)

    return out_dict


def compare_events(local: dict[str, list[str]], web: dict[str, list[str]]) -> list[str]:
    """比较本地和网页的事件定义，生成差异描述列表
    Args:
        local: 本地事件定义 {类名: [字段名列表]}
        web: 网页事件定义 {类名: [字段名列表]}
    Returns:
        差异描述列表
    """
    diff_lines: list[str] = []
    all_classes: list[str] = sorted(set(local) | set(web))
    for class_name in all_classes:
        local_fields: set[str] = set(local.get(class_name, []))
        web_fields: set[str] = set(web.get(class_name, []))
        if class_name not in local:
            diff_lines.append(f"[{class_name}]  ⚠ 仅在网页（本地未收录）")
            continue
        if class_name not in web:
            diff_lines.append(f"[{class_name}]  ⚠ 仅在本地（网页未收录）")
            continue
        only_local: list[str] = sorted(local_fields - web_fields)
        only_web: list[str] = sorted(web_fields - local_fields)
        only_web: list[str] = [f for f in only_web if f.lower() not in IGNORE_WEB_FIELDS]
        if only_local or only_web:
            diff_lines.append(f"[{class_name}]")
            if only_local:
                items: str = ", ".join(only_local)
                diff_lines.append(f"  仅在本地 ({len(only_local)}): {items}")
            if only_web:
                items: str = ", ".join(only_web)
                diff_lines.append(f"  仅在网页 ({len(only_web)}): {items}")

    return diff_lines
