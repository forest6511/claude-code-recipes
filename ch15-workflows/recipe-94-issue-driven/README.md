# レシピ94: Issue駆動開発ワークフローを構築する

GitHub MCPとSkillsを組み合わせて、Issueからブランチ作成、実装、PR作成までの一連の流れを効率化するワークフローです。`/work-issue 42` と実行するだけで、Issue内容の取得からPR作成まで一気通貫で処理できます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `work-issue-SKILL.md` | Issue取得からブランチ作成・実装・PR作成までを実行するSkills |
| `list-issues-SKILL.md` | アサインされたIssueの一覧を優先度順に表示するSkills |

## 配置先

```
.claude/skills/
├── work-issue/
│   └── SKILL.md     ← work-issue-SKILL.md
└── list-issues/
    └── SKILL.md     ← list-issues-SKILL.md
```

## 使い方

1. `/list-issues` でオープンIssueの一覧と優先度を確認
2. `/work-issue 42` でIssue #42の開発を開始
3. Claude Codeが自動的にブランチ作成 → 実装 → PR作成を実行
4. PRレビュー後、`claude --from-pr 42` で前回のコンテキストを復元して修正対応
