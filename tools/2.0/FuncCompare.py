"""对比 2.0 本地声明文件与 2.0 网页 API 文档的函数差异"""

import requests
import sys
import io
import os
import re
from bs4 import BeautifulSoup, Tag

FUNC_URLS: dict[str, str] = {
    "Actor": "https://dev-wiki.mini1.cn/wiki/673b36183ffc6baf0859d3a0",
    "Area": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d38e",
    "Backpack": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d384",
    "Block": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d38a",
    "Buff": "https://dev-wiki.mini1.cn/wiki/673b36143ffc6baf0859d32f",
    "Chat": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d375",
    "CloudSever": "https://dev-wiki.mini1.cn/wiki/673b36153ffc6baf0859d348",
    "Creature": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d38d",
    "Customui": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d385",
    "DisPlayBoard": "https://dev-wiki.mini1.cn/wiki/673b36153ffc6baf0859d355",
    "Game": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d387",
    "GameRule": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d389",
    "Graphics": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d383",
    "Item": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d37b",
    "ListenParam": "https://dev-wiki.mini1.cn/wiki/673b36153ffc6baf0859d373",
    "MapMark": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d377",
    "MiniTimer": "https://dev-wiki.mini1.cn/wiki/673b36153ffc6baf0859d36e",
    "ObjectLib": "https://dev-wiki.mini1.cn/wiki/673b36143ffc6baf0859d32b",
    "Player": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d39c",
    "Spawnport": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d374",
    "Team": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d37a",
    "Timer": "https://dev-wiki.mini1.cn/wiki/673b36153ffc6baf0859d36e",
    "UI": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d388",
    "ValueGroup": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d37f",
    "VarLib": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d378",
    "World": "https://dev-wiki.mini1.cn/wiki/673b36173ffc6baf0859d390",
    "WorldContainer": "https://dev-wiki.mini1.cn/wiki/673b36163ffc6baf0859d37d",
}

# 2.0 声明文件所在目录
SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
FUNC_FILES_PATH: str = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir, "multiple", "2.0"))

# 匹配函数声明行
FUNCTION_RE: re.Pattern[str] = re.compile(r"^function\s+([A-Za-z_][\w\.:]*)")

# 网页函数名过滤黑名单（跳过非函数标题）
WEB_FILTER_BLACKLIST: set[str] = {
    "序号",
    "函数名",
    "函数描述",
    "参数及类型",
    "返回值及类型",
    "该方法的主要作用",
    "具体使用案例如下",
}


def init() -> None:
    """初始化输出编码"""
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
            line = line.strip()
            if not line.startswith("function "):
                continue
            match = FUNCTION_RE.match(line)
            if not match:
                continue
            function_name: str = match.group(1)
            if ":" in function_name:
                _, function_name = function_name.split(":", 1)
            out_funcs.add(function_name)
    return out_funcs


def analyze_web(url: str) -> set[str]:
    """从 2.0 网页 API 文档中提取函数名
    Args:
        url (str): 文档页面 URL
    Returns:
        set[str]: 函数名集合
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
                # 表格第二列通常是函数名
                func_cell = cells[1]
                func_text = func_cell.get_text(strip=True)
                # 清理函数名（去掉参数部分）
                func_name = re.sub(r"\(.*\)$", "", func_text).strip()
                if func_name and func_name not in WEB_FILTER_BLACKLIST:
                    # 只保留纯字母数字下划线的函数名
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
        filename (str): 文件名（如 MNActor.d.lua）
    Returns:
        str: 模块名称（如 Actor）
    """
    base = filename.replace(".d.lua", "")
    return base.replace("MN", "", 1) if base.startswith("MN") else base


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

    only_local = sorted(local_funcs - web_funcs)
    only_web = sorted(web_funcs - local_funcs)
    if only_local:
        diff_lines.append(f"[{module_name}] 仅在本地存在函数:")
        diff_lines.extend(f"  - {name}" for name in only_local)
    if only_web:
        diff_lines.append(f"[{module_name}] 仅在网页存在函数:")
        diff_lines.extend(f"  - {name}" for name in only_web)
    return diff_lines


def main() -> None:
    """主程序：对比本地声明和网页 API 文档函数"""
    init()

    if not os.path.exists(FUNC_FILES_PATH):
        print(f"错误：2.0 声明目录不存在: {FUNC_FILES_PATH}")
        return

    all_diff: list[str] = []

    # 收集本地所有 .d.lua 文件
    local_files: list[str] = sorted(f for f in os.listdir(FUNC_FILES_PATH) if f.endswith(".d.lua"))

    for filename in local_files:
        module_name: str = module_name_from_file(filename)
        local_path: str = os.path.join(FUNC_FILES_PATH, filename)

        # 读取本地函数
        local_funcs: set[str] = analyze_file(local_path)

        # 获取网页函数
        web_funcs: set[str] = set()
        # 尝试精确匹配（模块名大小写不敏感）
        matched_url: str | None = None
        for key, url in FUNC_URLS.items():
            if key.lower() == module_name.lower():
                matched_url = url
                break

        if matched_url:
            print(f"正在抓取 {module_name} 文档...")
            web_funcs = analyze_web(matched_url)
        else:
            all_diff.append(f"[{module_name}] 未配置网页文档 URL，仅显示本地函数。")

        diff = compare_funcs(local_funcs, web_funcs, module_name)
        if diff:
            all_diff.extend(diff)
        else:
            all_diff.append(f"[{module_name}] 本地与网页函数一致。")

    print("\n" + "=" * 60)
    print("函数差异对比结果:")
    print("=" * 60)
    for line in all_diff:
        print(line)

    # 统计
    only_local_count = sum(
        1 for l in all_diff if l.startswith("  - ") and "仅在本地" in all_diff[max(0, all_diff.index(l) - 1)]
    )
    print(f"\n总计: {len(local_files)} 个模块")
    if only_local_count:
        print(f"提示: 本地中存在但网页中未找到的函数，可能是本地扩展的自定义函数。")


if __name__ == "__main__":
    main()
