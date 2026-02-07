# レシピ77: 専門ロールパターン（PM/Architect/Developer/QA）

PM、Architect、Developer、QAの4つの専門ロールをカスタムサブエージェントとして定義し、開発プロセス全体をカバーします。チェーン方式とAgent Teamsの両方で活用できます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.claude/agents/pm-agent.md` | プロダクトマネージャー（要件定義・仕様書作成） |
| `.claude/agents/architect-agent.md` | ソフトウェアアーキテクト（技術設計・設計判断） |
| `.claude/agents/developer-agent.md` | 開発者（コード実装・ユニットテスト） |
| `.claude/agents/qa-agent.md` | QAエンジニア（テスト設計・品質検証） |
| `prompts/chain-workflow.txt` | チェーン方式での活用プロンプト例 |
| `prompts/team-workflow.txt` | Agent Teamsでの並列活用プロンプト例 |

## 使い方

```bash
# エージェント定義をプロジェクトにコピー
cp -r .claude /path/to/your-project/

# チェーン方式: 順次実行
> ユーザープロフィール編集機能を実装してください。
> 以下の順序で各専門エージェントを使ってください:
> 1. pm-agentで仕様書を作成する
> 2. 仕様書を確認させてください（中間ゲート）
> 3. architect-agentで技術設計を行う
> 4. developer-agentで実装する
> 5. qa-agentでテストと品質検証を行う

# Agent Teams方式: 依存関係付き並列
> エージェントチームを作成して、PM → Architect → Developer → QA
> の依存関係で開発を進めてください
```

## ロール一覧

| ロール | モデル | 主な責務 |
|--------|--------|----------|
| PM | Sonnet | ユーザーストーリー作成、受け入れ基準定義、仕様書作成 |
| Architect | Sonnet | 技術設計、コンポーネント設計、技術的負債の評価 |
| Developer | Sonnet | コード実装、ユニットテスト作成、自己レビュー |
| QA | Sonnet | テストケース設計・実行、エッジケース特定、品質レポート |

## 設計のポイント

- `memory: project`を設定したPMとArchitectは過去の仕様・設計判断を蓄積する
- 小規模タスクでは4ロール全てを使う必要はない（PM+QAのみでも有効）
- DevとQAの間にフィードバックループを設けると品質が向上する

## 関連レシピ

- レシピ59「カスタムエージェントを定義する」
- レシピ64「Prompt Chainingと中間ゲート設計」
- レシピ92「Spec駆動開発ワークフロー」
