# Contributing

このリポジトリは書籍「Claude Code実践レシピ」のサンプルコード集です。

## 貢献について

- **バグ報告・誤り指摘**: [Issues](https://github.com/forest6511/claude-code-recipes/issues)で受け付けています
- **新規レシピの追加**: 書籍との整合性のため、PRは受け付けておりません
- **質問**: [Issues](https://github.com/forest6511/claude-code-recipes/issues)で「question」ラベルを付けてください

## API KEYの取り扱い

**絶対にAPIキーや機密情報をコミットしないでください。**

設定ファイル内のAPIキーは必ず環境変数のプレースホルダーを使用します。

```json
{
  "env": {
    "BRAVE_API_KEY": "${BRAVE_API_KEY}",
    "GITHUB_TOKEN": "${GITHUB_TOKEN}"
  }
}
```

読者が実際に使う際は、各自の環境変数に実際のキーを設定してください。

## テスト方針

| 種別 | チェック方法 |
|------|-------------|
| JSON/YAML設定ファイル | 構文バリデーション |
| シェルスクリプト | shellcheck |
| TypeScript MCPサーバー | ディレクトリ内の `npm test` |
| Python MCPサーバー | ディレクトリ内の `pytest` |

## ディレクトリ規約

- `chXX-name/recipe-XX-description/` の命名規則に従う
- 実行可能コードには個別の `package.json` または `pyproject.toml` を含める
- 設定ファイル例は完全かつ有効な形式で記述する
