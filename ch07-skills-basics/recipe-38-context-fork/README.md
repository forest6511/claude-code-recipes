# レシピ38: context:forkでサブエージェント実行するSkillsを作る

`context: fork`でSkillsをサブエージェントとして独立コンテキストで実行し、メインの会話コンテキストを消費しない手法です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `deep-research/SKILL.md` | Exploreエージェントでコードベースを徹底調査 |
| `.claude/agents/security-auditor.md` | セキュリティ監査用カスタムエージェント定義 |
| `security-scan/SKILL.md` | カスタムエージェントでセキュリティスキャン実行 |
| `pr-summary/SKILL.md` | PR情報を動的注入してサブエージェントで要約 |

## 使い方

```bash
# Skillsをコピー
cp -r deep-research /path/to/your-project/.claude/skills/deep-research
cp -r security-scan /path/to/your-project/.claude/skills/security-scan

# カスタムエージェントもコピー（security-scanが参照）
cp -r .claude/agents /path/to/your-project/.claude/agents
```

```
# 呼び出し例
> /deep-research 認証フロー
> /security-scan src/auth/
> /pr-summary
```

## agent種別

| agent値 | 特徴 | 適用場面 |
|---------|------|---------|
| `Explore` | 読み取り専用。ファイル変更不可 | コード調査、分析 |
| `Plan` | 設計・計画に最適化。ファイル変更不可 | 実装計画の策定 |
| `general-purpose` | 全ツール使用可能（デフォルト） | 汎用タスク |
| カスタム名 | `.claude/agents/`で定義 | 専門タスク |
