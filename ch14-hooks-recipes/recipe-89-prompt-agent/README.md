# レシピ89: prompt/agent型Hooksで高度な条件制御を行う

command型では対応が難しい「判断を要する検証」に、prompt型（単一LLM呼び出し）とagent型（複数ツール使用可能なサブエージェント）を使い分けます。アーキテクチャ規約の遵守チェック、テスト網羅性の検証、ユーザープロンプトの事前検証などの設定例を含みます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `hooks-settings-prompt.json` | prompt型フックの`settings.json`設定例（アーキテクチャ規約チェック） |
| `hooks-settings-agent.json` | agent型フックの`settings.json`設定例（テスト網羅性検証） |
| `hooks-settings-user-prompt.json` | `UserPromptSubmit`にprompt型を適用した`settings.json`設定例 |