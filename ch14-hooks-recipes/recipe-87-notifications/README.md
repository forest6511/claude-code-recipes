# レシピ87: タスク完了時にデスクトップ/サウンド通知を自動送信する

`Notification`フックでタスク完了や入力待ちをデスクトップ通知とサウンドで知らせます。ターミナルから離れていてもタスクの完了や許可ダイアログの表示に気づけるようになります。macOSとLinuxの両方に対応しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `notify-complete.sh` | macOS向けデスクトップ通知・サウンド通知スクリプト |
| `notify-complete-linux.sh` | Linux向けデスクトップ通知・サウンド通知スクリプト |
| `hooks-settings.json` | 通知フックの登録用`settings.json`設定例（全通知種別対応） |
| `hooks-settings-detailed.json` | 通知種別ごとにサウンドを変える`settings.json`設定例 |