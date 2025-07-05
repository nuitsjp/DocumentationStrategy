# MkDocs環境セットアップスクリプト
# uvを使用してPython環境とパッケージを管理

Write-Host "=== MkDocsドキュメンテーション環境のセットアップを開始します ===" -ForegroundColor Green

# Python 3.13のインストール
Write-Host "Python 3.13をインストールしています..." -ForegroundColor Yellow
winget install --id Python.Python.3.13 -e --silent
winget install --id astral-sh.uv  -e --silent

# プロジェクトディレクトリに移動
$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

# pyproject.tomlに定義された依存関係をインストール
uv sync

# # Playwrightブラウザのインストール
# Write-Host "Playwrightブラウザをインストールしています..." -ForegroundColor Yellow
# uv run playwright install chromium
