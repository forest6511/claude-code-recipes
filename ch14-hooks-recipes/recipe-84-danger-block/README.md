# レシピ84: 危険コマンド（rm -rf等）をブロックする

`PreToolUse`フックでBashコマンドの内容を正規表現チェックし、`rm -rf /`や`DROP TABLE`などの破壊的コマンドを検出した場合にexit code 2でブロックします。Claude Codeにブロック理由がフィードバックされ、より安全な代替コマンドが自動選択されます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `block-dangerous.sh` | 危険コマンドをパターンマッチングで検出・ブロックするスクリプト |
| `hooks-settings.json` | フック登録用の`settings.json`設定例 |