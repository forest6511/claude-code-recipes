# レシピ91: MCP+Skills+Hooksで作る品質ゲートパイプライン

MCP（外部ツール連携）、Skills（再利用可能な手順）、Hooks（自動トリガー）を組み合わせて、「生成→評価→改善」を自動で反復する品質ゲートパイプラインを構築します。Stop Hooksでタスク完了時に品質チェックを自動起動し、結果をGitHub Issueに記録します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `quality-gate-SKILL.md` | 品質ゲート実行Skills（lint・型チェック・テスト・セキュリティスキャン） |
| `post-review-SKILL.md` | レビュー結果をGitHub Issueに記録するSkills |
| `settings.json` | Stop Hooksでタスク完了時に品質ゲートを自動トリガーする設定 |

## 配置先

```
.claude/
├── skills/
│   ├── quality-gate/
│   │   └── SKILL.md          ← quality-gate-SKILL.md
│   └── post-review/
│       └── SKILL.md          ← post-review-SKILL.md
└── settings.json             ← settings.json（またはsettings.local.json）
```

## 使い方

1. 各ファイルを上記の配置先にコピーする
2. 手動実行: `/quality-gate` でSkillsを呼び出す
3. 自動実行: コード変更を含むタスク完了時にStop Hooksが自動的に品質チェックを促す
