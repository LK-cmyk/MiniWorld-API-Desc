"""合并 declarations 目录下的 .d.lua 文件为单个声明文件"""

import os
from dataclasses import dataclass, field


@dataclass
class MergeOutcome:
    """合并结果：内容、被跳过的文件、总行数"""

    content: str = ""
    skipped_files: list[str] = field(default_factory=list)
    total_lines: int = 0


def get_ordered_files(folder_path: str, order_definition: list[str]) -> list[str]:
    """获取指定顺序的文件列表

    按 order_definition 的顺序排列 .lua 文件，
    未在定义中的文件按字母顺序追加到末尾

    Args:
        folder_path: 文件夹路径
        order_definition: 自定义顺序定义（模块名列表，不含 .d.lua 后缀）
    Returns:
        有序文件列表
    """
    all_files: set[str] = {f for f in os.listdir(folder_path) if f.endswith(".lua")}
    ordered_files: list[str] = []
    for name in order_definition:
        filename: str = f"{name}.d.lua"
        if filename in all_files:
            ordered_files.append(filename)
            all_files.discard(filename)

    if all_files:
        ordered_files.extend(sorted(all_files))

    return ordered_files


def merge_lua_files(folder_path: str, output_file: str, order_definition: list[str]) -> MergeOutcome:
    """合并多个 .lua 文件

    Args:
        folder_path: 文件夹路径
        output_file: 输出目标文件路径
        order_definition: 合并顺序定义
    Returns:
        MergeOutcome：合并内容、被跳过（读取失败）的文件列表、总行数
    """
    ordered_files: list[str] = get_ordered_files(folder_path, order_definition)

    if not ordered_files:
        return MergeOutcome()

    merged_parts: list[str] = []
    skipped: list[str] = []
    total_lines: int = 0

    for filename in ordered_files:
        file_path: str = os.path.join(folder_path, filename)
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content: str = f.read()
        except Exception:
            skipped.append(filename)
            continue

        total_lines += content.count("\n") + (0 if content.endswith("\n") else 1)

        if not merged_parts:
            merged_parts.append(content)
        else:
            if not merged_parts[-1].endswith(("\n", "\r")):
                merged_parts.append("\n")
            merged_parts.append(content)

    result: str = "".join(merged_parts)
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(result)

    return MergeOutcome(content=result, skipped_files=skipped, total_lines=total_lines)
