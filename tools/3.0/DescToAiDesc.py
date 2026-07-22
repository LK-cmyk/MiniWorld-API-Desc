import os
import re

SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
INPUT_FILE: str = os.path.join(SCRIPT_DIR, "..", "..", "out", "merged.3.0.lua")
OUTPUT_DIR: str = os.path.join(
    SCRIPT_DIR, "..", "..", "docs", "miniworld-ugc-30", "references"
)
OUTPUT_FILE: str = os.path.join(OUTPUT_DIR, "API.txt")

# 匹配 "--- @" 开头的注释行，仅剔除 @tag 本身（如 @return、@param），保留后方类型和描述
# 例如: "--- @return table @解码后的Table数据" → "--- table @解码后的Table数据"
ANNOTATION_TAG_RE: re.Pattern[str] = re.compile(
    r"^([ \t]*---[ \t]*)@\w+\b[ \t]*", re.MULTILINE
)

# 移除 "---" 注释行中残留的 "@" 符号（描述文字前的 @ 标记）
REMOVE_AT_SIGN_RE: re.Pattern[str] = re.compile(r"^[ \t]*---.*$", re.MULTILINE)

# 匹配无内容的注释行 (移除 @ 后只剩 "---" )
EMPTY_COMMENT_LINE_RE: re.Pattern[str] = re.compile(
    r"^[ \t]*---[ \t]*\r?\n", re.MULTILINE
)


def strip_annotations(content: str) -> str:
    """剔除 LuaLS 注释中的 @tag，并移除所有 @ 符号，清理空注释行
    Args:
        content: 原始文件内容
    Returns:
        处理后的文件内容
    """
    # 仅剔除 @tag 本身 (如 @return → 空, 保留 table)
    content = ANNOTATION_TAG_RE.sub(r"\1", content)
    # 移除 "---" 行中残留的 @ 符号 (描述文字前的 @ 标记)
    content = REMOVE_AT_SIGN_RE.sub(lambda m: m.group(0).replace("@", ""), content)
    # 移除无内容的注释行
    content = EMPTY_COMMENT_LINE_RE.sub("", content)
    # 处理文件末尾可能残留的无内容注释行 (无换行符的情况)
    content = re.sub(r"^[ \t]*---[ \t]*$", "", content, flags=re.MULTILINE)
    return content


def main() -> None:
    """主函数"""
    # 读取输入文件
    with open(INPUT_FILE, "r", encoding="utf-8") as f:
        content: str = f.read()
    result: str = strip_annotations(content)  # 移除注释中的 @annotation

    # 写入输出文件
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write(result)

    print(f"处理完成！")
    print(f"输入: {os.path.normpath(INPUT_FILE)}")
    print(f"输出: {os.path.normpath(OUTPUT_FILE)}")


if __name__ == "__main__":
    main()
