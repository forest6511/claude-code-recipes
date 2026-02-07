# レシピ23: PostgreSQL MCPで自然言語からSQLを生成する

DBHub MCPサーバーの`.mcp.json`設定パターンを収録しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | DBHub MCPの基本設定（環境変数使用） |

## セットアップ

1. 環境変数にデータベース接続文字列を設定します。

```bash
export DATABASE_URL="postgresql://user:password@localhost:5432/mydb"
```

2. `.mcp.json`をプロジェクトルートにコピーします。

```bash
cp .mcp.json /path/to/your/project/.mcp.json
```

3. Claude Codeを起動すると、DBHub MCPサーバーが自動接続されます。

```text
> /mcp
MCP Servers:
  db: connected (2 tools available)
    - execute_sql: Execute SQL queries
    - search_objects: Search database schemas
```

## CLIから追加する場合

```bash
claude mcp add --transport stdio db -- \
  npx -y @bytebase/dbhub --dsn "${DATABASE_URL}"
```

## 対応データベース

- PostgreSQL: `postgresql://user:pass@host:5432/db`
- MySQL: `mysql://user:pass@host:3306/db`
- SQLite: `sqlite:///path/to/database.db`
- SQL Server: `sqlserver://user:pass@host:1433/db`
- MariaDB: `mariadb://user:pass@host:3306/db`
