# レシピ48: Skillsの活性化率を20%→84%に上げるテクニック

descriptionの書き方を最適化して、Skillsの自動発動率（活性化率）を改善するテクニック集です。

## 含まれるファイル

| ファイル | 説明 |
|---------|------|
| `bad-descriptions/SKILL.md` | 悪い例: 活性化率が低いdescriptionパターン |
| `good-descriptions/SKILL.md` | 良い例: 活性化率が高いdescriptionパターン |

## ポイント

1. **三人称で書く**: descriptionはシステムプロンプトに注入されるため、一人称・二人称ではなく三人称で記述する
2. **「何をするか」+「いつ使うか」を両方含める**: トリガー条件を明示して選択精度を向上
3. **自然なフレーズを含める**: ユーザーが使うフレーズをdescriptionに入れて発動率を改善
4. **キーワードを強化**: 同義語や技術用語を含めてマッチング精度を向上
5. **invocationフラグの使い分け**: `disable-model-invocation`と`user-invocable`の適切な設定
