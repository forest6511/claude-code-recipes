# チーム開発ディレクトリ構成

チームでClaude Codeを利用する際の推奨ディレクトリ構成です。

## 共有する（リポジトリにコミット）

```
my-app/
├── .claude/
│   ├── settings.json       # チーム共有のパーミッション設定
│   ├── agents/
│   │   ├── code-reviewer.md  # 共有エージェント定義
│   │   └── test-writer.md
│   ├── rules/
│   │   ├── typescript.md     # TypeScript用ルール
│   │   └── security.md       # セキュリティルール
│   └── skills/
│       ├── review-code/
│       │   └── SKILL.md      # コードレビューSkills
│       └── work-issue/
│           └── SKILL.md      # Issue処理Skills
├── .mcp.json                 # MCP設定（チーム共有）
└── CLAUDE.md                 # プロジェクトルール
```

## ローカルに留める（.gitignoreに追加）

```
.claude/settings.local.json   # 通知設定、OS固有のパーミッション、個人のAPI鍵
```

## 共有とローカルの判断基準

| 共有する（リポジトリにコミット） | ローカルに留める |
|---|---|
| `.claude/settings.json` | `.claude/settings.local.json` |
| `.claude/agents/` | 通知設定 |
| `.claude/rules/` | OS固有のパーミッション |
| `.claude/skills/` | 個人のAPI鍵 |
| `.mcp.json` | |
| `CLAUDE.md` | |

## Git Worktreeによる並行開発

```bash
# メインの作業ディレクトリ（認証機能）
cd ~/projects/my-app
claude
> /rename auth-feature

# 別のWorktreeを作成（決済機能）
git worktree add ../my-app-payment -b feature/payment
cd ../my-app-payment
claude
> /rename payment-feature

# さらに別のWorktree（バグ修正）
git worktree add ../my-app-bugfix -b fix/login-error
cd ../my-app-bugfix
claude
> /rename login-bugfix
```

## セッション管理コマンド

```bash
# 最近のセッションを継続
claude --continue

# 名前付きセッションを復元
claude --resume auth-feature

# セッション一覧から選択
claude --resume
```
