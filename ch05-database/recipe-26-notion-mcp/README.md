# レシピ26: Notion MCPでドキュメント連携を構築する

Notion MCPを使って、Claude CodeからNotionのページ・データベースを直接操作する設定例です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | Notion MCP基本設定（HTTP transport） |

## セットアップ

### 方法1: CLIから追加

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```

初回接続時にブラウザが開き、OAuth認証フローが実行されます。アクセスを許可するNotionページを選択してください。

### 方法2: .mcp.jsonを配置

`.mcp.json`をプロジェクトルートにコピーしてください。

```bash
cp .mcp.json /path/to/your/project/.mcp.json
```

## 接続確認

Claude Codeで`/mcp`を実行して接続を確認します。

```text
> /mcp
MCP Servers:
  notion: connected (16 tools)
```

## 主要ツール

| ツール名 | 説明 |
|---------|------|
| `notion-search` | キーワードでページ・データベースを検索 |
| `notion-fetch` | ページの内容を取得 |
| `notion-create-pages` | 新規ページを作成 |
| `notion-update-page` | 既存ページを更新 |
| `notion-query-data-sources` | データベースをクエリ |
| `notion-create-comment` | ページにコメントを追加 |

## 注意事項

- OAuth認証時に選択したページのみがアクセス対象です
- 機密情報を含むページへのアクセスはOAuth認証画面で制御できます
