import re
import sys
from pathlib import Path

import requests

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from common.io_utils import init_stdout
from common.lua_parser import get_enum_definitions
from common.compare import build_summary
from common.config import (
    TRIGGER_EVENT_URL_30,
    COMPONENT_EVENT_URL_30,
    MULTIPLE_30_DIR,
    IGNORE_EVENT_PARAMS,
)

TRIGGER_EVENT_URL = TRIGGER_EVENT_URL_30
COMPONENT_EVENT_URL = COMPONENT_EVENT_URL_30
LOCAL_FILE_PATH = str(MULTIPLE_30_DIR / "MNEvent.d.lua")
IGNORE_WEB_FIELDS = IGNORE_EVENT_PARAMS


def analyze_web(url: str) -> dict[str, list[str]]:
    """从指定 URL 的网页内容中提取事件定义

    在页面文本中查找 TriggerEvent/ObjectEvent/CurEventParam 的事件名。

    Args:
        url: 网页 URL

    Returns:
        {类名: [字段名列表]}
    """
    out_dict: dict[str, list[str]] = {}
    try:
        response = requests.get(url, timeout=10)
        response.encoding = "utf-8"
        text = response.text
    except Exception as e:
        print(f"请求失败: {url} -> {e}")
        return out_dict

    pattern = re.compile(r"(TriggerEvent|ObjectEvent|CurEventParam)\.([A-Za-z0-9_]+)")
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
        only_web = [f for f in only_web if f.lower() not in IGNORE_WEB_FIELDS]
        if only_local or only_web:
            diff_lines.append(f"[{class_name}]")
            if only_local:
                items = ", ".join(only_local)
                diff_lines.append(f"  仅在本地 ({len(only_local)}): {items}")
            if only_web:
                items = ", ".join(only_web)
                diff_lines.append(f"  仅在网页 ({len(only_web)}): {items}")

    return diff_lines


def main() -> None:
    init_stdout()
    if not Path(LOCAL_FILE_PATH).exists():
        print(f"本地文件不存在: {LOCAL_FILE_PATH}")
        return

    local = get_enum_definitions(LOCAL_FILE_PATH)
    web_trigger = analyze_web(TRIGGER_EVENT_URL)
    web_component = analyze_web(COMPONENT_EVENT_URL)

    web_all: dict[str, list[str]] = {}
    for d in (web_trigger, web_component):
        for k, v in d.items():
            web_all.setdefault(k, []).extend(v)

    local_set = set(local)
    web_set = set(web_all)
    common = local_set & web_set
    only_local = local_set - web_set
    only_web = web_set - local_set

    print()
    summary = build_summary(
        "事件对比",
        len(local_set),
        len(web_set),
        len(common),
        len(only_local),
        len(only_web),
    )
    for line in summary:
        print(line)
    print()

    diff = compare_events(local, web_all)
    for line in diff:
        print(line)


if __name__ == "__main__":
    main()
