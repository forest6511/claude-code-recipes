# レシピ75: --agentsフラグで動的にエージェントを定義する

`--agents`フラグにJSONを渡して、セッション限りのエージェントを動的に定義します。CI/CDパイプラインや一時的な調査タスクに最適です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `scripts/ci-review.sh` | PRの自動レビュースクリプト（セキュリティチェック+テストカバレッジ検証） |
| `scripts/dynamic-agents-example.sh` | --agentsフラグの基本的な使い方の例 |

## 使い方

```bash
# 単一エージェントの動的定義
claude --agents '{
  "code-reviewer": {
    "description": "コードレビューの専門家。コード変更後に積極的に使用する。",
    "prompt": "あなたはシニアコードレビュアーです。品質、セキュリティ、ベストプラクティスに焦点を当ててレビューしてください。",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  }
}'

# CI/CDでの自動レビュー
./scripts/ci-review.sh 42

# JSONファイルから読み込み
claude --agents "$(cat agents-config.json)"
```

## --agentsで指定可能なフィールド

| フィールド | 説明 |
|-----------|------|
| `description` | エージェントの説明（必須） |
| `prompt` | システムプロンプト |
| `tools` | 使用可能なツールの配列 |
| `disallowedTools` | 禁止ツールの配列 |
| `model` | 使用モデル（sonnet/opus/haiku/inherit） |
| `permissionMode` | 権限モード |
| `mcpServers` | MCPサーバー設定 |
| `hooks` | ライフサイクルフック |
| `maxTurns` | 最大ターン数 |
| `skills` | プリロードするSkills |
| `memory` | 永続メモリスコープ |

## 設計のポイント

- `--agents`フラグのエージェントは優先度が最も高い（優先度1）
- ディスクに保存されず、セッション終了で消滅する
- ヘッドレスモード（`-p`フラグ）と組み合わせると完全自動化が可能

## 関連レシピ

- レシピ59「カスタムエージェントを定義する」
- レシピ98「ヘッドレスモードとシェルスクリプト連携」
- レシピ93「CI/CDパイプラインにClaude Codeを組み込む」
