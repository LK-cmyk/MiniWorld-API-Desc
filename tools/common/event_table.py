"""从事件源数据生成 MNEventTable.d.lua（事件回调参数表）

- 3.0：从 declarations/3.0/MNEvent.d.lua 的 `--- @field <事件名> EventInfo.<类>.<事件> @<说明> {参数}` 行生成
- 2.0：从 declarations/2.0/MNEvent.d.json 的事件定义生成

输出格式与仓库中既有文件保持一致（CRLF、事件块间空行、2.0 尾部统计行）。
"""

from __future__ import annotations

import json
import re
from dataclasses import dataclass

from common.config import DECLARATIONS_DIR


@dataclass
class EventTableResult:
    """事件表生成结果"""

    success: bool
    output_file: str = ""
    event_count: int = 0
    field_count: int = 0
    error: str = ""


# 3.0 事件字段行：`--- @field <事件名> EventInfo.<类>.<事件> @<说明> {参数}`
_RE_30_FIELD = re.compile(
    r"^--- @field (\w+) (EventInfo\.(?:TriggerEvent|ObjectEvent)\.\w+) @?(.*?)\s*\{(.*)\}\s*$"
)
# 分组参数：`x,y,z:说明`  →  展开为 x/y/z 三个字段
_RE_PARAM_GROUP = re.compile(r"^([\w,]+)\s*[:：]\s*(.*)$")


def _parse_params_30(raw: str) -> list[tuple[str, str]]:
    """解析 {…} 内的参数，展开 x,y,z 分组，保留顺序。

    参数形如 `hour:小时, second:分钟, x,y,z:事件中的位置`。
    分组名（逗号连接）共用一个说明；需先按 `:` 切出「名字列表 : 说明」，
    再把名字列表按逗号展开，不能先按逗号整体切分（否则 x/y 会丢说明）。
    """
    raw = raw.strip()
    if not raw:
        return []
    out: list[tuple[str, str]] = []
    pending_names: list[str] = []
    for token in raw.split(","):
        token = token.strip()
        if not token:
            continue
        if ":" in token or "：" in token:
            # 该 token 携带说明；形如 `z:事件中的位置`
            idx = min(
                i for i in (token.find(":"), token.find("：")) if i >= 0
            )
            sep = ":" if token.find(":") == idx else "："
            name_part, desc = token.split(sep, 1)
            names = pending_names + [name_part.strip()]
            for name in names:
                if name:
                    out.append((name, desc.strip()))
            pending_names = []
        else:
            # 说明还没出现（分组名的前段，如 x、y）
            pending_names.append(token)
    # 尾部无说明的孤立名字
    for name in pending_names:
        out.append((name, ""))
    return out


def _events_30() -> list[tuple[str, str, list[tuple[str, str]]]]:
    """从 3.0 MNEvent.d.lua 提取 (类名, 说明, 字段列表)，保持源文件顺序。"""
    src = DECLARATIONS_DIR / "3.0" / "MNEvent.d.lua"
    events: list[tuple[str, str, list[tuple[str, str]]]] = []
    for line in src.read_text(encoding="utf-8").splitlines():
        m = _RE_30_FIELD.match(line)
        if not m:
            continue
        _, class_name, desc, params = m.groups()
        events.append((class_name, desc.strip(), _parse_params_30(params)))
    return events


def _events_20() -> list[tuple[str, str, list[tuple[str, str]]]]:
    """从 2.0 MNEvent.d.json 提取 (类名, 说明, 字段列表)，保持 JSON 顺序。"""
    src = DECLARATIONS_DIR / "2.0" / "MNEvent.d.json"
    data = json.loads(src.read_text(encoding="utf-8"))
    events: list[tuple[str, str, list[tuple[str, str]]]] = []
    for event_key, info in data.items():
        class_name = "EventInfo." + event_key.replace(".", "_")
        desc = info.get("desc", "")
        fields = [(name, d) for name, d in info.get("event_info", {}).items()]
        events.append((class_name, desc, fields))
    return events


def build_event_table_text(version: str) -> tuple[str, int, int]:
    """构建事件表文本（纯函数，不写磁盘）。

    Returns:
        (文本, 事件数, 字段数)。文本使用 CRLF 行尾并保留末尾换行，
        与仓库既有文件逐字节一致，供生成与校验共用。
    """
    if version == "3.0":
        events = _events_30()
        header = (
            "--- MiniWorld UGC 3.0 事件回调参数表（由 MNEvent.d.lua 的事件描述生成）\n"
            "--- 事件注册回调的 event 参数类型由事件常量推断，此处定义各事件实际携带的字段。\n"
        )
    elif version == "2.0":
        events = _events_20()
        header = (
            "--- MiniWorld UGC 2.0 事件回调参数表（由 MNEvent.d.json 生成）\n"
            "--- 事件名中的点号在类名里用下划线表示，如 Player.ClickBlock → EventInfo.Player_ClickBlock。\n"
        )
    else:
        raise ValueError(f"不支持的版本: {version}")

    blocks: list[str] = []
    field_count = 0
    for class_name, desc, fields in events:
        lines = [f"--- @class {class_name} @{desc}"]
        for name, field_desc in fields:
            lines.append(f"--- @field {name} any @{field_desc}")
            field_count += 1
        blocks.append("\n".join(lines))

    # 块之间以空行分隔
    body = "\n\n".join(blocks)
    text = header + "\n" + body
    if version == "2.0":
        text += f"\n\n-- {len(events)} events, {field_count} fields"

    # 统一 CRLF 行尾（与既有文件一致），并保持文件末尾有一个换行
    text = text.replace("\r\n", "\n").replace("\n", "\r\n") + "\r\n"
    return text, len(events), field_count


def generate_event_table(version: str) -> EventTableResult:
    """生成指定版本的 MNEventTable.d.lua，写入声明目录。"""
    if version not in ("2.0", "3.0"):
        return EventTableResult(success=False, error=f"不支持的版本: {version}")

    try:
        text, event_count, field_count = build_event_table_text(version)
        out_path = DECLARATIONS_DIR / version / "MNEventTable.d.lua"
        out_path.write_bytes(text.encode("utf-8"))
        return EventTableResult(
            success=True,
            output_file=str(out_path),
            event_count=event_count,
            field_count=field_count,
        )
    except Exception as e:  # noqa: BLE001
        return EventTableResult(success=False, error=str(e))
