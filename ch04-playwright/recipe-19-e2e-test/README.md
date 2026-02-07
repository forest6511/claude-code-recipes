# レシピ19: E2Eテストの自動生成と実行

`--caps testing`を有効にしたPlaywright MCP設定と、生成されるテストコードのサンプルです。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | testing Capability付きの設定 |
| `tests/login.spec.ts` | ログインフォームのE2Eテストサンプル |

## 使い方

1. `.mcp.json`をプロジェクトルートにコピーします。
2. テスト対象のアプリケーションを起動します。
3. Claude Codeでテスト生成を指示します。

```text
> http://localhost:3000 のログインフォームのE2Eテストを生成して。
> 正常ログイン、パスワード間違い、空欄送信の3パターンをカバーして。
```

## テスト実行

```bash
npx playwright test tests/login.spec.ts
```

## testing Capabilityで追加されるツール

- `browser_generate_locator`: テスト用のロケータを生成
- `browser_verify_element_visible`: 要素の表示を検証
- `browser_verify_text_visible`: テキストの表示を検証
