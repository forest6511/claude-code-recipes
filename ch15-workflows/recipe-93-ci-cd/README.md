# レシピ93: CI/CDパイプラインにClaude Codeを組み込む

Claude Code GitHub Actions（`anthropics/claude-code-action`）を使って、PRレビュー、Issue対応、定期タスクをGitHub Actionsで自動化します。ヘッドレスモード（`-p`フラグ）を使えばGitHub Actions以外のCI/CDプラットフォームにも対応可能です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `claude.yml` | PRコメントで`@claude`に指示できるワークフロー |
| `claude-review.yml` | PR作成時に自動レビューを実行するワークフロー |
| `claude-custom-ci.yml` | ヘッドレスモードでカスタムCI/CDチェックを実行するワークフロー |
| `claude-issue-handler.yml` | Issueから自動でコード変更・PR作成するワークフロー |

## 配置先

```
.github/workflows/
├── claude.yml               ← claude.yml
├── claude-review.yml        ← claude-review.yml
├── claude-custom-ci.yml     ← claude-custom-ci.yml
└── claude-issue-handler.yml ← claude-issue-handler.yml
```

## 前提条件

1. GitHub App「claude」をインストール: https://github.com/apps/claude
2. リポジトリのSettings > Secrets > Actionsで`ANTHROPIC_API_KEY`を設定
3. または Claude Code内で `/install-github-app` を実行
