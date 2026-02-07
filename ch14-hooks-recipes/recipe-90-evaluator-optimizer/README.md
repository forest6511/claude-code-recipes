# レシピ90: Stop Hooksでタスク完了を自動検証する --- Evaluator-Optimizerループの構築

`Stop`フックでタスク完了時にテスト・lintを自動検証し、基準を満たさない場合はexit code 2で作業継続を指示します。Anthropicが「Building Effective Agents」で提唱するEvaluator-Optimizerパターンの実装で、command型・prompt型・agent型の3つのアプローチを含みます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `verify-completion.sh` | command型: テスト・lint実行による決定論的な完了検証スクリプト |
| `hooks-settings-command.json` | command型Stop Hookの`settings.json`設定例 |
| `hooks-settings-prompt.json` | prompt型: LLMによる意味的な完了判断の`settings.json`設定例 |
| `hooks-settings-agent.json` | agent型: サブエージェントによる高精度な完了検証の`settings.json`設定例 |