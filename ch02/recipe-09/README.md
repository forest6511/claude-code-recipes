# レシピ09: モデル選択戦略 --- Opus・Sonnet・Haiku・opusplanの使い分け

タスクの性質に応じたモデルの使い分けと、デフォルトモデルの設定例です。

## ファイル一覧

| ファイル | 配置先 | 説明 |
|---------|--------|------|
| `settings.json` | `~/.claude/settings.json` | デフォルトモデルをsonnetに設定する例 |

## モデル選択の指針

| タスクの性質 | 推奨モデル | 理由 |
|-------------|-----------|------|
| アーキテクチャ設計・複雑な計画 | `opus` | 深い推論が必要 |
| 日常的なコーディング・バグ修正 | `sonnet` | コスト効率と品質のバランス |
| 定型的なコード生成・軽微な修正 | `haiku` | 高速・低コスト |
| 計画してから実装するワークフロー | `opusplan` | 計画はOpus品質、実装はSonnet効率 |
| 大量のファイルを扱う長時間作業 | `sonnet[1m]` | コンテキスト制限の緩和 |

## 使い方

```bash
# settings.jsonのmodelフィールドを既存の設定にマージ

# セッション中のモデル切り替え
# > /model sonnet
# > /model opusplan

# 環境変数でも指定可能
export ANTHROPIC_MODEL=sonnet
```

## カスタマイズ

- `opusplan`はプランモード（`Shift+Tab`で切替）でOpus、実行モードでSonnetを自動使い分け
- エフォートレベル（low/medium/high）で推論の深さを調整可能
- サブエージェントのモデルは`CLAUDE_CODE_SUBAGENT_MODEL`環境変数で一括設定
