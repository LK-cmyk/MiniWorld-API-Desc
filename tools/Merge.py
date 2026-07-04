import os

SCRIPT_DIR: str = os.path.dirname(os.path.abspath(__file__))
ORDER_DEFINITION: list[str] = [  # 自定义顺序定义
    "MNGlobalFunc",  # 全局函数
    "MNEnumLib",  # 枚举库
    "MNData",  # 数据
    "MNTable",  # 表格
    "MNArray",  # 数组
    "MNComponent",  # 组件
    "MNEvent",  # 事件
    "MNTimer",  # 计时器
    "MNMod",  # 模组
    "MNWorldContainer",  # 世界容器
    "MNWorld",  # 世界
    "MNMap",  # 地图
    "MNBlock",  # 方块
    "MNGameObject",  # 游戏对象
    "MNActor",  # 角色
    "MNPlayer",  # 玩家
    "MNMonster",  # 怪物
    "MNArea",  # 区域
    "MNBuff",  # Buff
    "MNItem",  # 物品
    "MNBackpack",  # 背包
    "MNChat",  # 聊天
    "MNCustomUI",  # 自定义UI
    "MNGraphics",  # 图形
    "MNTimeline",  # 剧情动画
]


def get_ordered_files(folder_path: str) -> list[str]:
    """获取指定顺序的文件列表
    Args:
        folder_path (str): 文件夹路径
    Returns:
        list[str]: 有序文件列表
    """

    all_files: set[str] = {
        f for f in os.listdir(folder_path) if f.endswith(".lua")
    }  # 获取所有.lua文件（集合，O(1)查找）
    ordered_files: list[str] = []  # 用于存储有序文件列表
    for name in ORDER_DEFINITION:
        filename: str = f"{name}.d.lua"  # 构建当前名称对应的文件名
        if filename in all_files:
            ordered_files.append(filename)  # 将当前名称对应的文件添加到有序列表中
            all_files.discard(filename)  # 从集合中移除当前名称对应的文件（O(1)）

    if all_files:
        ordered_files.extend(sorted(all_files))  # 将剩余文件按字母顺序添加到有序列表末尾

    return ordered_files  # 返回有序文件列表


def merge_lua_files(folder_path: str, output_file: str) -> None:
    """合并多个.lua文件
    Args:
        folder_path (str): 文件夹路径
        output_file (str): 输出目标文件路径
    Returns:
        None: 无返回值
    """
    ordered_files: list[str] = get_ordered_files(folder_path)  # 获取有序文件列表

    if not ordered_files:  # 检查是否有文件
        print("错误：未找到任何.lua文件")
        return

    merged_parts: list[str] = []  # 用于存储合并后的内容
    total_lines: int = 0  # 统计总行数

    for filename in ordered_files:
        file_path: str = os.path.join(folder_path, filename)  # 构建文件路径

        try:
            with open(file_path, "r", encoding="utf-8") as f:
                content: str = f.read()  # 读取文件内容

            total_lines += content.count("\n") + (
                0 if content.endswith("\n") else 1
            )  # 统计行数（避免 split 创建临时列表）

            # 去除末尾换行/空白，保证 join 后每个文件之间恰好一个换行
            merged_parts.append(content.rstrip("\n\r"))

        except Exception as e:
            print(f"错误：处理文件 {filename} 时出错 - {e}")

    try:
        result: str = "\n".join(merged_parts)  # 文件之间恰好一个换行
        with open(output_file, "w", encoding="utf-8") as f:
            f.write(result)

        print(f"合并完成！合并了 {len(ordered_files)} 个文件，总 {total_lines} 行")
        print(f"输出文件：{output_file}")

    except Exception as e:
        print(f"错误：写入输出文件时出错 - {e}")


def main():
    """主函数
    Returns:
        None: 无返回值
    """
    folder_path: str = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir, "multiple"))  # 输入文件夹路径
    output_file: str = os.path.abspath(os.path.join(SCRIPT_DIR, os.pardir, "merged.lua"))  # 输出文件路径

    if not os.path.exists(folder_path):
        print(f"错误：文件夹 '{folder_path}' 不存在")
        return

    merge_lua_files(folder_path, output_file)  # 合并文件


if __name__ == "__main__":
    main()
