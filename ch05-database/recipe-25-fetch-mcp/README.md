# レシピ25: Fetch MCPでREST APIを呼び出す

Fetch MCPサーバーの`.mcp.json`設定パターンを収録しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | Fetch MCPの基本設定（uvx使用） |

## セットアップ

1. `.mcp.json`をプロジェクトルートにコピーします。

```bash
cp .mcp.json /path/to/your/project/.mcp.json
```

2. Claude Codeを起動すると、Fetch MCPサーバーが自動接続されます。

```text
> /mcp
MCP Servers:
  fetch: connected (1 tool available)
    - fetch: Fetches a URL from the internet
```

## CLIから追加する場合

```bash
claude mcp add --transport stdio fetch -- uvx mcp-server-fetch
```

## 前提条件

- Python 3.11以上
- uv（Pythonパッケージマネージャ）

uvがインストールされていない場合:

```bash
pip install mcp-server-fetch
# 起動: python -m mcp_server_fetch
```
