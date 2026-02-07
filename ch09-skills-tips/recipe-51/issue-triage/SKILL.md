---
name: issue-triage
description: >-
  Triages GitHub Issues by classifying type and setting priority.
  Use when organizing issues, setting labels, or prioritizing backlog.
disable-model-invocation: true
allowed-tools: mcp__github__get_issue, mcp__github__update_issue, mcp__github__add_issue_comment
---

# Issue分類

## 対象Issue
$ARGUMENTS

## 手順

1. GitHub:get_issueツールでIssueの内容を取得する
2. 以下の基準で分類する
   - bug: バグ報告
   - feature: 機能要求
   - docs: ドキュメント改善
   - chore: メンテナンスタスク
3. 優先度を判定する
   - P0: 本番障害
   - P1: 機能障害
   - P2: 改善要求
   - P3: 要望
4. GitHub:update_issueツールでラベルを設定する
5. GitHub:add_issue_commentツールで分類結果をコメントする
