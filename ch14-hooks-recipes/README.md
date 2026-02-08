# 第14章: Hooks活用レシピ

品質管理、セキュリティ、通知、テスト自動化、高度な条件制御まで、Hooksの実践的な活用パターンを8つのレシピで紹介します。command型からprompt/agent型まで段階的にカバーしています。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 83 | [コミット前に自動lint/formatを実行](./recipe-83-lint-format/) | `PreToolUse`でESLint+Prettierを自動実行する |
| 84 | [危険コマンドをブロック](./recipe-84-danger-block/) | `rm -rf /`や`DROP TABLE`などの破壊的コマンドを検出・阻止する |
| 85 | [環境変数・機密情報の漏洩防止](./recipe-85-env-protection/) | パーミッション+Hooks+Gitの3層防御で機密情報を保護する |
| 86 | [ファイル変更時にテストを自動実行](./recipe-86-auto-test/) | `async: true`でテストをバックグラウンド実行する |
| 87 | [タスク完了時にデスクトップ/サウンド通知](./recipe-87-notifications/) | macOS/Linux対応の通知とサウンドで完了を知らせる |
| 88 | [コード変更前にGitチェックポイントを作成](./recipe-88-git-checkpoint/) | ファイル編集前に自動コミットで復元ポイントを作る |
| 89 | [prompt/agent型Hooksで高度な条件制御](./recipe-89-prompt-agent/) | LLM判断やサブエージェントで動的な検証を行う |
| 90 | [Stop Hooksでタスク完了を自動検証](./recipe-90-evaluator-optimizer/) | Evaluator-Optimizerパターンで品質基準を満たすまで自動改善する |

## 使い方

```bash
# 例: コミット前lint設定をコピー
cp recipe-83-lint-format/.claude/hooks/pre-commit-lint.sh /path/to/your-project/.claude/hooks/
chmod +x /path/to/your-project/.claude/hooks/pre-commit-lint.sh

# 例: 危険コマンドブロック設定をコピー
cp recipe-84-danger-block/.claude/hooks/block-dangerous.sh /path/to/your-project/.claude/hooks/

# settings.jsonは各レシピのhooks-settings.jsonを参考に統合してください
```

各レシピのシェルスクリプトは`chmod +x`で実行権限を付与してから使用してください。
