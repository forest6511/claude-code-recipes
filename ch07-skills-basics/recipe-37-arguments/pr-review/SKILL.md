---
name: pr-review
description: 現在のPRをレビューする
disable-model-invocation: true
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---

## PRの差分
!`gh pr diff`

## 変更されたファイル一覧
!`gh pr diff --name-only`

## PRのコメント
!`gh pr view --comments`

## レビュー指示
上記の情報を基に、以下の観点でレビューしてください。

1. ロジックの正確性
2. エッジケースの考慮
3. テストカバレッジ
