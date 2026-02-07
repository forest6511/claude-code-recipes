# レシピ35: SKILL.mdの基本構造とfrontmatterを理解する

YAMLフロントマターで動作を制御し、マークダウン本文にClaude Codeへの指示を記述するSkillsの基本構造です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `review-code/SKILL.md` | コードレビューSkillsの基本例 |

## 使い方

```bash
cp -r review-code /path/to/your-project/.claude/skills/review-code
```

Claude Codeで `/review-code` と入力するか、コードレビュー文脈で自動的に読み込まれます。

## フロントマター一覧

| フィールド | 説明 | デフォルト |
|-----------|------|-----------|
| `name` | `/name`で呼び出す際の名前 | ディレクトリ名 |
| `description` | 自動読み込み判断に使用する説明文 | 本文の最初の段落 |
| `disable-model-invocation` | `true`で自動読み込みを無効化 | `false` |
| `user-invocable` | `false`で`/`メニューから非表示 | `true` |
| `allowed-tools` | 許可確認なしで使えるツール | なし |
| `model` | 使用するモデル | 現在のモデル |
| `context` | `fork`でサブエージェント実行 | インライン実行 |
