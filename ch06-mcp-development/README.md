# 第6章: MCPサーバー開発

ACI（Agent-Computer Interface）設計原則に基づくカスタムMCPサーバーの設計・実装・テスト・デプロイを解説します。TypeScriptとPythonの両方のSDKを使った実装パターンを網羅します。

## レシピ一覧（6件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 29 | [カスタムMCPサーバーの設計と実装 — ACI設計原則とポカヨケ](./recipe-29-aci-design/) | ★★☆ | LLMが正確に使えるツールインターフェース設計 |
| 30 | [TypeScriptでMCPサーバーを作る](./recipe-30-typescript-mcp/) | ★★★ | TypeScript SDKを使ったMCPサーバー実装 |
| 31 | [PythonでMCPサーバーを作る](./recipe-31-python-mcp/) | ★★★ | Python SDK（FastMCP）を使ったMCPサーバー実装 |
| 32 | [MCPサーバーのテストとデバッグ](./recipe-32-mcp-testing/) | ★★☆ | MCP Inspectorと/mcpコマンドによる検証 |
| 33 | [Tool Searchとコンテキスト最適化](./recipe-33-tool-search/) | ★★★ | 多数のMCPサーバー接続時のコンテキスト効率化 |
| 34 | [Claude Code自体をMCPサーバーとして使う（claude mcp serve）](./recipe-34-mcp-serve/) | ★★★ | Claude Codeのツールを外部から利用する方法 |

## 前提条件

- Claude Code: 最新版
- Node.js: 20+（TypeScript MCP SDK用）
- Python: 3.11+（Python MCP SDK用、`uv`推奨）

## クイックスタート

```bash
# TypeScript MCPサーバーの作成
mkdir todo-mcp-server && cd todo-mcp-server
npm init -y
npm install @modelcontextprotocol/sdk zod@3
npm install -D @types/node typescript

# ビルドとClaude Codeへの登録
npm run build
claude mcp add --transport stdio todo-server -- node /path/to/build/index.js

# MCP Inspectorでテスト
npx @modelcontextprotocol/inspector node /path/to/build/index.js

# Python MCPサーバーの作成
uv init file-analyzer && cd file-analyzer
uv venv && source .venv/bin/activate
uv add "mcp[cli]"

# Claude Codeへの登録
claude mcp add --transport stdio file-analyzer -- uv --directory /path/to/file-analyzer run file_analyzer.py
```

## 備考

- 本レシピはTypeScript/Python MCP SDK `v1.x`系に基づいています
- `v2`は開発中（pre-alpha）のため、本書のコード例と異なるAPIが表示される場合があります
- STDIOトランスポートでは`console.log()`や`print()`を使わないでください（stdoutの汚染防止）
- 詳しい解説は書籍本文を参照してください
