---
name: git-commit
description: ステージされた変更からConventional Commitsに従ったコミットメッセージを生成する
disable-model-invocation: true
allowed-tools: Bash(git diff *), Bash(git log *), Bash(git status *), Bash(git add *), Bash(git commit *)
---

# コミットメッセージ生成

## ステージされた変更
!`git diff --staged --stat 2>/dev/null || echo "ステージされた変更がありません"`

## 直近のコミット履歴
!`git log --oneline -5 2>/dev/null || echo "コミット履歴なし"`

## ルール

1. Conventional Commits形式に従う
2. typeは以下から選択: feat, fix, docs, refactor, test, chore, perf, ci
3. scopeは変更対象のモジュールやディレクトリ名
4. subjectは50文字以内の日本語
5. bodyは変更の「なぜ」を説明する
6. 破壊的変更がある場合はBREAKING CHANGEを付与する

## 形式

    <type>(<scope>): <subject>

    <body>

## 手順

1. ステージされた変更を分析する
2. 適切なtype/scopeを判断する
3. コミットメッセージを提案する
4. ユーザーの確認後、コミットを実行する
