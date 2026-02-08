# 第6章: MCPサーバー開発

ACI（Agent-Computer Interface）設計原則に基づいて、カスタムMCPサーバーの設計・実装・テスト・最適化を体系的に解説します。TypeScriptとPythonの両方の実装例を収録しています。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 29 | [ACI設計原則とポカヨケ](./recipe-29-aci-design/) | ツール定義のGood/Badパターンで設計原則を理解する |
| 30 | [TypeScriptでMCPサーバーを作る](./recipe-30-typescript-mcp/) | MCP SDK（TypeScript）でタスク管理サーバーを実装する |
| 31 | [PythonでMCPサーバーを作る](./recipe-31-python-mcp/) | FastMCPでファイル分析サーバーを実装する |
| 32 | [MCPサーバーのテストとデバッグ](./recipe-32-mcp-testing/) | MCP Inspectorと`/mcp`コマンドでテスト・デバッグする |
| 33 | [Tool Searchとコンテキスト最適化](./recipe-33-tool-search/) | 多数のMCPサーバー接続時のコンテキスト消費を最適化する |
| 34 | [Claude Code自体をMCPサーバーとして使う](./recipe-34-mcp-serve/) | `claude mcp serve`で他のアプリケーションからClaude Codeを利用する |

## 使い方

```bash
# 例: TypeScript MCPサーバーをビルド・実行
cd recipe-30-typescript-mcp
npm install && npm run build

# 例: Python MCPサーバーを実行
cd recipe-31-python-mcp
uv run file_analyzer.py

# 例: Claude Codeに登録
claude mcp add --scope local todo -- node /path/to/recipe-30-typescript-mcp/build/index.js
```

レシピ32はリファレンス資料のため、サンプルコードはREADME.mdに記載しています。
