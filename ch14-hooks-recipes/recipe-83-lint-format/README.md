# レシピ83: コミット前に自動lint/formatを実行する

`PreToolUse`フックでgit commitコマンドを検知し、ステージされたJS/TSファイルにESLintとPrettierを自動実行します。lintエラーがあればコミットをブロックし、Claude Codeにエラー内容をフィードバックして自動修正を促します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `pre-commit-lint.sh` | コミット前にlint/formatを実行するフックスクリプト |
| `hooks-settings.json` | フック登録用の`settings.json`設定例 |