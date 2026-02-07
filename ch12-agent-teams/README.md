# 第12章: Agent Teams & 設計パターン

複数のClaude Codeインスタンスをチームとして協調させるAgent Teams機能と、Anthropicの「Building Effective Agents」に基づく設計パターン（Routing、Map-Reduce、Voting）を10のレシピで体系化します。Agent Teamsは実験的機能ですが、日本語書籍で初めてカバーする内容です。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 69 | [Agent Teamsの基本](./recipe-69-agent-teams-basics/) | リーダー・チームメイトの仕組み、有効化方法、表示モードの設定 |
| 70 | [フロントエンド+バックエンド+テストの並列チーム開発](./recipe-70-parallel-team/) | 3層を担当するチームメイトを配置し並列で開発を進める |
| 71 | [共有タスクリストと依存関係管理](./recipe-71-task-list/) | タスクの状態管理と依存関係を自動化する |
| 72 | [Git Worktreeで安全な並列ブランチ開発](./recipe-72-worktree/) | 複数ブランチを別ディレクトリにチェックアウトし並列開発する |
| 73 | [Routingパターン](./recipe-73-routing/) | 入力の複雑度でモデル・エージェントを振り分けるパターン |
| 74 | [バックグラウンド実行と結果監視](./recipe-74-background/) | Ctrl+Bでタスクをバックグラウンドに切り替え並行管理する |
| 75 | [--agentsフラグで動的にエージェントを定義する](./recipe-75-agents-flag/) | JSONでセッション限りのエージェントを動的に定義する |
| 76 | [Map-Reduceパターン](./recipe-76-map-reduce/) | 並列処理・集約・Voting（合議）の応用パターン |
| 77 | [専門ロールパターン](./recipe-77-role-pattern/) | PM/Architect/Developer/QAの4つの専門ロール定義 |
| 78 | [コスト最適化パターン](./recipe-78-cost-optimization/) | モデル価格差を活かしたコスト最適化戦略 |

## 使い方

```bash
# 例: Agent Teams有効化設定をプロジェクトに追加
cp ch12-agent-teams/recipe-69-agent-teams-basics/settings.json /path/to/your-project/.claude/settings.json

# 例: Routingパターンのエージェント定義をコピー
cp -r ch12-agent-teams/recipe-73-routing/.claude /path/to/your-project/

# 例: 専門ロールのエージェント定義をコピー
cp -r ch12-agent-teams/recipe-77-role-pattern/.claude /path/to/your-project/
```

Agent Teams関連のレシピはプロンプト例を`.txt`ファイルで提供しています。設定ファイル（`settings.json`、`.claude/agents/*.md`）はそのままプロジェクトにコピーして使えます。
