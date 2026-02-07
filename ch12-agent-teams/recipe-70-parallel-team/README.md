# レシピ70: フロントエンド+バックエンド+テストの並列チーム開発

Agent Teamsで各層を担当するチームメイトを配置し、並列で開発を進めます。ファイル分離の原則、チームメイト間のコミュニケーション、plan approvalによる品質担保のパターンを解説します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `prompts/parallel-dev.txt` | 3層並列チーム開発の指示プロンプト例 |
| `prompts/plan-approval.txt` | plan approvalで品質を担保するプロンプト例 |

## 使い方

```bash
# Agent Teamsを有効化した状態で以下のプロンプトを使用
# （有効化方法はレシピ69を参照）

# Claude Codeに並列チーム開発を指示
> ユーザー管理機能を実装します。エージェントチームを作成してください:
> - バックエンド担当: src/api/ にREST APIエンドポイントを実装
> - フロントエンド担当: src/components/ にReactコンポーネントを実装
> - テスト担当: tests/ にユニットテストとE2Eテストを作成
```

## ファイル分離の原則

```
安全な分担の例:
  バックエンド   → src/api/, src/models/, src/services/
  フロントエンド → src/components/, src/hooks/, src/pages/
  テスト         → tests/unit/, tests/e2e/, tests/fixtures/

危険な分担の例:
  バックエンド   → src/api/users.ts
  フロントエンド → src/api/users.ts  ← 同じファイルを2人が編集
  → コンフリクトが発生する
```

2人のチームメイトが同じファイルを編集すると上書きが発生します。各チームメイトが担当するファイルセットを明示的に分離してください。

## 関連レシピ

- レシピ69「Agent Teamsの基本」
- レシピ71「共有タスクリストと依存関係管理」
- レシピ72「Git Worktreeで安全な並列ブランチ開発」
