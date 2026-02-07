# レシピ50: namespace設計 --- plugin:skill-nameパターンとプラグイン配布

プラグインシステムを使ってSkillsにnamespace（名前空間）を付与し、名前の衝突を回避する方法です。

## 含まれるファイル

| ファイル | 説明 |
|---------|------|
| `my-team-plugin/` | プラグインのディレクトリ構造サンプル |
| `my-team-plugin/skills/review-code/SKILL.md` | チーム共通レビューSkills |
| `my-team-plugin/skills/deploy/SKILL.md` | チーム共通デプロイSkills |
| `my-team-plugin/skills/test-runner/SKILL.md` | チーム共通テストSkills |
| `my-team-plugin/hooks/hooks.json` | プラグインのHooks設定 |

## ポイント

1. **namespaceの自動付与**: プラグイン名がprefixとして付く（例: `my-team-plugin:review-code`）
2. **名前衝突の回避**: プラグインのSkillsとプロジェクト固有のSkillsが同名でも共存可能
3. **`${CLAUDE_PLUGIN_ROOT}`**: プラグイン内のスクリプトパスを動的に解決する環境変数
4. **優先順位**: エンタープライズ > 個人 > プロジェクト > プラグイン（namespace分離）
