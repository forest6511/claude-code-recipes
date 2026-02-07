# レシピ55: Skillsにフロントマターhooksを定義する（スコープ付きライフサイクル）

SKILL.mdのフロントマターにHooksを定義することで、そのSkillsが有効な間だけ発動するスコープ付きHooksを設定する方法です。

## 含まれるファイル

| ファイル | 説明 |
|---------|------|
| `implement-feature/SKILL.md` | ファイル変更時にテスト自動実行するHooks付きSkills |
| `daily-report/SKILL.md` | onceフラグで1回だけセキュリティスキャンを実行するSkills |
| `monitored-deploy/SKILL.md` | Pre/Post/StopフックでデプロイをモニタリングするSkills |

## ポイント

1. **スコープの限定**: Skills有効中のみHooksが発動し、終了時に自動クリーンアップ
2. **settings.jsonとの違い**: settings.jsonのHooksはセッション全体、フロントマターHooksはSkills単位
3. **`once`フラグ**: 1回実行後に自動削除。初期化処理に最適
4. **`async`フラグ**: バックグラウンド実行でSkillsの処理をブロックしない
5. **全イベント種別対応**: PreToolUse、PostToolUse、Stop等すべて利用可能
