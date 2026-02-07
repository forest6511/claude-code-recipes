# レシピ86: ファイル変更時にテストを自動実行する（async hooks）

`PostToolUse`フックに`async: true`を設定し、ファイル編集後にテストをバックグラウンドで自動実行します。Claude Codeはテスト完了を待たずに次の作業を継続でき、テスト結果は次の会話ターンで`systemMessage`として配信されます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `run-tests-async.sh` | ファイル変更後にテストをバックグラウンド実行するスクリプト |
| `hooks-settings.json` | async hookの登録用`settings.json`設定例 |