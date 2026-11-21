#!/usr/bin/env python3
"""MiniWorld API 差异查看主程序

提供统一的 CLI 入口，所有输出统一由本模块处理。
各版本模块仅负责数据采集，编排逻辑在 common.runner 中。

用法
    python tools/main.py compare func --version 2.0
    python tools/main.py compare enum --version 3.0
    python tools/main.py compare event --version 2.0
    python tools/main.py compare all
    python tools/main.py merge --version 2.0
    python tools/main.py desc --version 3.0
    python tools/main.py gen-event-table --version 3.0
    python tools/main.py verify
    python tools/main.py all
    python tools/main.py list
    python tools/main.py upload --type item --file out/data.json
"""

from __future__ import annotations

import sys
from pathlib import Path
from typing import Optional

import typer
from rich import box
from rich.console import Console
from rich.panel import Panel
from rich.rule import Rule
from rich.table import Table
from typer.core import TyperGroup

from common.io_utils import init_stdout, logger
from common.event_table import generate_event_table
from common.models import (
    CompareResult,
    DescResult,
    MergeResult,
    UploadResult,
    VerifyResult,
)
from common.runner import (
    COMPARE_TYPES,
    VERSIONS,
    run_desc,
    run_enum_compare,
    run_event_compare,
    run_func_compare,
    run_merge,
    run_upload,
)
from common.verify import verify_generated

_TOOLS_DIR: Path = Path(__file__).resolve().parent
if str(_TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(_TOOLS_DIR))

EXAMPLES_TEXT: str = """\
python tools/main.py compare func --version 2.0
python tools/main.py compare enum --version 3.0
python tools/main.py compare event --version all
python tools/main.py compare all
python tools/main.py compare all --output report.txt
python tools/main.py merge --version 2.0
python tools/main.py desc --version 3.0
python tools/main.py gen-event-table --version 3.0
python tools/main.py verify
python tools/main.py all
python tools/main.py list
python tools/main.py upload --type item --file out/data.json"""

console: Console = Console(highlight=False)

SEP: str = "─" * 60


def validate_choice(value: str, allowed: list[str], label: str) -> None:
    """校验选项是否合法，否则抛出 typer.Exit"""
    allowed_set: set[str] = set(allowed) | {"all"}
    if value not in allowed_set:
        typer.echo(f"错误: 无效的{label} '{value}'，可选: {', '.join(allowed + ['all'])}")
        raise typer.Exit(1)


def print_section_header(title: str) -> None:
    """打印 rich 风格的章节标题"""
    console.print()
    console.print(Panel(title, style="bold cyan", expand=False))


def _make_compare_table(result: CompareResult) -> Table:
    """构建 CompareResult 的 Rich 表格"""
    s = result.summary
    table: Table = Table(
        title_style="bold cyan",
        box=box.ROUNDED,
        border_style="cyan",
        header_style="bold green",
        show_lines=False,
        padding=(0, 2),
    )
    table.add_column("项目", style="bold")
    table.add_column("数量", justify="right", style="yellow")

    table.add_row("本地", str(s.local_count))
    table.add_row("网页", str(s.web_count))
    table.add_row("共同", str(s.common_count))
    table.add_row("仅本地", str(s.only_local_count))
    table.add_row("仅网页", str(s.only_web_count))
    return table


def _render_table_to_text(table: Table, width: int = 80) -> str:
    """把 Rich 表格渲染为无颜色的纯文本，便于写入文件"""
    file_console: Console = Console(
        record=True,
        width=width,
        no_color=True,
        highlight=False,
        legacy_windows=False,
        force_terminal=False,
    )
    file_console.print(table)
    return file_console.export_text()


def _format_compare_result(result: CompareResult) -> None:
    """格式化输出 CompareResult（控制台）"""
    console.print(_make_compare_table(result))
    if result.details:
        console.print()
        for line in result.details:
            console.print(line)


def _format_merge_result(result: MergeResult) -> None:
    """格式化输出 MergeResult"""
    if result.success:
        console.print(f"[green]✓[/] 合并完成！输出: [bold]{result.output_file}[/]")
    else:
        console.print(f"[red]✗[/] 合并失败: {result.error}")


def _format_desc_result(result: DescResult) -> None:
    """格式化输出 DescResult"""
    if result.success:
        console.print(f"[green]✓[/] 转换完成！")
        console.print(f"  输入: {result.input_file}")
        console.print(f"  输出: {result.output_file}")
    else:
        console.print(f"[red]✗[/] 转换失败: {result.error}")


def _format_upload_result(result: UploadResult) -> None:
    """格式化输出 UploadResult"""
    if result.success:
        console.print("[green]✓[/] 上传成功！")
        console.print(f"  类型: {result.kind} / 标识: {result.data}")
        console.print(f"  地址: {result.url}")
        if result.message:
            console.print(f"  服务端: {result.message}")
    else:
        console.print(f"[red]✗[/] 上传失败: {result.error or result.message or '未知错误'}")
        if result.status_code:
            console.print(f"  HTTP {result.status_code}")
        if result.url:
            console.print(f"  地址: {result.url}")


def _write_to_file(content: str, output_path: Path) -> None:
    """追加内容到输出文件"""
    with open(output_path, "a", encoding="utf-8") as fp:
        fp.write(content)


def _run_compare_and_format(
    label: str,
    runner_func,
    version: str,
    output_path: Optional[Path] = None,
) -> int:
    """统一运行对比函数并格式化/输出结果"""
    title: str = f"[{version}] {label}"
    plain_title: str = f"\n{'=' * 70}\n  {title}\n{'=' * 70}\n"

    print_section_header(title)

    result: Optional[CompareResult] = runner_func(version)
    if result is None:
        console.print(f"[red]✗[/] {title} 执行失败（模块加载或数据缺失）")
        if output_path:
            _write_to_file(f"{plain_title}\n  执行失败\n", output_path)
        return 1

    # 控制台输出
    _format_compare_result(result)

    # 文件输出
    if output_path:
        text: str = plain_title + "\n"
        text += _render_table_to_text(_make_compare_table(result))
        text += "\n"
        if result.details:
            text += "\n" + "\n".join(result.details) + "\n"
        _write_to_file(text, output_path)

    return 0


def run_compare(
    compare_type: str,
    version: str,
    output_file: Optional[str] = None,
) -> int:
    """对比指定类型和版本的差异，可输出到文件"""
    versions: list[str] = VERSIONS if version == "all" else [version]
    types: list[str] = COMPARE_TYPES if compare_type == "all" else [compare_type]
    output_path: Optional[Path] = Path(output_file) if output_file else None

    exit_code: int = 0

    # 如果输出到文件，先清空
    if output_path:
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text("", encoding="utf-8")

    runner_map = {
        "func": ("函数对比", run_func_compare),
        "enum": ("枚举对比", run_enum_compare),
        "event": ("事件对比", run_event_compare),
    }

    for ver in versions:
        for ctype in types:
            label, runner_func = runner_map[ctype]
            ret = _run_compare_and_format(label, runner_func, ver, output_path)
            if ret != 0:
                exit_code = 1

    if output_path:
        console.print(f"\n[green]✓[/] 结果已保存至: [bold]{output_path.resolve()}[/]")
    return exit_code


def run_merge_cmd(version: str) -> int:
    """合并 declarations 目录下的声明文件"""
    print_section_header(f"合并 {version} 声明文件")
    result: MergeResult = run_merge(version)
    _format_merge_result(result)
    return 0 if result.success else 1


def run_desc_cmd(version: str) -> int:
    """将合并后的声明转为 AI 描述文件"""
    print_section_header(f"{version} 转 AI 描述文件")
    result: DescResult = run_desc(version)
    _format_desc_result(result)
    return 0 if result.success else 1


def _format_verify_result(result: VerifyResult) -> None:
    """格式化输出生成产物校验结果"""
    for item in result.items:
        mark = "[green]✓[/]" if item.ok else "[red]✗[/]"
        console.print(f"{mark} {item.name}: {item.detail}")
    if result.success:
        console.print("[green]✓[/] 所有生成产物均为最新")
    else:
        console.print(f"[red]✗[/] {len(result.failed)} 项产物已过期，请重新生成后再提交")


def run_verify_cmd() -> int:
    """校验所有生成产物是否与源声明一致"""
    print_section_header("生成产物一致性校验")
    result = verify_generated()
    _format_verify_result(result)
    return 0 if result.success else 1


def run_gen_event_table_cmd(version: str) -> int:
    """从事件源数据生成 MNEventTable.d.lua"""
    print_section_header(f"生成 {version} 事件参数表")
    result = generate_event_table(version)
    if result.success:
        console.print(
            f"[green]✓[/] 已生成: [bold]{result.output_file}[/] "
            f"({result.event_count} 事件 / {result.field_count} 字段)"
        )
        return 0
    console.print(f"[red]✗[/] 生成失败: {result.error}")
    return 1


def run_upload_cmd(
    kind: str,
    file: str,
    url: str = "",
    token: str = "",
) -> int:
    """将 JSON 文件上传到 Worker"""
    print_section_header("上传 JSON 数据到 Worker")
    result: UploadResult = run_upload(kind, file, url, token)
    _format_upload_result(result)
    return 0 if result.success else 1


def run_list() -> None:
    """列出所有可用操作"""
    table: Table = Table(
        title="MiniWorld API 差异查看工具",
        title_style="bold cyan",
        border_style="cyan",
    )
    table.add_column("分类", style="bold green", width=10)
    table.add_column("命令", style="bold yellow")
    table.add_column("说明", style="white")

    for ctype in COMPARE_TYPES:
        table.add_row("对比", f"compare {ctype} --version 2.0", f"对比 2.0 {ctype} 差异")
        table.add_row("", f"compare {ctype} --version 3.0", f"对比 3.0 {ctype} 差异")

    table.add_row("对比", "compare all", "对比所有版本所有类别")
    table.add_row("", "", "")

    for ver in VERSIONS:
        table.add_row("合并", f"merge --version {ver}", f"合并 {ver} 声明文件")
    table.add_row("", "", "")

    for ver in VERSIONS:
        table.add_row("转换", f"desc --version {ver}", f"{ver} 转 AI 描述文件")
    table.add_row("", "", "")

    for ver in VERSIONS:
        table.add_row("事件表", f"gen-event-table --version {ver}", f"从事件源数据生成 {ver} MNEventTable.d.lua")
    table.add_row("校验", "verify", "校验所有生成产物是否与源声明一致")
    table.add_row("", "", "")

    table.add_row("批量", "all", "批量运行所有对比")
    table.add_row("", "all --output report.txt", "输出到文件")
    table.add_row("", "", "")

    table.add_row("上传", "upload --type item --file out/data.json", "上传 JSON 数据到 Worker")

    panel: Panel = Panel(
        table,
        title="[bold cyan]可用命令一览[/]",
        border_style="cyan",
        padding=(1, 2),
    )
    console.print(panel)


def run_all(output_file: Optional[str] = None) -> int:
    """顺序执行所有对比操作"""
    return run_compare("all", "all", output_file)


class ExamplesPanelGroup(TyperGroup):
    """自定义 TyperGroup: 在标准帮助文本之后追加 Rich 面板形式的示例"""

    def format_help(self, ctx, formatter) -> None:
        super().format_help(ctx, formatter)
        console.print(
            Panel(
                EXAMPLES_TEXT,
                title="Example",
                title_align="left",
                border_style="rgb(122,124,128)",
                padding=(0, 1),
                expand=False,
            )
        )


app: typer.Typer = typer.Typer(
    name="miniworld-api-desc",
    help="MiniWorld API 差异查看工具",
    context_settings={"help_option_names": ["-h", "--help"]},
    add_completion=False,
    rich_markup_mode="rich",
    cls=ExamplesPanelGroup,
)


@app.command()
def compare(
    compare_type: str = typer.Argument(
        "all",
        help="对比类型（func/enum/event/all）",
    ),
    version: str = typer.Option(
        "all",
        "--version",
        "-v",
        help="API 版本（2.0/3.0/all）",
    ),
    output: Optional[str] = typer.Option(
        None,
        "--output",
        "-o",
        help="输出到文件（可选）",
    ),
) -> None:
    """对比本地声明与网页文档的差异"""
    validate_choice(compare_type, COMPARE_TYPES, "对比类型")
    validate_choice(version, VERSIONS, "版本")
    raise typer.Exit(run_compare(compare_type, version, output))


@app.command()
def merge(
    version: str = typer.Option(
        ...,
        "--version",
        "-v",
        help="API 版本（2.0/3.0）",
    ),
) -> None:
    """合并 declarations 目录下的声明文件"""
    validate_choice(version, VERSIONS, "版本")
    raise typer.Exit(run_merge_cmd(version))


@app.command()
def desc(
    version: str = typer.Option(
        ...,
        "--version",
        "-v",
        help="API 版本（2.0/3.0）",
    ),
) -> None:
    """将合并后的声明转为 AI 描述文件"""
    validate_choice(version, VERSIONS, "版本")
    raise typer.Exit(run_desc_cmd(version))


@app.command("all")
def all_cmd(
    output: Optional[str] = typer.Option(
        None,
        "--output",
        "-o",
        help="输出到文件（可选）",
    ),
) -> None:
    """批量运行所有版本的差异对比"""
    raise typer.Exit(run_all(output))


@app.command("gen-event-table")
def gen_event_table_cmd(
    version: str = typer.Option(
        ...,
        "--version",
        "-v",
        help="API 版本（2.0/3.0）",
    ),
) -> None:
    """从事件源数据生成 MNEventTable.d.lua"""
    validate_choice(version, VERSIONS, "版本")
    raise typer.Exit(run_gen_event_table_cmd(version))


@app.command()
def verify() -> None:
    """校验所有生成产物是否与源声明一致（漂移检测）"""
    raise typer.Exit(run_verify_cmd())


@app.command()
def upload(
    kind: str = typer.Option(
        ...,
        "--type",
        "-t",
        help="数据类型（item/buff/actor）",
    ),
    file: str = typer.Option(
        ...,
        "--file",
        "-f",
        help="要上传的 JSON 文件路径",
    ),
    url: str = typer.Option(
        "",
        "--url",
        help="Worker 根地址（默认读取 config.ini 的 worker 段 base_url）",
    ),
    token: str = typer.Option(
        "",
        "--token",
        help="上传 token（默认读取 config.ini 的 worker 段 token）",
    ),
) -> None:
    """将 JSON 数据上传到 Cloudflare Worker"""
    raise typer.Exit(run_upload_cmd(kind, file, url, token))


@app.command("list")
def list_cmd() -> None:
    """列出所有可用操作"""
    run_list()


def main() -> None:
    """主入口"""
    init_stdout()
    app()


if __name__ == "__main__":
    main()
