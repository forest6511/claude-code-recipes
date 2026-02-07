# レシピ72: Git Worktreeで安全な並列ブランチ開発

Git Worktreeで複数のブランチを別ディレクトリにチェックアウトし、それぞれでClaude Codeセッションを実行します。ファイルシステムレベルの完全な分離で安全な並列開発を実現します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `scripts/worktree-setup.sh` | Git Worktreeの作成・一覧確認・削除の操作スクリプト |

## 使い方

```bash
# 新しいブランチでworktreeを作成
git worktree add ../project-feature-auth -b feature/auth

# 既存ブランチでworktreeを作成
git worktree add ../project-bugfix-123 bugfix/123

# 各worktreeでClaude Codeを起動
cd ../project-feature-auth && claude
# 別ターミナルで
cd ../project-bugfix-123 && claude

# 作業完了後にworktreeを削除
git worktree remove ../project-feature-auth

# スクリプトを使う場合
./scripts/worktree-setup.sh create feature/auth
./scripts/worktree-setup.sh list
./scripts/worktree-setup.sh remove feature/auth
```

## Agent TeamsとGit Worktreeの使い分け

| 観点 | Agent Teams | Git Worktree |
|------|-------------|-------------|
| 調整 | 自動（共有タスクリスト、メッセージング） | 手動（各worktreeで独立セッション） |
| 用途 | チームメイト間の調整が必要な場合 | 完全に独立したタスクを並列で進める場合 |
| 分離 | 論理的（コンテキスト分離） | 物理的（ファイルシステム分離） |

## 設計のポイント

- 各worktreeでプロジェクトの依存関係（`npm install`等）をインストールする必要がある
- worktreeのセッションに名前を付けると`claude --resume`で後から再開できる
- CI/CDパイプラインでworktreeを使うと同一マシン上で複数のClaude Codeプロセスを並列実行できる

## 関連レシピ

- レシピ69「Agent Teamsの基本」
- レシピ16「Git操作とブランチ戦略を自動化する」
- レシピ12「セッション管理」
