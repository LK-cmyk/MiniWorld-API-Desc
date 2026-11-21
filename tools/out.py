import zipfile
import subprocess
import shutil
import sys
import os
import logging
from pathlib import Path

from common.runner import run_desc, run_merge

# 配置日志
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# 路径配置
BASE_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = BASE_DIR / ".."
AI_DESC_30_INPUT_PATH = PROJECT_ROOT / "docs" / "miniworld-ugc-30"
AI_DESC_20_INPUT_PATH = PROJECT_ROOT / "docs" / "miniworld-ugc-20"
OUTPUT_PATH = PROJECT_ROOT / "out"


def ai_desc_30() -> None:
    """将 AiDesc 3.0 目录递归打包为 zip，保留文件夹结构"""
    OUTPUT_PATH.mkdir(parents=True, exist_ok=True)

    zip_path = OUTPUT_PATH / "ai-desc-3.0.zip"
    input_dir = AI_DESC_30_INPUT_PATH

    if not input_dir.is_dir():
        raise FileNotFoundError(f"源目录不存在: {input_dir}")

    with zipfile.ZipFile(zip_path, "w") as zf:
        for file in input_dir.rglob("*"):
            if file.is_file():
                arcname = file.relative_to(input_dir)
                zf.write(file, arcname)

    logging.info("ai-desc-3.0.zip 已生成 -> %s", zip_path)


def ai_desc_20() -> None:
    """将 AiDesc 2.0 目录递归打包为 zip，保留文件夹结构"""
    OUTPUT_PATH.mkdir(parents=True, exist_ok=True)

    zip_path = OUTPUT_PATH / "ai-desc-2.0.zip"
    input_dir = AI_DESC_20_INPUT_PATH

    if not input_dir.is_dir():
        raise FileNotFoundError(f"源目录不存在: {input_dir}")

    with zipfile.ZipFile(zip_path, "w") as zf:
        for file in input_dir.rglob("*"):
            if file.is_file():
                arcname = file.relative_to(input_dir)
                zf.write(file, arcname)

    logging.info("ai-desc-2.0.zip 已生成 -> %s", zip_path)


def addon() -> None:
    """使用 tools/pack.py 打包 VSIX 插件，并移动到输出目录"""
    pack_script = BASE_DIR / "pack.py"
    if not pack_script.exists():
        raise FileNotFoundError(f"打包脚本未找到: {pack_script}")

    # pack.py 内部会执行 esbuild 编译 (npm run compile)，直接调用即可
    logging.info("开始执行打包脚本 (跳过安装/清理): %s", pack_script)
    # 强制子进程使用 UTF-8，避免 rich 在 Windows 管道下用 GBK 编码输出特殊符号时出错
    env = os.environ.copy()
    env["PYTHONUTF8"] = "1"
    env["PYTHONIOENCODING"] = "utf-8"

    result = subprocess.run(
        [
            sys.executable,
            str(pack_script),
            "--skip-install",
            "--skip-clean",
        ],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        env=env,
        timeout=300,
        cwd=str(BASE_DIR),
    )

    if result.returncode != 0:
        error_msg = (result.stderr or "").strip() or (result.stdout or "").strip()
        raise RuntimeError(f"打包脚本执行失败 (返回码 {result.returncode}):\n{error_msg}")

    logging.info("打包脚本执行成功，输出:\n%s", result.stdout)

    vsix_name = "miniworld-api-desc-addon.vsix"
    vsix_path = PROJECT_ROOT / vsix_name
    dest_dir = OUTPUT_PATH
    dest_dir.mkdir(parents=True, exist_ok=True)

    if not vsix_path.exists():
        raise FileNotFoundError(f"未找到生成的 VSIX 文件: {vsix_path}")

    shutil.move(str(vsix_path), str(dest_dir / vsix_name))
    logging.info("VSIX 文件已移动到 %s", dest_dir / vsix_name)


def build_generated() -> None:
    """打包前先根据当前声明重新生成 merged 与 API.txt，避免把过期数据打进产物。

    任一版本合并/转换失败即中止，不继续打包。
    """
    for version in ("2.0", "3.0"):
        merge_result = run_merge(version)
        if not merge_result.success:
            raise RuntimeError(f"{version} 合并失败: {merge_result.error}")
        logging.info("%s 声明合并完成 -> %s", version, merge_result.output_file)

        desc_result = run_desc(version)
        if not desc_result.success:
            raise RuntimeError(f"{version} 转 AI 描述失败: {desc_result.error}")
        logging.info("%s API.txt 生成完成 -> %s", version, desc_result.output_file)


def main() -> None:
    try:
        build_generated()
        ai_desc_20()
        ai_desc_30()
        addon()
        logging.info("所有操作完成。")
    except Exception as e:
        logging.error("任务执行失败: %s", e)
        raise


if __name__ == "__main__":
    main()
