"""通用对比逻辑：函数名差异、枚举定义差异

统一输出格式说明：
  [SectionName]                      ← 章节标题
    仅在本地 (n): item1, item2       ← 本地独有（逗号分隔）
    仅在网页 (n): item1, item2       ← 网页独有（逗号分隔）
  [SectionName]  ✓ 完全一致          ← 无差异
  [SectionName]  ⚠ 仅在本地（网页未收录）  ← 整节仅本地有
  [SectionName]  ⚠ 仅在网页（本地未收录）  ← 整节仅网页有
"""

SEP: str = "─" * 60


def _fmt_set(items: list[str]) -> str:
    """将列表格式化为带计数的逗号分隔字符串"""
    count = len(items)
    return (
        f"({count}): {', '.join(items)}"
        if count <= 10
        else f"({count}): {', '.join(items[:5])} ... 等 {count} 项"
    )


def _wrap(
    items: list[str], label_local: str = "本地", label_web: str = "网页"
) -> list[str]:
    """生成统一格式的差异行"""
    lines: list[str] = []
    if items[0]:
        lines.append(f"  仅在{label_local} {_fmt_set(items[0])}")
    if items[1]:
        lines.append(f"  仅在{label_web} {_fmt_set(items[1])}")
    return lines


def compare_funcs(
    local_funcs: set[str], web_funcs: set[str], module_name: str
) -> list[str]:
    """比较本地和网页函数名，返回差异描述行

    Args:
        local_funcs: 本地函数名集合
        web_funcs: 网页函数名集合
        module_name: 模块名称（用于输出标识）

    Returns:
        差异描述行列表
    """
    diff_lines: list[str] = []
    if not local_funcs and not web_funcs:
        diff_lines.append(f"[{module_name}]  ⚠ 未找到任何函数")
        return diff_lines
    if not local_funcs:
        diff_lines.append(f"[{module_name}]  ⚠ 仅在网页（本地未收录）")
        # 但仍列出网页独有函数
        only_web = sorted(web_funcs)
        diff_lines.extend(_wrap([[], only_web], "本地", "网页"))
        return diff_lines
    if not web_funcs:
        diff_lines.append(f"[{module_name}]  ⚠ 仅在本地（网页未收录）")
        only_local = sorted(local_funcs)
        diff_lines.extend(_wrap([only_local, []], "本地", "网页"))
        return diff_lines

    only_local = sorted(local_funcs - web_funcs)
    only_web = sorted(web_funcs - local_funcs)

    if not only_local and not only_web:
        diff_lines.append(f"[{module_name}]  ✓ 完全一致")
        return diff_lines

    no_local = not local_funcs
    no_web = not web_funcs
    if no_local:
        diff_lines.append(f"[{module_name}]  ⚠ 仅在网页（本地未收录）")
    elif no_web:
        diff_lines.append(f"[{module_name}]  ⚠ 仅在本地（网页未收录）")
    else:
        diff_lines.append(f"[{module_name}]")
    diff_lines.extend(_wrap([only_local, only_web], "本地", "网页"))
    return diff_lines


def compare_enums(
    local_enums: dict[str, list[str]],
    web_enums: dict[str, list[str]],
    skip_classes: set[str] | None = None,
    skip_web_only_classes: set[str] | None = None,
    skip_local_only_classes: set[str] | None = None,
    skip_fields: dict[str, set[str]] | None = None,
) -> list[str]:
    """比较本地枚举定义和网页枚举定义之间的差异

    Args:
        local_enums: 本地文件中的枚举定义 {类名: [字段名列表]}
        web_enums: 网页中的枚举定义 {类名: [字段名列表]}
        skip_classes: 完全跳过对比的类名集合
        skip_web_only_classes: 不报告"仅在网页"的类名集合
        skip_local_only_classes: 不报告"仅在本地"的类名集合
        skip_fields: 跳过特定类的特定字段 {类名: {字段名集合}}

    Returns:
        差异描述列表
    """
    skip_classes = skip_classes or set()
    skip_web_only_classes = skip_web_only_classes or set()
    skip_local_only_classes = skip_local_only_classes or set()
    skip_fields = skip_fields or {}

    diff_lines: list[str] = []
    all_classes: list[str] = sorted(set(local_enums) | set(web_enums))

    for class_name in all_classes:
        if class_name in skip_classes:
            continue

        local_fields: set[str] = set(local_enums.get(class_name, []))
        web_fields: set[str] = set(web_enums.get(class_name, []))

        # 排除需要跳过的字段
        skipped = skip_fields.get(class_name, set())
        local_fields -= skipped
        web_fields -= skipped

        if class_name not in local_enums:
            if class_name not in skip_web_only_classes:
                diff_lines.append(f"[{class_name}]  ⚠ 仅在网页（本地未收录）")
            continue
        if class_name not in web_enums:
            if class_name not in skip_local_only_classes:
                diff_lines.append(f"[{class_name}]  ⚠ 仅在本地（网页未收录）")
            continue

        only_local: list[str] = sorted(local_fields - web_fields)
        only_web: list[str] = sorted(web_fields - local_fields)

        if not only_local and not only_web:
            continue  # 完全一致不输出
        diff_lines.append(f"[{class_name}]")
        diff_lines.extend(_wrap([only_local, only_web], "本地", "网页"))

    return diff_lines


def build_summary(
    title: str,
    local_count: int,
    web_count: int,
    common_count: int,
    only_local_count: int,
    only_web_count: int,
) -> list[str]:
    """构建统一的统计摘要行列表

    Args:
        title: 摘要标题（如 "函数对比"、"枚举对比"）
        local_count: 本地实体数
        web_count: 网页实体数
        common_count: 共同实体数
        only_local_count: 仅本地实体数
        only_web_count: 仅网页实体数

    Returns:
        格式化的统计摘要行列表
    """
    lines = [
        SEP,
        f"  {title}",
        SEP,
        f"  本地:     {local_count:>4}",
        f"  网页:     {web_count:>4}",
        f"  共同:     {common_count:>4}",
        f"  仅本地:   {only_local_count:>4}",
        f"  仅网页:   {only_web_count:>4}",
        SEP,
    ]
    return lines
