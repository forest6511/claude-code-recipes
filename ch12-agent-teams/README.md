# 第12章: Agent Teams & 設計パターン

Agent Teams機能とAnthropicの「Building Effective Agents」に基づく設計パターン（Routing、Map-Reduce、Voting）を10のレシピで体系化します。複数のClaude Codeインスタンスをチームとして協調させる方法を解説します。

## レシピ一覧（10件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 69 | [Agent Teamsの基本 — リーダー・チームメイトの仕組み](./recipe-69-agent-teams-basics/) | ★★☆ | 4要素アーキテクチャと有効化方法 |
| 70 | [フロントエンド+バックエンド+テストの並列チーム開発](./recipe-70-parallel-team/) | ★★★ | クロスレイヤー開発の並列化 |
| 71 | [共有タスクリストと依存関係管理](./recipe-71-task-list/) | ★★☆ | タスクの状態管理と自動ブロック解除 |
| 72 | [Git Worktreeで安全な並列ブランチ開発](./recipe-72-worktree/) | ★★☆ | ファイルシステムレベルの完全分離 |
| 73 | [Routingパターン — 入力の複雑度でモデル・エージェントを振り分ける](./recipe-73-routing/) | ★★☆ | タスク性質に応じた自動ルーティング |
| 74 | [バックグラウンド実行と結果監視（Ctrl+B）](./recipe-74-background/) | ★★☆ | 複数タスクの並行管理 |
| 75 | [--agentsフラグで動的にエージェントを定義する](./recipe-75-agents-flag/) | ★★★ | CLI/CI/CDからのJSONエージェント定義 |
| 76 | [Map-Reduceパターン — 並列処理・集約・Voting（合議）の応用](./recipe-76-map-reduce/) | ★★★ | 分割・並列処理・統合の3段階パターン |
| 77 | [専門ロールパターン（PM/Architect/Developer/QA）](./recipe-77-role-pattern/) | ★★★ | 開発プロセス全体をカバーする4ロール |
| 78 | [コスト最適化パターン — 18.75倍のモデル価格差を活かす](./recipe-78-cost-optimization/) | ★★☆ | Opus/Sonnet/Haikuの戦略的使い分け |

## 前提条件

- Claude Code: 最新版
- 第10章・第11章のサブエージェント知識

## クイックスタート

```bash
# Agent Teamsの有効化（settings.json）
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}

# または環境変数で有効化
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

# チームの起動
> エージェントチームを作成して、3人のチームメイトで調査してください
```

## 備考

- Agent Teamsは実験的機能です
- 詳しい解説は書籍本文を参照してください
