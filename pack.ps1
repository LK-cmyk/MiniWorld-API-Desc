<#
===========================================================================
  MiniWorld-API-Desc 编译打包脚本
  功能：
    1. 清理旧的编译输出
    2. 安装/更新 npm 依赖
    3. 安装/更新 Python 依赖
    4. 编译 TypeScript
    5. 运行 ESLint 检查
    6. 运行 Python 工具（可选，通过参数控制）
    7. 打包 VS Code 扩展 (.vsix)
===========================================================================
#>

#Requires -Version 5.1

[CmdletBinding()]
param(
    # 跳过 npm install
    [switch]$SkipInstall,
    # 跳过 ESLint
    [switch]$SkipLint,
    # 仅编译，不打包
    [switch]$CompileOnly,
    # 仅清除输出目录
    [switch]$Clean
)

# ---------- 路径定义 ----------
$ProjectRoot = $PSScriptRoot
$CompleteDir = Join-Path $ProjectRoot "addon"
$OutDir = Join-Path $CompleteDir "out"
$ToolsDir = Join-Path $ProjectRoot "tools"

# ---------- 颜色辅助 ----------
function Write-Step {
    param([string]$Text)
    Write-Host "`n>>> $Text" -ForegroundColor Cyan
}

function Write-Success {
    param([string]$Text)
    Write-Host "✔ $Text" -ForegroundColor Green
}

function Write-WarningMsg {
    param([string]$Text)
    Write-Host "⚠ $Text" -ForegroundColor Yellow
}

function Write-ErrorMsg {
    param([string]$Text)
    Write-Host "✘ $Text" -ForegroundColor Red
}

# ========== 0. 仅清除 ==========
if ($Clean) {
    Write-Step "清除编译输出..."
    if (Test-Path $OutDir) {
        Remove-Item -Recurse -Force $OutDir
        Write-Success "已删除: $OutDir"
    } else {
        Write-WarningMsg "输出目录不存在，跳过"
    }
    return
}

# ========== 1. 安装 npm 依赖 ==========
if (-not $SkipInstall) {
    Write-Step "[1/4] 安装/更新 npm 依赖..."
    Push-Location $ProjectRoot
    try {
        npm install
        if ($LASTEXITCODE -ne 0) { throw "npm install 失败" }
        Write-Success "npm 依赖安装完成"
    } finally {
        Pop-Location
    }
} else {
    Write-WarningMsg "跳过 npm install"
}

# ========== 2. 编译 TypeScript ==========
Write-Step "[2/4] 编译 TypeScript..."
Push-Location $ProjectRoot
try {
    npm run compile
    if ($LASTEXITCODE -ne 0) { throw "TypeScript 编译失败" }
    Write-Success "TypeScript 编译完成 → $OutDir"
} finally {
    Pop-Location
}

# ========== 3. ESLint 检查 ==========
if (-not $SkipLint) {
    Write-Step "[3/4] 运行 ESLint..."
    Push-Location $ProjectRoot
    try {
        npm run lint
        if ($LASTEXITCODE -ne 0) { throw "ESLint 检查未通过" }
        Write-Success "ESLint 检查通过"
    } finally {
        Pop-Location
    }
} else {
    Write-WarningMsg "跳过 ESLint"
}

# ========== 4. 打包 VS Code 扩展 ==========
if ($CompileOnly) {
    Write-Step "编译模式：跳过打包"
    Write-Success "编译完成！输出目录: $OutDir"
    return
}

Write-Step "[4/4] 打包 VS Code 扩展..."
Push-Location $ProjectRoot
try {
    # 检查 vsce 是否可用
    $VscePath = Get-Command "vsce" -ErrorAction SilentlyContinue
    if (-not $VscePath) {
        Write-WarningMsg "未安装 vsce，正在全局安装..."
        npm install -g @vscode/vsce
        if ($LASTEXITCODE -ne 0) { throw "vsce 安装失败" }
    }

    $OutputVsix = Join-Path $ProjectRoot "miniworld-api-complete.vsix"
    vsce package --out $OutputVsix
    if ($LASTEXITCODE -ne 0) { throw "打包失败" }
    Write-Success "打包完成！输出: $OutputVsix"
} finally {
    Pop-Location
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host " 所有步骤完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
