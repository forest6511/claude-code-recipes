# 第5章: データベース & 外部サービス連携

MCPサーバーを使ったデータベースへの自然言語クエリ、UIコンポーネント生成、REST API連携、ドキュメント連携などの外部サービス連携パターンを解説します。

## レシピ一覧（6件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 23 | [PostgreSQL MCPで自然言語からSQLを生成する](./recipe-23-postgresql-mcp/) | ★★☆ | DBHub MCPでデータベースを自然言語操作 |
| 24 | [Magic MCPでUIコンポーネントを自動生成する](./recipe-24-magic-mcp/) | ★★☆ | 21st.devのMagic MCPでReactコンポーネント生成 |
| 25 | [Fetch MCPでREST APIを呼び出す](./recipe-25-fetch-mcp/) | ★☆☆ | WebコンテンツやAPIレスポンスの取得 |
| 26 | [Notion MCPでドキュメント連携を構築する](./recipe-26-notion-mcp/) | ★★☆ | Notionワークスペースの検索・ページ作成・更新 |
| 27 | [Context7 MCPでフレームワーク公式ドキュメントを参照する](./recipe-27-context7-mcp/) | ★☆☆ | ライブラリの最新ドキュメントをリアルタイム参照 |
| 28 | [複数MCPサーバーを組み合わせたデータパイプライン](./recipe-28-multi-mcp-pipeline/) | ★★★ | 複数MCPサーバーを連携させたワークフロー構築 |

## 前提条件

- Claude Code: 最新版
- Node.js: 20+（DBHub、Magic MCP、Context7 MCP用）
- Python: 3.11+（Fetch MCP用、`uvx`推奨）

## クイックスタート

```bash
# DBHub MCPの追加（PostgreSQL接続）
export DATABASE_URL="postgresql://user:password@localhost:5432/mydb"
claude mcp add --transport stdio db -- npx -y @bytebase/dbhub --dsn "${DATABASE_URL}"

# Fetch MCPの追加
claude mcp add --transport stdio fetch -- uvx mcp-server-fetch

# Notion MCPの追加（HTTP + OAuth）
claude mcp add --transport http notion https://mcp.notion.com/mcp

# Context7 MCPの追加
export CONTEXT7_API_KEY="your-api-key"
claude mcp add --transport stdio --env CONTEXT7_API_KEY=${CONTEXT7_API_KEY} context7 -- npx -y @upstash/context7-mcp

# MCPサーバー接続確認
claude
> /mcp
```

## 備考

- 各MCPサーバーのAPIキーやデータベース接続情報は環境変数で管理してください
- `.mcp.json`をチームで共有する場合、認証情報は`${ENV_VAR}`形式で参照します
- 詳しい解説は書籍本文を参照してください
