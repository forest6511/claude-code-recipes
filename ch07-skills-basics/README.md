# 第7章: Skills設計と基本

Claude Codeの機能を拡張する`SKILL.md`ファイルのパターン集です。基本構造から動的パラメータ、サブエージェント連携まで4つのレシピで土台を築きます。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 35 | [`SKILL.md`の基本構造](./recipe-35-basic-structure/) | フロントマターとマークダウン本文の役割を理解する |
| 36 | [初めてのカスタムSkills](./recipe-36-first-skill/) | コミットメッセージ生成とコード説明のSkillsを作成する |
| 37 | [$ARGUMENTSで動的パラメータ](./recipe-37-arguments/) | 引数展開と`` !`command` ``で動的なSkillsを作る |
| 38 | [context:forkでサブエージェント実行](./recipe-38-context-fork/) | メインコンテキストを消費せず重い処理を分離する |

## 使い方

```bash
# 例: コミットメッセージ生成Skillsをプロジェクトに追加
cp -r recipe-36-first-skill/commit-message /path/to/your-project/.claude/skills/commit-message
```

各`SKILL.md`ファイルはそのまま`.claude/skills/`にコピーして使えます。
