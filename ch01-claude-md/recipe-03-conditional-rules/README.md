# レシピ03: .claude/rules/で条件付きルールを設定する

pathsフロントマターで特定のファイル操作時にだけルールを適用する手法です。ルールをモジュール化することで、トークン消費の最適化とGitコンフリクトの削減を実現します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.claude/rules/general.md` | 全ファイルに適用される無条件ルール |
| `.claude/rules/typescript.md` | TypeScriptファイル操作時のみ適用 |
| `.claude/rules/testing.md` | テストファイル操作時のみ適用 |

## 使い方

```bash
# プロジェクトにルールディレクトリをコピー
cp -r .claude/rules /path/to/your-project/.claude/rules
```

## カスタマイズ

- **globパターン**: `paths`フロントマターのパターンをプロジェクトのディレクトリ構造に合わせる
- **ルールの追加**: `frontend/react.md`、`backend/api.md`のようにサブディレクトリで整理可能
- **否定パターン**: `!src/**/*.test.ts`で特定のファイルを除外可能
