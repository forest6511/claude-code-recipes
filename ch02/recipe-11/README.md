# レシピ11: /cost・/usage・/statsでコストを可視化・管理する

セッションコストをリアルタイムで表示するステータスラインスクリプトです。

## ファイル一覧

| ファイル | 配置先 | 説明 |
|---------|--------|------|
| `statusline-cost.sh` | `~/.claude/statusline-cost.sh` | モデル名・コスト・コンテキスト使用率・経過時間を表示 |

## コマンドの使い分け

| コマンド | 対象ユーザー | 表示内容 |
|---------|-------------|---------|
| `/cost` | API利用者 | セッションのトークン使用量とドル建てコスト |
| `/usage` | サブスクリプション利用者（Pro/Max/Teams） | プランの使用量上限とレート制限 |
| `/stats` | 全ユーザー | 日別の利用状況、セッション履歴、モデル別使用傾向 |

## 使い方

```bash
# スクリプトを配置して実行権限を付与
cp statusline-cost.sh ~/.claude/statusline-cost.sh
chmod +x ~/.claude/statusline-cost.sh

# settings.jsonに登録
# {
#   "statusLine": {
#     "type": "command",
#     "command": "~/.claude/statusline-cost.sh"
#   }
# }
```

## カスタマイズ

- ヘッドレスモードでは`--max-budget-usd 5.00`で予算上限を設定可能
- コスト表示に閾値ベースの色分けを追加すると、高コスト操作のフィードバックが得られます
- API利用者はClaude Consoleでワークスペースごとの支出上限を設定できます
