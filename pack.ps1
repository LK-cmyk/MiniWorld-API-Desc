<#
===========================================================================
  MiniWorld-API-Desc 编译打包脚本
  功能：
    1. 清理旧的编译输出
    2. 安装/更新 npm 依赖
    3. 安装/更新 Python 依赖
    4. 使用 esbuild 编译 TypeScript（单文件打包）
    5. 运行 ESLint 检查
    6. 运行 Python 工具（可选，通过参数控制）
    7. 打包 VS Code 扩展 (.vsix）
===========================================================================
#>

#Requires -Version 5.1

[CmdletBinding()]
param(
    [switch]$SkipInstall, # 跳过 npm install
    [switch]$SkipLint, # 跳过 ESLint
    [switch]$SkipClean, # 跳过清理步骤
    [switch]$CompileOnly, # 仅编译，不打包
    [switch]$Clean # 仅清除输出目录
)

# 路径定义
$ProjectRoot = $PSScriptRoot
$CompleteDir = Join-Path $ProjectRoot "addon"
$OutDir = Join-Path $CompleteDir "out"

# 颜色辅助
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

# 0. 仅清除
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

# 1. 安装 npm 依赖
if (-not $SkipInstall) {
    Write-Step "[1/5] 安装/更新 npm 依赖..."
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

# 2. 清理旧的编译输出
if (-not $SkipClean) {
    Write-Step "[2/5] 清理旧的编译输出..."
    if (Test-Path $OutDir) {
        Remove-Item -Recurse -Force $OutDir
        Write-Success "已清理: $OutDir"
    } else {
        Write-WarningMsg "输出目录不存在，跳过清理"
    }
} else {
    Write-WarningMsg "跳过清理步骤"
}

# 3. 使用 esbuild 编译 TypeScript
Write-Step "[3/5] 使用 esbuild 编译 TypeScript..."
Push-Location $ProjectRoot
try {
    npm run compile
    if ($LASTEXITCODE -ne 0) { throw "esbuild 编译失败" }
    Write-Success "esbuild 编译完成 → $OutDir/extension.js（单文件打包，含 sourcemap）"
} finally {
    Pop-Location
}

# 4. ESLint 检查
if (-not $SkipLint) {
    Write-Step "[4/5] 运行 ESLint..."
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

# 5. 打包 VS Code 扩展
if ($CompileOnly) {
    Write-Step "编译模式：跳过打包"
    Write-Success "编译完成！输出目录: $OutDir"
    return
}

Write-Step "[5/5] 打包 VS Code 扩展..."
Push-Location $ProjectRoot
try {
    # 检查 vsce 是否可用
    $VscePath = Get-Command "vsce" -ErrorAction SilentlyContinue
    if (-not $VscePath) {
        Write-WarningMsg "未安装 vsce，正在全局安装..."
        npm install -g @vscode/vsce
        if ($LASTEXITCODE -ne 0) { throw "vsce 安装失败" }
    }

    # 使用插件专用的 README 替换根目录 README，打包后恢复
    $AddonReadme = Join-Path $CompleteDir "README.md"
    $RootReadme = Join-Path $ProjectRoot "README.md"
    $RootReadmeBackup = Join-Path $ProjectRoot "README.md.bak"

    $HasBackup = $false
    if (Test-Path $RootReadme) {
        Copy-Item -Path $RootReadme -Destination $RootReadmeBackup -Force
        $HasBackup = $true
        Write-Step "已备份根目录 README.md → README.md.bak"
    }
    if (Test-Path $AddonReadme) {
        Copy-Item -Path $AddonReadme -Destination $RootReadme -Force
        Write-Step "已使用 addon/README.md 替换根目录 README.md"
    }

    $OutputVsix = Join-Path $ProjectRoot "miniworld-api-desc-addon.vsix"
    try {
        vsce package --out $OutputVsix
        if ($LASTEXITCODE -ne 0) { throw "打包失败" }
        Write-Success "打包完成！输出: $OutputVsix"
    } finally {
        # 恢复根目录 README.md
        if ($HasBackup) {
            Move-Item -Path $RootReadmeBackup -Destination $RootReadme -Force
            Write-Step "已恢复根目录 README.md"
        }
    }
} finally {
    Pop-Location
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host " 所有步骤完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
