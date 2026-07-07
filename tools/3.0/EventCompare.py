import requests
import sys
import io
import os
import re

TRIGGER_EVENT_URL: str = "https://dev-wiki.mini1.cn/ugc-wiki/apis/triggerevent.html"  # 触发器事件定义页面 URL
COMPONENT_EVENT_URL: str = "https://dev-wiki.mini1.cn/ugc-wiki/apis/componentevent.html"  # 组件事件定义页面 URL
LOCAL_FILE_PATH: str = os.path.join(os.getcwd(), "multiple", "3.0", "MNEvent.d.lua")  # 本地事件声明文件路径
IGNORE_WEB_FIELDS: set[str] = {"eventworldid"}  # 不希望报差异的字段
CLASS_RE: str = r"--- @class"
FIELD_RE: str = r"--- @field"


def init() -> None:
    """初始化环境，设置输出编码为 UTF-8
    Returns:
        None: 无返回值
    """
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")


def analyze_file(path: str) -> dict[str, list[str]]:
    """从本地 Lua 声明文件中提取事件定义
    Args:
        path (str): 本地文件路径
    Returns:
        dict[str, list[str]]: 事件定义字典
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
    """从指定 URL 的网页内容中提取事件定义
    Args:
        url (str): 网页 URL
    Returns:
        dict[str, list[str]]: 事件定义字典
    """
    out_dict: dict[str, list[str]] = {}
    try:
        response: requests.Response = requests.get(url, timeout=10)
        response.encoding = "utf-8"
        text = response.text
    except Exception as e:
        print(f"请求失败: {url} -> {e}")
        return out_dict

    # 更稳健的解析：直接在页面文本中查找 TriggerEvent/ObjectEvent/CurEventParam 的条目
    # 只匹配 ASCII 字母/数字/下划线的事件名，避免捕获中文描述
    pattern: re.Pattern = re.compile(r"(TriggerEvent|ObjectEvent|CurEventParam)\.([A-Za-z0-9_]+)")
    matches: list[tuple[str, str]] = pattern.findall(text)
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
        local (dict[str, list[str]]): 本地事件定义，键为类名，值为字段列表
        web (dict[str, list[str]]): 网页事件定义，键为类名，值为字段列表
    Returns:
        list[str]: 差异描述列表
    """
    diff_lines: list[str] = []
    all_classes: list[str] = sorted(set(local) | set(web))
    for class_name in all_classes:
        local_fields: set[str] = set(local.get(class_name, []))
        web_fields: set[str] = set(web.get(class_name, []))
        if class_name not in local:
            diff_lines.append(f"此class只在网页: {class_name}")
            continue
        if class_name not in web:
            diff_lines.append(f"此class只在本地: {class_name}")
            continue
        only_local: list[str] = sorted(local_fields - web_fields)
        only_web: list[str] = sorted(web_fields - local_fields)
        # 过滤掉不需要报告的网页字段（全部小写比较）
        only_web = [f for f in only_web if f.lower() not in IGNORE_WEB_FIELDS]
        if only_local or only_web:
            diff_lines.append(f"Class: {class_name}")
            for f in only_local:
                diff_lines.append(f"  此field只在本地: {f}")
            for f in only_web:
                diff_lines.append(f"  此field只在网页: {f}")

    return diff_lines


def main() -> None:
    init()  # 初始化环境
    if not os.path.exists(LOCAL_FILE_PATH):
        print(f"本地文件不存在: {LOCAL_FILE_PATH}")
        return

    print("解析本地文件...")
    local: dict[str, list[str]] = analyze_file(LOCAL_FILE_PATH)

    print("从 triggerevent 页面抓取...")
    web_trigger: dict[str, list[str]] = analyze_web(TRIGGER_EVENT_URL)

    print("从 componentevent 页面抓取...")
    web_component: dict[str, list[str]] = analyze_web(COMPONENT_EVENT_URL)

    # 合并网页结果（可能包含不同 class）
    web_all: dict[str, list[str]] = {}
    for d in (web_trigger, web_component):
        for k, v in d.items():
            web_all.setdefault(k, []).extend(v)

    diff: list[str] = compare_events(local, web_all)
    if not diff:
        print("没有不同之处，事件定义完全一致")
        return

    print("发现的差异：")
    for line in diff:
        print(line)


if __name__ == "__main__":
    main()
