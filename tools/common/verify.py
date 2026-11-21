"""生成产物一致性校验：重新生成所有派生文件并与仓库现有文件逐字节比对。

用于发现「源声明改了但忘了重新生成」的漂移。不修改任何文件。
"""

from __future__ import annotations

from pathlib import Path

from common.annotation import strip_annotations
from common.config import (
    API_20_FILE,
    API_30_FILE,
    DECLARATIONS_DIR,
    MERGED_20_FILE,
    MERGED_30_FILE,
    MULTIPLE_20_DIR,
    MULTIPLE_30_DIR,
    ORDER_20,
    ORDER_30,
)
from common.merge import get_ordered_files
from common.models import VerifyItem, VerifyResult


def _merge_in_memory(folder: str, order: list[str]) -> str:
    """在内存中按与 merge_lua_files 相同的规则合并，不写磁盘。"""
    ordered = get_ordered_files(folder, order)
    parts: list[str] = []
    for filename in ordered:
        content = Path(folder, filename).read_text(encoding="utf-8")
        if not parts:
            parts.append(content)
        else:
            if not parts[-1].endswith(("\n", "\r")):
                parts.append("\n")
            parts.append(content)
    return "".join(parts)


def _compare(label: str, generated: str, target: Path) -> VerifyItem:
    """比对生成内容与目标文件；生成内容统一按目标文件的行尾风格归一。"""
    if not target.exists():
        return VerifyItem(name=label, ok=False, detail="目标文件不存在")
    actual = target.read_bytes()
    # 生成串用 \n，按目标文件是否使用 CRLF 归一化后比较
    normalized = generated.replace("\r\n", "\n")
    if b"\r\n" in actual:
        normalized = normalized.replace("\n", "\r\n")
    gen_bytes = normalized.encode("utf-8")
    if gen_bytes == actual:
        return VerifyItem(name=label, ok=True, detail=f"{len(actual)} 字节一致")
    # 给出首个差异行号，便于定位
    gen_lines = gen_bytes.decode("utf-8", "replace").splitlines()
    act_lines = actual.decode("utf-8", "replace").splitlines()
    first_diff = next(
        (i + 1 for i, (a, b) in enumerate(zip(gen_lines, act_lines)) if a != b),
        min(len(gen_lines), len(act_lines)) + 1,
    )
    return VerifyItem(
        name=label,
        ok=False,
        detail=f"内容不一致（首个差异约在第 {first_diff} 行，生成 {len(gen_lines)} 行 / 现有 {len(act_lines)} 行）",
    )


def _verify_event_table(version: str) -> VerifyItem:
    """校验事件表：与生成器共用 build_event_table_text，避免两套逻辑。"""
    from common.event_table import build_event_table_text

    target = DECLARATIONS_DIR / version / "MNEventTable.d.lua"
    try:
        text, _, _ = build_event_table_text(version)
        return _compare(f"{version} MNEventTable.d.lua", text, target)
    except Exception as e:  # noqa: BLE001
        return VerifyItem(name=f"{version} MNEventTable.d.lua", ok=False, detail=f"生成失败: {e}")


def verify_generated() -> VerifyResult:
    """重新生成全部派生文件并比对，返回校验结果（不改磁盘）。"""
    items: list[VerifyItem] = []

    for version, folder, order, merged_file, api_file in (
        ("2.0", MULTIPLE_20_DIR, ORDER_20, MERGED_20_FILE, API_20_FILE),
        ("3.0", MULTIPLE_30_DIR, ORDER_30, MERGED_30_FILE, API_30_FILE),
    ):
        try:
            merged = _merge_in_memory(str(folder), order)
            items.append(_compare(f"{version} merged", merged, merged_file))
            items.append(_compare(f"{version} API.txt", strip_annotations(merged), api_file))
        except Exception as e:  # noqa: BLE001
            items.append(VerifyItem(name=f"{version} merged/API.txt", ok=False, detail=f"生成失败: {e}"))
        items.append(_verify_event_table(version))

    return VerifyResult(success=all(i.ok for i in items), items=items)
