# レシピ40: コードレビューSkillsを作る

PRの差分を自動取得し、正確性・セキュリティ・パフォーマンス・可読性・テストの5つの観点で体系的にレビューするSkillsです。

## ファイル構成

```
.claude/skills/review-code/
└── SKILL.md    # コードレビューSkills本体
```

## 使い方

```bash
# PR全体をレビュー
> /review-code

# 特定のファイルをレビュー
> /review-code src/auth/login.ts

# ディレクトリを指定
> /review-code src/api/
```

## ポイント

- `context: fork` でサブエージェントとして実行し、メインのコンテキストを消費しない
- `agent: Explore` で読み取り専用、誤ってコードを変更するリスクを排除
- レビュー観点を固定テンプレートにすることでチーム内で基準を標準化
