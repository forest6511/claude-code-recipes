---
name: commit-message
description: ステージされた変更からコミットメッセージを生成する。git commitの前に使用する。
argument-hint: [--amend]
disable-model-invocation: true
allowed-tools: Bash(git diff *), Bash(git log *), Bash(git status)
---

# コミットメッセージ生成

ステージされた変更を分析し、Conventional Commitsに従ったコミットメッセージを生成します。

## 手順

1. `git diff --staged`でステージされた変更を確認する
2. `git log --oneline -5`で直近のコミット履歴を確認する
3. 変更内容を分析し、以下の形式でコミットメッセージを生成する

## コミットメッセージ形式

  <type>(<scope>): <subject>

  <body>

### typeの選択基準
- feat: 新機能の追加
- fix: バグ修正
- docs: ドキュメントの変更
- refactor: リファクタリング
- test: テストの追加・修正
- chore: ビルド設定やツールの変更

### ルール
- subjectは50文字以内
- bodyは変更の「なぜ」を説明する
- 日本語で記述する
- $ARGUMENTSに--amendが指定された場合は直前のコミットの修正として扱う
