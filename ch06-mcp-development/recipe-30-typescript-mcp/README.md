# レシピ30: TypeScriptでMCPサーバーを作る

TypeScript MCP SDK（v1.x）を使って、タスク管理MCPサーバーを実装するサンプルです。

## 前提条件

- Node.js 18以上
- npm

## セットアップ

```bash
cd recipe-30-typescript-mcp
npm install
npm run build
```

## Claude Codeへの接続

```bash
claude mcp add --transport stdio todo-server -- \
  node /absolute/path/to/recipe-30-typescript-mcp/build/index.js
```

## 提供するツール

| ツール名 | 説明 |
|----------|------|
| `add_todo` | 新しいタスクを追加 |
| `list_todos` | タスクの一覧を取得 |
| `complete_todo` | タスクを完了状態に変更 |

## 動作確認

```bash
# MCP Inspectorでテスト
npx @modelcontextprotocol/inspector node build/index.js
```

## 注意事項

- 本サンプルはMCP SDK v1.x系に基づいています
- STDIOトランスポートでは `console.log()` を使わないでください（JSON-RPC通信が破壊されます）
- ログ出力は `console.error()` を使用します
