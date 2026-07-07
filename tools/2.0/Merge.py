"""合并 multiple/2.0 目录下的所有 .d.lua 文件为一个整体声明文件"""

import os

SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
INPUT_DIR: str = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir, "multiple", "2.0"))
OUTPUT_FILE: str = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir, "merged.2.0.lua"))

# 自定义合并顺序
ORDER_DEFINITION: list[str] = [
    "MNGame",  # 游戏
    "MNGameRule",  # 游戏规则
    "MNWorld",  # 世界
    "MNWorldContainer",  # 世界容器
    "MNBlock",  # 方块
    "MNActor",  # 角色
    "MNPlayer",  # 玩家
    "MNCreature",  # 生物
    "MNItem",  # 物品
    "MNBackpack",  # 背包
    "MNArea",  # 区域
    "MNBuff",  # 状态
    "MNChat",  # 聊天
    "MNCustomUI",  # 自定义UI
    "MNUI",  # UI
    "MNGraphics",  # 图形
    "MNTimer",  # 计时器
    "MNTeam",  # 队伍
    "MNObjectLib",  # 对象库
    "MNListenParam",  # 函数监听
    "MNVarLib",  # 变量库
    "MNValuegroup",  # 数值组
    "MNCloudSever",  # 云服数据存储
    "MNDisPlayBoard",  # 显示板
    "MNSpawnport",  # 出生点
    "MNMapMark",  # 小地图
]


def get_ordered_files(folder_path: str) -> list[str]:
    """获取指定顺序的文件列表
    Args:
        folder_path (str): 文件夹路径
    Returns:
        list[str]: 有序文件列表
    """
    all_files: set[str] = {f for f in os.listdir(folder_path) if f.endswith(".lua")}
    ordered_files: list[str] = []
    for name in ORDER_DEFINITION:
        filename: str = f"{name}.d.lua"
        if filename in all_files:
            ordered_files.append(filename)
            all_files.discard(filename)

    if all_files:
        ordered_files.extend(sorted(all_files))

    return ordered_files


def merge_lua_files(folder_path: str, output_file: str) -> None:
    """合并多个.lua文件
    Args:
        folder_path (str): 文件夹路径
        output_file (str): 输出目标文件路径
    """
    ordered_files: list[str] = get_ordered_files(folder_path)

    if not ordered_files:
        print(f"错误：在 '{folder_path}' 中未找到任何.lua文件")
        return

    merged_parts: list[str] = []
    total_lines: int = 0

    for filename in ordered_files:
        file_path: str = os.path.join(folder_path, filename)
        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content: str = f.read()

            total_lines += content.count("\n") + (0 if content.endswith("\n") else 1)

            if not merged_parts:
                merged_parts.append(content)
            else:
                if not merged_parts[-1].endswith(("\n", "\r")):
                    merged_parts.append("\n")
                merged_parts.append(content)

        except Exception as e:
            print(f"错误：处理文件 {filename} 时出错 - {e}")

    try:
        result: str = "".join(merged_parts)
        with open(output_file, "w", encoding="utf-8") as f:
            f.write(result)

        print(f"合并完成！合并了 {len(ordered_files)} 个文件，总 {total_lines} 行")
        print(f"输出文件：{output_file}")

    except Exception as e:
        print(f"错误：写入输出文件时出错 - {e}")


def main() -> None:
    """主函数"""
    if not os.path.exists(INPUT_DIR):
        print(f"错误：文件夹 '{INPUT_DIR}' 不存在")
        return

    merge_lua_files(INPUT_DIR, OUTPUT_FILE)


if __name__ == "__main__":
    main()
