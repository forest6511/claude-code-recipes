# レシピ26: Slack MCPでチーム通知を自動化する

Slack MCPサーバーの`.mcp.json`設定パターンを収録しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | Slack MCPのHTTPトランスポート設定 |

## セットアップ

1. Slack MCPサーバーのURLを公式ドキュメントで確認します。
   - https://docs.slack.dev/ai/mcp-server/

2. `.mcp.json`の`<SlackのMCPサーバーURL>`を実際のURLに置き換えます。

3. Claude Code内で認証を行います。

```text
> /mcp
# Slackの「Authenticate」を選択 → ブラウザが開く → 認証完了
```

## CLIから追加する場合

```bash
claude mcp add --transport http slack <SlackのMCPサーバーURL>
```

## 注意事項

- Slack MCPサーバーは段階的にロールアウトされています。利用可能なURLは時期によって異なるため、最新の公式ドキュメントを参照してください。
- HTTPトランスポートのリモートサーバーでは`"type": "http"`と`"url"`を指定します。
