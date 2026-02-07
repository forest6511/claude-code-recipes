# レシピ92: Spec駆動開発ワークフロー

「仕様→設計→実装→テスト」の4フェーズをSkillsとPlan Modeで管理し、各フェーズの成果物を次のフェーズの入力として連鎖させるワークフローです。仕様書という中間成果物を挟むことで、要件の認識ずれを実装前に発見できます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `spec-create-SKILL.md` | 機能仕様書を構造化して作成するSkills |
| `spec-status-SKILL.md` | Spec駆動開発の進捗状況を確認するSkills |

## 配置先

```
.claude/skills/
├── spec-create/
│   └── SKILL.md    ← spec-create-SKILL.md
└── spec-status/
    └── SKILL.md    ← spec-status-SKILL.md
```

## 使い方

1. `/spec-create ユーザー認証機能` で仕様書を作成
2. `claude --permission-mode plan` でPlan Modeに切り替え、仕様をレビュー
3. Shift+Tabでノーマルモードに戻り、仕様に基づいて実装
4. `/spec-status` で進捗確認
