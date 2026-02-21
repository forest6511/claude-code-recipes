# 第14章: Hooks活用レシピ

品質管理、セキュリティ、通知、テスト自動化、高度な条件制御までHooksの実践的な活用パターンを紹介します。

## レシピ一覧（8件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 83 | [コミット前に自動lint/formatを実行する](./recipe-83-lint-format/) | ★☆☆ | PreToolUseフックでgit commit前にESLint/Prettierを自動実行 |
| 84 | [危険コマンド（rm -rf等）をブロックする](./recipe-84-danger-block/) | ★☆☆ | 破壊的コマンドのパターンマッチングとブロック処理 |
| 85 | [環境変数・機密情報の漏洩を防止する](./recipe-85-env-protection/) | ★★☆ | 機密情報パターン検出とファイル保護の多層防御 |
| 86 | [ファイル変更時にテストを自動実行する（async hooks）](./recipe-86-auto-test/) | ★★☆ | async: trueでバックグラウンドテスト実行 |
| 87 | [タスク完了時にデスクトップ/サウンド通知を自動送信する](./recipe-87-notifications/) | ★★☆ | NotificationフックでmacOS/Linux通知を設定 |
| 88 | [コード変更前にGitチェックポイントを作成する](./recipe-88-git-checkpoint/) | ★★☆ | PreToolUseで自動コミットによるロールバック対応 |
| 89 | [prompt/agent型Hooksで高度な条件制御を行う](./recipe-89-prompt-agent/) | ★★★ | LLM判断によるアーキテクチャ規約検証とテスト網羅性チェック |
| 90 | [Stop Hooksでタスク完了を自動検証する](./recipe-90-evaluator-optimizer/) | ★★★ | Evaluator-Optimizerパターンによる品質ゲート構築 |

## 前提条件

- Claude Code: 最新版
- Node.js: 20+（npm/npxコマンド使用時）
- jq: JSON解析ツール

## クイックスタート

```bash
# コミット前lint設定の例
chmod +x .claude/hooks/pre-commit-lint.sh
```

## 備考

- シェルスクリプトは`chmod +x`で実行権限を付与してから使用してください
- 詳しい解説は書籍本文を参照してください
