# レシピ98: ヘッドレスモードとシェルスクリプト連携

`-p`（`--print`）フラグを使って、Claude CodeをスクリプトやCI/CDパイプラインに組み込む方法です。標準入出力を活用してUnixツールチェーンの一部品として利用できます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `review-changes.sh` | mainブランチとの差分を自動レビューするスクリプト |
| `package-snippet.json` | `package.json`にClaude Codeをlintツールとして組み込む例 |

## 使い方

### review-changes.sh

```bash
# 実行権限を付与
chmod +x review-changes.sh

# 現在のブランチの変更をレビュー
./review-changes.sh
# → review-report.txt にレビュー結果が出力される
```

### package.jsonへの組み込み

`package-snippet.json` の `scripts` セクションを既存の `package.json` にマージしてください。

```bash
# lintとしてClaude Codeを実行
npm run lint:claude

# セキュリティレビューをJSON形式で取得
npm run review:security
```

## ヘッドレスモードの基本コマンド

```bash
# 基本: プロンプトを渡して結果を取得
claude -p "authモジュールの認証フローを説明して"

# パイプで入力を渡す
cat build-error.txt | claude -p "このビルドエラーの原因を説明して"

# JSON形式で出力（メタデータ付き）
claude -p "コードを分析して" --output-format json

# ツールの自動承認を制御
claude -p "テストを実行して" --allowedTools "Bash,Read,Edit"

# ターン数・コスト制限
claude -p "バグを調査して" --max-turns 10 --max-budget-usd 5.00
```

## 注意事項

- `--allowedTools` の `Bash(git diff *)` ではアスタリスクの前にスペースが必要です
- CI/CD環境では `--max-turns` と `--max-budget-usd` で暴走を防止してください
- 機密データを扱う場合は `--no-session-persistence` でセッション履歴の保存を無効化できます
