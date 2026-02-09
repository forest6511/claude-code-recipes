# 第10章: サブエージェントの基礎と設計

サブエージェント（Taskツール）の仕組みと、カスタムエージェント定義・権限制御・永続メモリの基本パターンを5つのレシピで解説します。Anthropicが提唱する「シンプルさ」「透明性」「ACI設計」の3原則をサブエージェント設計に落とし込みます。

## レシピ一覧（5件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 57 | [Taskツールの仕組みと独立コンテキストを理解する](./recipe-57-task-tool/) | ★☆☆ | サブエージェントの基本動作モデルと制約 |
| 58 | [エージェント種別を使い分ける](./recipe-58-agent-types/) | ★★☆ | Explore/Plan/general-purpose/Bashの選択基準 |
| 59 | [カスタムエージェントを定義する](./recipe-59-custom-agents/) | ★★☆ | .claude/agents/でプロジェクト固有のサブエージェントを作成 |
| 60 | [tools/disallowedToolsでエージェントの権限を制御する](./recipe-60-tools-control/) | ★★☆ | 最小権限の原則に基づくツールアクセス制御 |
| 61 | [永続メモリパターン — MEMORY.mdで知識を蓄積する](./recipe-61-memory/) | ★★☆ | セッションをまたいで知見を蓄積・活用 |

## 前提条件

- Claude Code: 最新版

## クイックスタート

```bash
# カスタムエージェントのディレクトリ作成
mkdir -p .claude/agents

# サンプルエージェントをコピー
cp -r path/to/recipe-59-custom-agents/code-reviewer.md .claude/agents/

# エージェント一覧を確認
> /agents
```

## 備考

- 詳しい解説は書籍本文を参照してください
