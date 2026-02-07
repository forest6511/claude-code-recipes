---
name: git-pr
description: 現在のブランチからPull Requestを作成する。PRの説明文を自動生成する。
disable-model-invocation: true
allowed-tools: Bash(git *), Bash(gh pr *)
---

# Pull Request作成

## ブランチ情報
!`git branch --show-current`

## mainブランチからの変更
!`git log main..HEAD --oneline 2>/dev/null || git log origin/main..HEAD --oneline 2>/dev/null || echo "差分なし"`

## 変更ファイル
!`git diff main --stat 2>/dev/null || git diff origin/main --stat 2>/dev/null || echo "差分なし"`

## 手順

1. 上記の変更内容を分析する
2. 以下のテンプレートに従ってPR説明文を生成する
3. `gh pr create`で作成する

## PRテンプレート

    ## 概要
    （変更の目的を1-3文で説明）

    ## 変更内容
    - （主要な変更点をリスト）

    ## テスト
    - [ ] 単体テスト
    - [ ] 統合テスト
    - [ ] 手動確認

## ルール

- PRタイトルは70文字以内
- 本文は日本語で記述
- 関連するIssue番号があれば`Closes #XX`を追加
