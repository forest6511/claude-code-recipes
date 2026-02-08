# 第10章: サブエージェントの基礎と設計

Claude Codeのサブエージェント（Taskツール）の仕組みと、カスタムエージェント定義・権限制御・永続メモリの基本パターンを5つのレシピで解説します。

Anthropicが提唱する「シンプルさ」「透明性」「ACI設計」の3原則を、Claude Codeのサブエージェント設計に落とし込みます。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 57 | [Taskツールの仕組みと独立コンテキスト](./recipe-57-task-tool/) | サブエージェントの動作モデル・再開機能・制約を理解する |
| 58 | [エージェント種別の使い分け](./recipe-58-agent-types/) | Bash/Explore/Plan/general-purposeの4種類を比較する |
| 59 | [カスタムエージェントの定義](./recipe-59-custom-agents/) | `.claude/agents/`ディレクトリにMarkdownで専門エージェントを作る |
| 60 | [tools/disallowedToolsで権限を制御する](./recipe-60-tools-control/) | エージェントが使えるツールを明示的に制限する |
| 61 | [永続メモリパターン（`MEMORY.md`）](./recipe-61-memory/) | エージェントにクロスセッションの学習能力を持たせる |

## 使い方

```bash
# 例: カスタムエージェントをプロジェクトに追加
cp -r recipe-59-custom-agents/.claude /path/to/your-project/

# 例: 権限制御付きエージェントを追加
cp -r recipe-60-tools-control/.claude /path/to/your-project/
cp -r recipe-60-tools-control/scripts /path/to/your-project/
```

各エージェント定義ファイルはそのまま`.claude/agents/`にコピーして使えます。
