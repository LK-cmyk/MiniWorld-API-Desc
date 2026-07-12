"""将 multiple/2.0 合并后的声明文件转换为 AI 描述文件（去除 @annotation 标记）"""

import os
import re

SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
INPUT_FILE: str = os.path.join(SCRIPT_DIR, "..", "..", "merged.2.0.lua")
OUTPUT_DIR: str = os.path.join(SCRIPT_DIR, "..", "..", "AiDesc", "2.0")
OUTPUT_FILE: str = os.path.join(OUTPUT_DIR, "MNAiDesc.2.0.txt")

ANNOTATION_TAG_RE: re.Pattern[str] = re.compile(r"^([ \t]*---[ \t]*)@\w+\b[ \t]*", re.MULTILINE)
REMOVE_AT_SIGN_RE: re.Pattern[str] = re.compile(r"^[ \t]*---.*$", re.MULTILINE)
EMPTY_COMMENT_LINE_RE: re.Pattern[str] = re.compile(r"^[ \t]*---[ \t]*\r?\n", re.MULTILINE)


def strip_annotations(content: str) -> str:
    """剔除 LuaLS 注释中的 @tag，并清理空注释行
    Args:
        content: 原始文件内容
    Returns:
        处理后的文件内容
    """
    content = ANNOTATION_TAG_RE.sub(r"\1", content)
    content = REMOVE_AT_SIGN_RE.sub(lambda m: m.group(0).replace("@", ""), content)
    content = EMPTY_COMMENT_LINE_RE.sub("", content)
    content = re.sub(r"^[ \t]*---[ \t]*$", "", content, flags=re.MULTILINE)
    return content


def main() -> None:
    """主函数"""
    if not os.path.exists(INPUT_FILE):
        print(f"输入文件不存在: {INPUT_FILE}")
        print("请先运行 Merge.py 生成 merged.2.0.lua 文件")
        return

    with open(INPUT_FILE, "r", encoding="utf-8") as f:
        content = f.read()

    result = strip_annotations(content)

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write(result)

    print(f"处理完成！")
    print(f"输入: {os.path.normpath(INPUT_FILE)}")
    print(f"输出: {os.path.normpath(OUTPUT_FILE)}")


if __name__ == "__main__":
    main()
