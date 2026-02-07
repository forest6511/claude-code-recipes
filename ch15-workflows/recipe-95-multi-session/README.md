# レシピ95: マルチセッション・チーム開発パターン

Git Worktree、セッション管理、共有設定を組み合わせて、並行開発とチーム共有のパターンを構築します。チーム共有の設定（Skills、Agents、Rules）はリポジトリにコミットし、個人設定（通知、OS固有のパーミッション）は`settings.local.json`に分離します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `settings.json` | チーム共有のパーミッション設定例 |
| `settings.local.json` | 個人用ローカル設定例（通知・OS固有のパーミッション） |
| `team-directory-structure.md` | チーム開発におけるディレクトリ構成の参考資料 |

## 配置先

```
.claude/
├── settings.json         ← settings.json（リポジトリにコミット）
├── settings.local.json   ← settings.local.json（.gitignoreに追加）
├── agents/               ← チーム共有エージェント定義
├── rules/                ← チーム共有ルール
└── skills/               ← チーム共有Skills
```

## 使い方

1. `settings.json` をチーム共有設定としてリポジトリにコミット
2. `settings.local.json` は各メンバーが個人環境に合わせて配置（`.gitignore`対象）
3. Git Worktreeで並行開発: `git worktree add ../my-app-feature -b feature/xxx`
4. セッション名を付ける: `/rename auth-feature`
5. セッション復元: `claude --resume auth-feature`
