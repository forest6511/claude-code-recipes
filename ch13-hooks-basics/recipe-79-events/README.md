# レシピ79: 14のイベント種別と発火タイミングを理解する

Claude Code Hooksの14のライフサイクルイベントの概要です。

## イベント一覧

| イベント | 発火タイミング | ブロック可能 |
|---------|-------------|:-----------:|
| `SessionStart` | セッション開始・再開時 | - |
| `UserPromptSubmit` | プロンプト送信、処理前 | Yes |
| `PreToolUse` | ツール実行前 | Yes |
| `PermissionRequest` | 許可ダイアログ表示時 | Yes |
| `PostToolUse` | ツール実行成功後 | - |
| `PostToolUseFailure` | ツール実行失敗後 | - |
| `Notification` | 通知送信時 | - |
| `SubagentStart` | サブエージェント生成時 | - |
| `SubagentStop` | サブエージェント完了時 | Yes |
| `Stop` | Claude応答完了時 | Yes |
| `TeammateIdle` | チームメイトのアイドル時 | Yes |
| `TaskCompleted` | タスク完了マーク時 | Yes |
| `PreCompact` | コンテキスト圧縮前 | - |
| `SessionEnd` | セッション終了時 | - |

## フック種別

| 種別 | 用途 |
|------|------|
| `command` | コマンドを実行（決定論的な制御） |
| `prompt` | LLMに判断を委ねる（単一ターン） |
| `agent` | サブエージェントで検証（マルチターン） |

詳細は書籍「Claude Code実践レシピ」第13章を参照してください。
