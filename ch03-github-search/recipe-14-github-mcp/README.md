# レシピ14: GitHub MCPでIssue・PRワークフローを自動化する

GitHub MCPサーバーを接続し、Claude CodeからIssue・PR・コードレビューを直接操作します。

## 使い方

1. GitHub MCPサーバーを追加します（HTTPトランスポート、OAuth認証）。

```bash
claude mcp add --transport http github https://api.githubcopilot.com/mcp/
```

2. Claude Code内で認証を行います。

```bash
> /mcp
# 「Authenticate」を選択 → ブラウザが開く → GitHubにログイン → 認証完了
```

3. Issue操作を自動化します。

```bash
> リポジトリの未対応Issueを優先度順に表示してください

> 以下の内容でIssueを作成してください:
  タイトル: ユーザープロフィール画面のレスポンシブ対応
  ラベル: enhancement, frontend
  本文: モバイル端末でプロフィール画面のレイアウトが崩れる問題の修正

> Issue #42の内容を読んで、実装方針をまとめてください
```

4. PRワークフローを自動化します。

```bash
> 現在の変更でPRを作成してください。
  タイトルと説明は変更内容から自動生成してください

> PR #15のレビューコメントを確認して、指摘された問題を修正してください

> PR #15のファイル変更を確認して、セキュリティ上の問題がないかチェックしてください
```

## 設定ファイル

`.mcp.json`でチーム共有する場合の設定例です。各開発者が`/mcp`コマンドで個別に認証を行います。
