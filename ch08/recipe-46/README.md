# レシピ46: ドキュメント自動生成Skillsを作る

コードを解析してドキュメントを自動生成する2つのSkillsです。README生成とコードコメント・docstring生成を用途別に提供します。

## ファイル構成

```
.claude/skills/
├── generate-readme/
│   └── SKILL.md    # README.md生成Skills
└── generate-docs/
    └── SKILL.md    # コードコメント・docstring生成Skills
```

## 使い方

```bash
# READMEの生成
> /generate-readme

# 特定ファイルのドキュメント生成
> /generate-docs src/services/auth.ts

# ディレクトリ全体のドキュメント生成
> /generate-docs src/api/
```

## ポイント

- 「README用」と「コードコメント用」に分け、対象読者と生成内容の違いを明確化
- 過剰なドキュメント生成を防ぐため「対象外」を明示的に定義
- 利用者の視点で記述する（実装の説明ではなく、何ができるか・どう使うか）
