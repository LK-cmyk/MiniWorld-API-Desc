import zipfile
import subprocess
import shutil
import logging
from pathlib import Path

# 配置日志
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# 路径配置
BASE_DIR = Path(__file__).resolve().parent
AI_DESC_30_INPUT_PATH = BASE_DIR / ".." / "AiDesc" / "3.0"
AI_DESC_20_INPUT_PATH = BASE_DIR / ".." / "AiDesc" / "2.0"
OUTPUT_PATH = BASE_DIR / ".." / "out"


def ai_desc_30() -> None:
    """将 AiDesc 3.0 的两个文件打包为 zip"""
    OUTPUT_PATH.mkdir(parents=True, exist_ok=True)

    zip_path = OUTPUT_PATH / "ai-desc-3.0.zip"
    file1 = AI_DESC_30_INPUT_PATH / "AiDesc.md"
    file2 = AI_DESC_30_INPUT_PATH / "MNAiDesc.txt"

    if not file1.exists():
        raise FileNotFoundError(f"源文件不存在: {file1}")
    if not file2.exists():
        raise FileNotFoundError(f"源文件不存在: {file2}")

    with zipfile.ZipFile(zip_path, "w") as zf:
        zf.write(file1, "AiDesc.md")
        zf.write(file2, "MNAiDesc.txt")

    logging.info("ai-desc-3.0.zip 已生成 -> %s", zip_path)


def addon() -> None:
    """运行 PowerShell 脚本打包 VSIX 插件，并移动到输出目录"""
    ps_script = BASE_DIR / "pack.ps1"
    if not ps_script.exists():
        raise FileNotFoundError(f"PowerShell 脚本未找到: {ps_script}")

    logging.info("开始执行 PowerShell 脚本: %s", ps_script)
    result = subprocess.run(
        ["powershell", "-ExecutionPolicy", "Bypass", "-File", str(ps_script)],
        capture_output=True,
        text=True,
        encoding="utf-8",
        timeout=180,  # 增加超时保护
        cwd=str(BASE_DIR),  # 明确工作目录为脚本所在目录
    )

    if result.returncode != 0:
        error_msg = result.stderr.strip() or result.stdout.strip()
        raise RuntimeError(f"PowerShell 执行失败 (返回码 {result.returncode}):\n{error_msg}")

    logging.info("PowerShell 脚本执行成功，输出:\n%s", result.stdout)

    # 移动生成的 VSIX 文件
    vsix_name = "miniworld-api-desc-addon.vsix"
    vsix_path = BASE_DIR / vsix_name
    dest_dir = OUTPUT_PATH
    dest_dir.mkdir(parents=True, exist_ok=True)

    if not vsix_path.exists():
        raise FileNotFoundError(f"未找到生成的 VSIX 文件: {vsix_path}")

    shutil.move(str(vsix_path), str(dest_dir / vsix_name))
    logging.info("VSIX 文件已移动到 %s", dest_dir / vsix_name)


def main() -> None:
    try:
        ai_desc_30()
        addon()
        logging.info("所有操作完成。")
    except Exception as e:
        logging.error("任务执行失败: %s", e)
        raise


if __name__ == "__main__":
    main()
