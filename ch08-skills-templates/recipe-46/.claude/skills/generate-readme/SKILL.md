---
name: generate-readme
description: プロジェクトのREADME.mdを生成または更新する
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(npm *), Bash(node *)
---

# README.md生成

## プロジェクト情報
- `package.json`: !`cat package.json 2>/dev/null || echo "なし"`
- ディレクトリ構造: !`ls -la src/ 2>/dev/null || ls -la 2>/dev/null`

## 手順

1. プロジェクトの構造とソースコードを分析する
2. 以下のセクションを含むREADME.mdを生成する

## README構成

    # プロジェクト名

    説明文（2-3行）

    ## 必要要件
    - 必要なランタイム、ツール

    ## セットアップ
    1. インストール手順
    2. 環境変数の設定
    3. 起動方法

    ## 使い方
    主要な使い方の説明

    ## プロジェクト構成
    ディレクトリ構造の説明

    ## ライセンス

## ルール

- 既存のREADME.mdがある場合は、内容を保持しつつ不足部分を補完する
- コードから推測できる情報のみ記述する（推測で機能を追加しない）
- セットアップ手順は実際に動作する正確なコマンドを記述する
