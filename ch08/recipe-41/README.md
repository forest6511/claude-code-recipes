# レシピ41: テスト駆動開発（TDD）Skillsを作る

TDDの「Red-Green-Refactor」サイクルをガイドし、テストファーストの開発フローを効率化するSkillsです。

## ファイル構成

```
.claude/skills/tdd/
└── SKILL.md    # TDD開発サイクルSkills本体
```

## 使い方

```bash
> /tdd ユーザー認証のパスワードバリデーション機能
```

## ポイント

- 各フェーズ（Red/Green/Refactor）の完了後にテスト実行結果を必ず表示
- `disable-model-invocation: true` で意図的にTDDサイクルを起動する設計
- `allowed-tools` にテストランナーを列挙し、許可ダイアログの中断を防止
