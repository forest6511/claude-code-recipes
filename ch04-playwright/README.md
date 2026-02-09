# 第4章: ブラウザ自動化 & テスト

Playwright MCPによるブラウザ自動化とテストのレシピ集です。アクセシビリティスナップショットを活用し、高速かつ正確にWebページを操作します。

## レシピ一覧（5件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 18 | [Playwright MCPのセットアップと基本操作](./recipe-18-setup/) | ★☆☆ | `.mcp.json`の設定方法と基本的な操作フロー |
| 19 | [E2Eテストの自動生成と実行](./recipe-19-e2e-test/) | ★★☆ | testing Capabilityを使ったテストコード自動生成 |
| 20 | Webサイトのスクレイピングと情報抽出 | ★★☆ | スナップショットとbrowser_evaluateによるデータ抽出 |
| 21 | フォーム入力とUI操作の自動化 | ★★☆ | browser_fill_formによる一括入力とダイアログ処理 |
| 22 | [アクセシビリティテストの自動化](./recipe-22-a11y-test/) | ★★★ | WCAG 2.1準拠チェックとレポート生成 |

## 前提条件

- Claude Code: 最新版
- Node.js: 20+

## クイックスタート

```bash
# レシピ18のPlaywright MCP設定を参考にプロジェクトに配置
cp ch04-playwright/recipe-18-setup/.mcp.json /path/to/your-project/.mcp.json
```

## 備考

- レシピ20・21は概念説明中心のためサンプルコードがありません
- 詳しい解説は書籍本文を参照してください
