# レシピ18: Playwright MCPのセットアップと基本操作

Playwright MCPの`.mcp.json`設定パターンを収録しています。用途に応じて選択してください。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | 基本設定（GUIモード） |
| `.mcp-headless.json` | ヘッドレスモード + Chrome指定 |
| `.mcp-isolated.json` | セッション分離モード（テスト向き） |
| `.mcp-mobile.json` | モバイルデバイスエミュレーション |

## 使い方

1. 使いたい設定ファイルをプロジェクトルートに`.mcp.json`としてコピーします。

```bash
cp .mcp.json /path/to/your/project/.mcp.json
```

2. Claude Codeを起動すると、Playwright MCPサーバーが自動接続されます。

```text
> /mcp
MCP Servers:
  playwright: connected (22 tools)
```

## CLIから追加する場合

```bash
claude mcp add playwright npx @playwright/mcp@latest
```

## 主要オプション

| オプション | 説明 |
|-----------|------|
| `--headless` | GUIウィンドウなしで実行（CI/CD向き） |
| `--browser chrome` | ブラウザ指定（chrome/firefox/webkit/msedge） |
| `--isolated` | セッションごとに独立したプロファイルを使用 |
| `--device "iPhone 15"` | デバイスエミュレーション |
| `--viewport-size "1280x720"` | ビューポートサイズ固定 |
| `--storage-state path/to/state.json` | Cookie/ストレージの保存・復元 |
| `--caps testing` | テスト検証ツールを追加 |
