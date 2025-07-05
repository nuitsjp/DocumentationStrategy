# MkDocs環境セットアップスクリプト
# uvを使用してPython環境とパッケージを管理

Write-Host "=== MkDocsドキュメンテーション環境のセットアップを開始します ===" -ForegroundColor Green

# Python 3.13のインストール
Write-Host "Python 3.13をインストールしています..." -ForegroundColor Yellow
winget install --id Python.Python.3.13 -e --silent
winget install --id astral-sh.uv -e --silent
# WeasyPrintから利用するGTK+ランタイムをインストールする
winget install --id tschoonj.GTKForWindows -e --silent

# Mermaid CLIをインストールするためのNode.jsをインストール
winget install --id OpenJS.NodeJS -e --silent

# 環境変数を更新
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")

# Mermaid CLIをインストール
npm install -g @mermaid-js/mermaid-cli

# プロジェクトディレクトリに移動
$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

# pyproject.tomlに定義された依存関係をインストール
uv sync

# # Playwrightブラウザのインストール
# Write-Host "Playwrightブラウザをインストールしています..." -ForegroundColor Yellow
# uv run playwright install chromium
