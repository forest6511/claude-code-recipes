# レシピ42: リファクタリングSkillsを作る

コードスメルの検出から安全なリファクタリング計画の策定・実行までをガイドするSkillsです。

## ファイル構成

```
.claude/skills/refactor/
└── SKILL.md    # リファクタリングSkills本体
```

## 使い方

```bash
> /refactor src/services/order-service.ts
```

## ポイント

- 4ステップ（分析 → 計画 → 実行 → 報告）で安全なリファクタリングを構造的に強制
- 変更ごとにテストを実行し、テストが失敗したら直前の変更を取り消す
- `disable-model-invocation: true` で意図的な判断を伴うリファクタリングを明示的に起動
