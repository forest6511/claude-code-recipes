# レシピ32: MCPサーバーのテストとデバッグ

MCP InspectorとClaude Codeの`/mcp`コマンドを使った、MCPサーバーのテスト・デバッグ手順のリファレンスです。

## テスト手順

### 1. MCP Inspectorでサーバー単体テスト

```bash
# TypeScriptサーバーのテスト
npx @modelcontextprotocol/inspector node /path/to/build/index.js

# Pythonサーバーのテスト
npx @modelcontextprotocol/inspector uv --directory /path/to/project run server.py

# npmパッケージのテスト
npx @modelcontextprotocol/inspector npx @modelcontextprotocol/server-filesystem /tmp
```

### 2. Claude Code上での接続確認

```
> /mcp

MCP Servers:
  your-server: connected (N tools available)
```

## トラブルシューティング

| 症状 | 原因 | 対処 |
|------|------|------|
| ツールが表示されない | `registerTool`/`@mcp.tool()`の登録漏れ | ツール登録コードを確認 |
| "Connection closed" | `console.log()`/`print()`によるstdout汚染 | `console.error()`/`logging`に変更 |
| パラメータが渡されない | スキーマ定義の誤り | MCP Inspectorでスキーマを確認 |
| タイムアウト | サーバー起動が遅い | `MCP_TIMEOUT=10000`を設定 |

## ログの確認

```bash
# macOSの場合
tail -f ~/Library/Logs/Claude/mcp-server-your-server.log
```
