# レシピ43: GitワークフローSkillsを作る（コミット・PR・リリースノート）

Git操作の3つの場面（コミットメッセージ生成、PR作成、リリースノート生成）をそれぞれSkillsとして標準化します。

## ファイル構成

```
.claude/skills/
├── git-commit/
│   └── SKILL.md         # コミットメッセージ生成Skills
├── git-pr/
│   └── SKILL.md         # Pull Request作成Skills
└── release-notes/
    └── SKILL.md         # リリースノート生成Skills
```

## 使い方

```bash
# コミットメッセージ生成
> /git-commit

# Pull Request作成
> /git-pr

# リリースノート生成
> /release-notes 1.2.0
```

## ポイント

- 3つのSkillsに分けることで単一責務の原則に従い、自動読み込みの精度を向上
- `` !`command` `` による前処理でgit情報をコンテキストに直接注入
- `disable-model-invocation: true` でGit操作の自動開始を防止（副作用を伴うため）
