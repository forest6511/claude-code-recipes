---
name: pr-summary
description: PRの変更内容を要約する
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---

## PR情報
- 差分: !`gh pr diff`
- コメント: !`gh pr view --comments`
- 変更ファイル: !`gh pr diff --name-only`

## タスク
上記のPR情報を基に、以下を生成してください。

1. 変更の概要（3行以内）
2. 変更の分類（機能追加/バグ修正/リファクタリング等）
3. レビュー時に注意すべきポイント
4. テストカバレッジの懸念点
