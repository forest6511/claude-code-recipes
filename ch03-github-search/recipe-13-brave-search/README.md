# レシピ13: Brave Search MCPでWeb検索結果をAI開発に活かす

Claude CodeからリアルタイムのWeb検索を可能にするBrave Search MCP設定です。

## 使い方

1. Brave Search APIキーを取得します（無料プラン: 月2,000リクエスト）。

```bash
# https://brave.com/search/api/ でアカウント作成・APIキー取得後
export BRAVE_API_KEY="BSA..."
```

2. プロジェクトにMCPサーバーを追加します。

```bash
# ローカルスコープ（現在のプロジェクトのみ）
claude mcp add --transport stdio --env BRAVE_API_KEY=${BRAVE_API_KEY} \
  brave-search -- npx -y @modelcontextprotocol/server-brave-search

# プロジェクトスコープ（チーム共有、.mcp.jsonに書き出し）
claude mcp add --transport stdio --scope project \
  --env BRAVE_API_KEY=${BRAVE_API_KEY} \
  brave-search -- npx -y @modelcontextprotocol/server-brave-search
```

3. 接続状態を確認します。

```bash
> /mcp

# MCP Servers:
#   brave-search: connected (1 tool available)
#     - brave_web_search: Performs web searches using Brave Search API
```

4. 開発中にWeb検索を活用します。

```bash
> Next.js 15のApp Routerで追加された新しいキャッシュ戦略について調べてください

> このエラーメッセージの解決策をWebで検索してください:
  "Module not found: Can't resolve '@auth/prisma-adapter'"
```

## 設定ファイル

`.mcp.json`の内容は以下の通りです。
