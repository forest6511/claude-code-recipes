# レシピ12: セッション管理 --- /continue・/resume・/rewindの使い分け

セッションの再開・巻き戻し・分岐に関するコマンドの使い分けガイドです。

## コマンド一覧

| コマンド | 用途 | 動作 |
|---------|------|------|
| `/continue`（`-c`） | 直前のセッションを再開 | 現在のディレクトリで最後に使ったセッションを復元 |
| `/resume`（`-r`） | 特定のセッションを再開 | セッションIDまたは名前で指定 |
| `/rewind` | セッション内の巻き戻し | 会話やコードを特定のチェックポイントまで戻す |

## リワインドのアクション

| アクション | 効果 |
|-----------|------|
| Restore code and conversation | コードと会話の両方を選択した時点に戻す |
| Restore conversation | 会話だけ戻す（コードは現在の状態を維持） |
| Restore code | コードだけ戻す（会話は現在の状態を維持） |
| Summarize from here | 選択した時点以降を要約に圧縮する |

## 基本ワークフロー

```bash
# セッションに名前を付けて終了
# > /rename auth-refactor
# > /exit

# 翌日、直前のセッションを再開
claude -c

# 名前を指定して再開
claude -r auth-refactor

# セッション一覧から選択
claude -r

# セッションを分岐して別のアプローチを試す
claude --continue --fork-session

# PRに関連付けられたセッションを再開
claude --from-pr 123
```

## カスタマイズ

- チーム内でセッション名の命名規則を決めておくと再開が容易（例: `feature/auth-jwt`、`fix/login-timeout`）
- `--no-session-persistence`フラグ（ヘッドレスモードのみ）でセッションを保存しない一時実行が可能
- チェックポイントはClaude Codeのファイル編集ツールによる変更のみ追跡（`rm`等のBashコマンドは対象外）
- チェックポイントのデフォルト保持期間は30日間
