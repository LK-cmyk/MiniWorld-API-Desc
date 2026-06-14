import requests
import sys
import io
import os
import re
from bs4 import BeautifulSoup

FUNC_URL_START: str = "https://dev-wiki.mini1.cn/ugc-wiki/apis/"  # 文档 URL 前缀
FUNC_URL: list[str] = [  # 函数链接
    "world.html",
    "gameobject.html",
    "actor.html",
    "player.html",
    "monster.html",
    "block.html",
    "item.html",
    "backpack.html",
    "customui.html",
    "graphics.html",
    "area.html",
    "worldcontainer.html",
    "mod.html",
    "timer.html",
    "buff.html",
    "chat.html",
    "data.html",
    "array.html",
    "table.html",
    "map.html",
]
FUNC_FILES_PATH: str = os.path.join(os.getcwd(), "multiple")  # 本地声明文件所在目录
FUNCTION_RE: re.Pattern[str] = re.compile(
    r"^function\s+([A-Za-z_][\w\.:]*)"
)  # 匹配函数声明行，捕获函数名（支持冒号和点分隔的形式）
PAGE_FUNC_RE: re.Pattern[str] = re.compile(
    r'##\s*([A-Za-z_]\w*)Permalink to "([A-Za-z_]\w*)"'
)  # 匹配函数标题行，捕获函数名（可能包含 "Permalink to" 的格式）


def init() -> None:
    """初始化输出编码
    Returns:
        None: 无返回值
    """
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")


def analyze_file(path: str) -> set[str]:
    """从本地 Lua 声明文件中提取函数名
    Args:
        path (str): 本地文件路径
    Returns:
        set[str]: 函数名集合
    """
    out_funcs: set[str] = set()
    with open(path, "r", encoding="utf-8") as file:
        for line in file:
            line: str = line.strip()
            if not line.startswith("function "):
                continue
            match: re.Match[str] | None = FUNCTION_RE.match(line)
            if not match:
                continue
            function_name: str = match.group(1)
            if ":" in function_name:
                _, function_name = function_name.split(":", 1)
            out_funcs.add(function_name)
    return out_funcs


def analyze_web(url: str) -> set[str]:
    """从网页 API 文档中提取函数名
    Args:
        url (str): 文档 URL 的相对路径
    Returns:
        set[str]: 函数名集合
    """
    full_url: str = FUNC_URL_START + url
    response: requests.Response = requests.get(full_url, timeout=10)
    response.encoding = "utf-8"
    soup: BeautifulSoup = BeautifulSoup(response.text, "html.parser")
    out_funcs: set[str] = set()

    for heading in soup.find_all(["h2", "h3", "h4"]):
        text: str = heading.get_text(strip=True)
        if not text:
            continue
        text: str = re.sub(r"[\u200b\u200c\u200d\ufeff]+", "", text)
        if not text:
            continue
        if re.fullmatch(r"[A-Za-z_]\w*", text) and text not in {"World", "GameObject"}:
            out_funcs.add(text)

    if not out_funcs:
        page_text: str = soup.get_text(separator="\n")
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


def compare_funcs(local_funcs: set[str], web_funcs: set[str], module_name: str) -> list[str]:
    """比较本地和网页函数名，并返回差异行
    Args:
        local_funcs (set[str]): 本地函数名集合
        web_funcs (set[str]): 网页函数名集合
        module_name (str): 模块名称
    Returns:
        list[str]: 差异行列表
    """
    diff_lines: list[str] = []
    if not local_funcs and not web_funcs:
        diff_lines.append(f"[{module_name}] 未找到本地函数，也未提取到网页函数。")
        return diff_lines
    if not local_funcs:
        diff_lines.append(f"[{module_name}] 本地文件未解析到函数或本地文件缺失。")
    if not web_funcs:
        diff_lines.append(f"[{module_name}] 网页未解析到函数，请检查文档页面或解析规则。")
    only_local: list[str] = sorted(local_funcs - web_funcs)
    only_web: list[str] = sorted(web_funcs - local_funcs)
    if only_local:
        diff_lines.append(f"[{module_name}] 仅在本地存在函数:")
        diff_lines.extend(f"  - {name}" for name in only_local)
    if only_web:
        diff_lines.append(f"[{module_name}] 仅在网页存在函数:")
        diff_lines.extend(f"  - {name}" for name in only_web)
    return diff_lines


def module_name_from_url(url: str) -> str:
    """从文档 URL 推断模块名称
    Args:
        url (str): 文档 URL 的相对路径
    Returns:
        str: 模块名称
    """
    base: str = os.path.splitext(os.path.basename(url))[0]
    return base.capitalize()


def local_file_for_module(module_name: str) -> str:
    """从模块名生成本地声明文件路径
    Args:
        module_name (str): 模块名称
    Returns:
        str: 本地声明文件路径
    """
    return os.path.join(FUNC_FILES_PATH, f"MN{module_name}.d.lua")


def main() -> None:
    """主程序：对比本地声明和网页 API 文档函数
    Returns:
        None: 无返回值
    """
    init()  # 初始化环境
    all_diff: list[str] = []
    for url in FUNC_URL:
        module_name: str = module_name_from_url(url)
        local_path: str = local_file_for_module(module_name)
        web_funcs: set[str] = analyze_web(url)
        local_funcs: set[str] = set()
        if os.path.exists(local_path):
            local_funcs: set[str] = analyze_file(local_path)
        else:
            all_diff.append(f"[{module_name}] 本地文件不存在: {local_path}")
        diff: list[str] = compare_funcs(local_funcs, web_funcs, module_name)
        if diff:
            all_diff.extend(diff)
        else:
            all_diff.append(f"[{module_name}] 本地与网页函数一致。")

    if not all_diff:
        print("没有发现差异，所有函数一致。")
        return
    print("函数差异对比结果:")
    for line in all_diff:
        print(line)


if __name__ == "__main__":
    main()
