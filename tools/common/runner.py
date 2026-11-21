"""统一执行器：编排所有操作，返回结构化结果（不直接输出）

各版本专用解析函数在 common/parsers_20.py 和 common/parsers_30.py 中，
由此模块直接导入并编排流程
"""

from __future__ import annotations

import json
import os
from typing import Optional

import requests

from common.compare import compare_enums, compare_funcs
from common.config import (
    API_20_FILE,
    API_30_FILE,
    COORD_PARAMS,
    FUNC_SKIP_FUNCS_20,
    FUNC_SKIP_MODULES_20,
    IGNORE_EVENT_PARAMS,
    MERGED_20_FILE,
    MERGED_30_FILE,
    MINI_FIELDS_30,
    MULTIPLE_20_DIR,
    MULTIPLE_30_DIR,
    ORDER_20,
    ORDER_30,
    SKIP_ENUM_CLASSES_20,
    WORKER_BASE_URL,
    WORKER_TOKEN,
    WORKER_UPLOAD_ROUTE,
    WORKER_UPLOAD_TYPES,
)
from common.lua_parser import get_enum_definitions, get_function_names
from common.merge import get_ordered_files, merge_lua_files
from common.annotation import strip_annotations
from common.models import CompareResult, DescResult, MergeResult, Summary, UploadResult
from common.parsers_20 import (
    ENUM_LIB_FILE_PATH as _ENUM_FILE_20,
    ENUM_LIB_URL as _ENUM_URL_20,
    EVENT_URL as _EVENT_URL_20,
    FUNC_FILES_PATH as _FUNC_PATH_20,
    FUNC_URLS as _FUNC_URLS_20,
    JSON_PATH as _JSON_PATH_20,
    enum_analyze_web as _enum_web_20,
    event_fetch_page as _event_fetch_20,
    event_load_json as _event_json_20,
    event_parse_web as _event_parse_20,
    func_analyze_web as _func_web_20,
    func_module_name_from_file as _func_name_20,
)
from common.parsers_30 import (
    ENUM_LIB_FILE_PATH as _ENUM_FILE_30,
    ENUM_LIB_URL as _ENUM_URL_30,
    COMPONENT_EVENT_URL as _COMP_EVENT_URL_30,
    FUNC_FILES_PATH as _FUNC_PATH_30,
    FUNC_URL as _FUNC_URLS_30,
    LOCAL_FILE_PATH as _LOCAL_EVENT_FILE_30,
    TRIGGER_EVENT_URL as _TRIG_EVENT_URL_30,
    compare_events as _compare_events_30,
    enum_analyze_web as _enum_web_30,
    event_analyze_web as _event_web_30,
    func_analyze_web as _func_web_30,
    func_local_file_for_module as _func_file_30,
    func_module_name_from_url as _func_name_30,
)

VERSIONS: list[str] = ["2.0", "3.0"]
COMPARE_TYPES: list[str] = ["func", "enum", "event"]


# FuncCompare


def _apply_20_skip_filters(module_name: str, local_funcs: set[str], web_funcs: set[str]) -> tuple[set[str], set[str]]:
    """对 2.0 过滤规则做大小写归一化"""
    normalized_module = module_name.strip()
    exact_skip = set()
    for key in FUNC_SKIP_FUNCS_20:
        if key.lower() == normalized_module.lower():
            exact_skip = FUNC_SKIP_FUNCS_20[key]
            break

    if not exact_skip:
        return local_funcs, web_funcs

    return local_funcs - exact_skip, web_funcs - exact_skip


def run_func_compare(version: str) -> Optional[CompareResult]:
    """对比指定版本的函数差异"""
    all_diff: list[str] = []
    local_count = 0
    web_count = 0
    common_count = 0
    only_local_count = 0
    only_web_count = 0

    if version == "2.0":
        if not os.path.exists(_FUNC_PATH_20):
            return None

        local_files: list[str] = sorted(f for f in os.listdir(_FUNC_PATH_20) if f.endswith(".d.lua"))

        for filename in local_files:
            module_name: str = _func_name_20(filename)

            # 跳过完全禁止对比的模块
            if module_name in FUNC_SKIP_MODULES_20:
                continue

            local_path: str = os.path.join(_FUNC_PATH_20, filename)
            local_funcs: set[str] = get_function_names(local_path)

            web_funcs: set[str] = set()
            matched_url: str | None = None
            for key, url in _FUNC_URLS_20.items():
                if key.lower() == module_name.lower():
                    matched_url = url
                    break

            if matched_url:
                web_funcs = _func_web_20(matched_url)
                local_count += 1
                web_count += 1
            else:
                all_diff.append(f"[{module_name}]  ⚠ 未配置网页文档 URL")
                local_count += 1
                only_local_count += len(local_funcs)
                continue

            local_funcs, web_funcs = _apply_20_skip_filters(module_name, local_funcs, web_funcs)
            diff, stats = compare_funcs(local_funcs, web_funcs, module_name)
            all_diff.extend(diff)
            common_count += stats.common
            only_local_count += stats.only_local
            only_web_count += stats.only_web

    else:
        for url in _FUNC_URLS_30:
            module_name = _func_name_30(url)
            local_path = _func_file_30(module_name)
            web_funcs = _func_web_30(url)
            local_funcs: set[str] = set()
            if os.path.exists(local_path):
                local_funcs = get_function_names(local_path)
                local_count += 1
            else:
                all_diff.append(f"[{module_name}]  ⚠ 本地文件不存在")
            web_count += 1

            diff, stats = compare_funcs(local_funcs, web_funcs, module_name)
            all_diff.extend(diff)
            common_count += stats.common
            only_local_count += stats.only_local
            only_web_count += stats.only_web

    # 统一为函数级口径：本地 = 共同 + 仅本地，网页 = 共同 + 仅网页
    local_count = common_count + only_local_count
    web_count = common_count + only_web_count
    summary = Summary(
        title="函数对比",
        local_count=local_count,
        web_count=web_count,
        common_count=common_count,
        only_local_count=only_local_count,
        only_web_count=only_web_count,
    )
    return CompareResult(summary=summary, details=all_diff)


# EnumLibCompare


def run_enum_compare(version: str) -> Optional[CompareResult]:
    """对比指定版本的枚举差异"""
    if version == "2.0":
        enum_file = _ENUM_FILE_20
        enum_url = _ENUM_URL_20
        web_fn = _enum_web_20
        skip_classes: set[str] = SKIP_ENUM_CLASSES_20
    else:
        enum_file = _ENUM_FILE_30
        enum_url = _ENUM_URL_30
        web_fn = _enum_web_30
        skip_classes = set()

    if not os.path.exists(enum_file):
        return None

    local_enums = get_enum_definitions(enum_file)
    web_enums = web_fn(enum_url)

    if version == "2.0":
        diff_lines, stats = compare_enums(
            local_enums,
            web_enums,
            skip_classes=skip_classes,
        )
    else:
        diff_lines, stats = compare_enums(
            local_enums,
            web_enums,
            skip_web_only_classes={"Mini"},
            skip_local_only_classes={"Mini"},
            skip_fields={"Mini": MINI_FIELDS_30},
        )

    # 统一为字段级口径：本地 = 共同 + 仅本地，网页 = 共同 + 仅网页
    only_local = stats.only_local
    only_web = stats.only_web
    summary = Summary(
        title="枚举对比",
        local_count=stats.common + only_local,
        web_count=stats.common + only_web,
        common_count=stats.common,
        only_local_count=only_local,
        only_web_count=only_web,
    )
    return CompareResult(summary=summary, details=diff_lines)


# EventCompare


def _compare_event_names(json_events: dict[str, dict], web_events: dict[str, dict]) -> list[str]:
    """比较事件名称差异"""
    lines: list[str] = []
    json_names = set(json_events)
    web_names = set(web_events)

    only_json = sorted(json_names - web_names)
    only_web = sorted(web_names - json_names)

    if not only_json and not only_web:
        lines.append("  ✓ 事件名称完全一致")
        return lines

    lines.append("[事件名称]")
    if only_json:
        count = len(only_json)
        items = ", ".join(only_json[:10])
        suffix = f" ... 等 {count} 项" if count > 10 else ""
        lines.append(f"  仅在本地 ({count}): {items}{suffix}")
    if only_web:
        count = len(only_web)
        items = ", ".join(only_web[:10])
        suffix = f" ... 等 {count} 项" if count > 10 else ""
        lines.append(f"  仅在网页 ({count}): {items}{suffix}")
    return lines


def _compare_event_params(json_events: dict[str, dict], web_events: dict[str, dict]) -> list[str]:
    """比较共同事件的参数差异"""
    lines: list[str] = []
    common = sorted(set(json_events) & set(web_events))
    has_any_diff = False

    for name in common:
        json_info = json_events[name].get("event_info", {}) or {}
        web_params = web_events[name].get("params", [])
        web_param_desc = web_events[name].get("param_desc", {})

        json_param_set = set(json_info.keys())
        web_param_set = {p for p in web_params if p.lower() not in IGNORE_EVENT_PARAMS}

        only_json = sorted(json_param_set - web_param_set)
        only_web = sorted(web_param_set - json_param_set)
        common_params = sorted(json_param_set & web_param_set)

        if not only_json and not only_web:
            desc_diffs: list[str] = []
            has_all_coords = COORD_PARAMS.issubset(json_param_set & web_param_set)
            coord_ref_desc = web_param_desc.get("x", "") if has_all_coords else None

            for p in common_params:
                j_desc = json_info.get(p, "")
                if has_all_coords and p in COORD_PARAMS and p != "x":
                    w_desc = coord_ref_desc or ""
                else:
                    w_desc = web_param_desc.get(p, "")
                if j_desc != w_desc:
                    if not w_desc:
                        continue
                    desc_diffs.append(f"    参数 {p}: 本地「{j_desc}」≠ 网页「{w_desc}」")
            if not desc_diffs:
                continue
            lines.append(f"[{name}]")
            lines.extend(desc_diffs)
            has_any_diff = True
        else:
            lines.append(f"[{name}]")
            if only_json:
                lines.append(f"  仅在本地 ({len(only_json)}): {', '.join(only_json)}")
            if only_web:
                lines.append(f"  仅在网页 ({len(only_web)}): {', '.join(only_web)}")
            has_any_diff = True

    if not has_any_diff:
        lines.append("  ✓ 所有共同事件的参数完全一致")
    return lines


def run_event_compare(version: str) -> Optional[CompareResult]:
    """对比指定版本的事件差异"""
    if version == "2.0":
        if not os.path.exists(_JSON_PATH_20):
            return None

        with open(_JSON_PATH_20, "r", encoding="utf-8") as f:
            json_events = json.load(f)

        html = _event_fetch_20(_EVENT_URL_20)
        if not html:
            return None
        web_events = _event_parse_20(html)

        common_set = sorted(set(json_events) & set(web_events))
        only_json_set = sorted(set(json_events) - set(web_events))
        only_web_set = sorted(set(web_events) - set(json_events))

        summary = Summary(
            title="事件对比",
            local_count=len(json_events),
            web_count=len(web_events),
            common_count=len(common_set),
            only_local_count=len(only_json_set),
            only_web_count=len(only_web_set),
        )

        details: list[str] = []
        details.extend(_compare_event_names(json_events, web_events))
        details.append("")
        details.extend(_compare_event_params(json_events, web_events))

        return CompareResult(summary=summary, details=details)

    else:
        if not os.path.exists(_LOCAL_EVENT_FILE_30):
            return None

        local = get_enum_definitions(_LOCAL_EVENT_FILE_30)
        web_trigger = _event_web_30(_TRIG_EVENT_URL_30)
        web_component = _event_web_30(_COMP_EVENT_URL_30)

        web_all: dict[str, list[str]] = {}
        for d in (web_trigger, web_component):
            for k, v in d.items():
                web_all.setdefault(k, []).extend(v)

        local_set = set(local)
        web_set = set(web_all)
        common = local_set & web_set
        only_local = local_set - web_set
        only_web = web_set - local_set

        summary = Summary(
            title="事件对比",
            local_count=len(local_set),
            web_count=len(web_set),
            common_count=len(common),
            only_local_count=len(only_local),
            only_web_count=len(only_web),
        )

        diff = _compare_events_30(local, web_all)
        return CompareResult(summary=summary, details=diff)


# Merge


def run_merge(version: str) -> MergeResult:
    """合并指定版本的声明文件"""
    if version == "2.0":
        input_dir = MULTIPLE_20_DIR
        output_file = MERGED_20_FILE
        order = ORDER_20
    else:
        input_dir = MULTIPLE_30_DIR
        output_file = MERGED_30_FILE
        order = ORDER_30

    if not input_dir.exists():
        return MergeResult(success=False, error=f"文件夹 '{input_dir}' 不存在")

    outcome = merge_lua_files(str(input_dir), str(output_file), order)

    if outcome.skipped_files:
        return MergeResult(
            success=False,
            error=f"合并失败：{len(outcome.skipped_files)} 个文件读取失败: "
                  + ", ".join(outcome.skipped_files),
            output_file=str(output_file),
            skipped_files=outcome.skipped_files,
        )

    if output_file.exists() and output_file.stat().st_size > 0:
        return MergeResult(
            success=True,
            files_merged=len(get_ordered_files(str(input_dir), order)),
            total_lines=outcome.total_lines,
            output_file=str(output_file),
        )
    else:
        return MergeResult(
            success=False,
            error="合并失败：输出文件为空或未生成",
            output_file=str(output_file),
        )


# DescToAiDesc


def run_desc(version: str) -> DescResult:
    """将合并后的声明转为 AI 描述文件"""
    if version == "2.0":
        input_file = MERGED_20_FILE
        output_file = API_20_FILE
    else:
        input_file = MERGED_30_FILE
        output_file = API_30_FILE

    if not input_file.exists():
        return DescResult(
            success=False,
            input_file=str(input_file),
            output_file=str(output_file),
            error="输入文件不存在，请先运行 merge",
        )

    try:
        content = input_file.read_text(encoding="utf-8")
        result = strip_annotations(content)
        output_file.parent.mkdir(parents=True, exist_ok=True)
        output_file.write_text(result, encoding="utf-8")
        return DescResult(
            success=True,
            input_file=str(input_file),
            output_file=str(output_file),
        )
    except Exception as e:
        return DescResult(
            success=False,
            input_file=str(input_file),
            output_file=str(output_file),
            error=str(e),
        )


def run_upload(
    kind: str,
    file_path: str,
    base_url: str = "",
    token: str = "",
) -> UploadResult:
    """将 JSON 文件内容作为 payload 上传到 Cloudflare Worker

    数据唯一标识固定为 type + "_map"，由 Worker 端派生，无需调用方指定。
    参数可由调用方显式传入，缺省时回退到 config.ini 的 worker 段配置。
    """
    data_id = f"{kind}_map"
    base = (base_url or WORKER_BASE_URL).strip().rstrip("/")
    tok = token or WORKER_TOKEN

    # 未显式给出协议时，默认补 https://
    if base and not base.startswith(("http://", "https://")):
        base = "https://" + base

    if not base:
        return UploadResult(
            success=False,
            kind=kind,
            data=data_id,
            error="未配置 Worker 地址（--url 或 config.ini 的 worker 段 base_url）",
        )
    if not tok:
        return UploadResult(
            success=False,
            kind=kind,
            data=data_id,
            error="未配置 token（--token 或 config.ini 的 worker 段 token）",
        )
    if kind not in WORKER_UPLOAD_TYPES:
        return UploadResult(
            success=False,
            kind=kind,
            data=data_id,
            error=f"type 必须是 {', '.join(WORKER_UPLOAD_TYPES)} 之一",
        )

    try:
        with open(file_path, "r", encoding="utf-8") as fp:
            payload = json.load(fp)
    except FileNotFoundError:
        return UploadResult(success=False, kind=kind, data=data_id, error=f"文件不存在: {file_path}")
    except json.JSONDecodeError as e:
        return UploadResult(success=False, kind=kind, data=data_id, error=f"JSON 解析失败: {e}")

    url = f"{base}{WORKER_UPLOAD_ROUTE}"
    body = {"token": tok, "type": kind, "payload": payload}

    try:
        resp = requests.post(url, json=body, timeout=30)
    except requests.RequestException as e:
        return UploadResult(success=False, kind=kind, data=data_id, url=url, error=f"请求失败: {e}")

    try:
        resp_json = resp.json()
    except Exception:
        resp_json = {}

    if resp.status_code == 200:
        return UploadResult(
            success=True,
            kind=kind,
            data=data_id,
            url=url,
            status_code=resp.status_code,
            message=str(resp_json.get("message", "")),
        )

    return UploadResult(
        success=False,
        kind=kind,
        data=data_id,
        url=url,
        status_code=resp.status_code,
        message=str(resp_json.get("error", "")),
        error=str(resp_json.get("error") or resp.text),
    )
