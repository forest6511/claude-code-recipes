# レシピ31: PythonでMCPサーバーを作る

Python MCP SDK（v1.x）の`FastMCP`クラスを使って、ファイル分析MCPサーバーを実装するサンプルです。

## 前提条件

- Python 3.10以上
- uv（推奨）またはpip

## セットアップ

```bash
cd recipe-31-python-mcp
uv venv
source .venv/bin/activate
uv add "mcp[cli]"
```

## Claude Codeへの接続

```bash
claude mcp add --transport stdio file-analyzer -- \
  uv --directory /absolute/path/to/recipe-31-python-mcp run file_analyzer.py
```

## 提供するツール

| ツール名 | 説明 |
|----------|------|
| `analyze_file` | 指定ファイルの統計情報を返す |
| `analyze_directory` | 指定ディレクトリの統計情報を返す |

## 動作確認

```bash
# MCP Inspectorでテスト
npx @modelcontextprotocol/inspector uv --directory . run file_analyzer.py
```

## 注意事項

- 本サンプルはPython MCP SDK v1.x系（FastMCP）に基づいています
- STDIOトランスポートでは `print()` を使わないでください（JSON-RPC通信が破壊されます）
- ログ出力は `logging` モジュールを使用します
