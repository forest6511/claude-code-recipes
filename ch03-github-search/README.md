# 第3章: GitHub & Web検索連携

Claude Codeと外部サービスを連携させ、開発フローを自動化するためのサンプルコードです。

## 含まれるレシピ

### レシピ13: Brave Search MCPでWeb検索結果をAI開発に活かす

**ディレクトリ**: [`recipe-13-brave-search`](./recipe-13-brave-search/)

Brave Search MCPサーバーを設定し、Claude CodeからリアルタイムのWeb検索を可能にします。ナレッジカットオフ以降の情報や最新のライブラリバージョン・API仕様を開発中に参照できます。

- `.mcp.json`: Brave Search MCP設定（環境変数展開付き）
- README.md: セットアップ手順と使い方

### レシピ14: GitHub MCPでIssue・PRワークフローを自動化する

**ディレクトリ**: [`recipe-14-github-mcp`](./recipe-14-github-mcp/)

GitHub MCPサーバーを接続し、Issue作成、PR管理、コードレビューをClaude Codeの会話内で直接操作します。

- `.mcp.json`: GitHub MCP設定（HTTPトランスポート、OAuth認証）
- README.md: セットアップ手順と使い方

### レシピ15: GitHub ActionsでClaude Codeを実行する（claude-code-action）

**ディレクトリ**: [`recipe-15-github-actions`](./recipe-15-github-actions/)

`claude-code-action`をGitHub Actionsに設定し、`@claude`メンションでPRレビューやIssue対応を自動化します。

- `.github/workflows/claude.yml`: 基本版（`@claude`メンションで実行）
- `.github/workflows/claude-review.yml`: Skills連携版（`prompt`パラメータ付き）
- README.md: セットアップ手順と使い方

### レシピ16: Git操作とブランチ戦略を自動化する

**ディレクトリ**: [`recipe-16-git-automation`](./recipe-16-git-automation/)

Claude Codeの組み込みGit機能を活用し、ブランチ作成からPR提出までの一連のフローを自動化します。パーミッション設定で安全性と生産性を両立させます。

- `.claude/settings.json`: Git操作のパーミッション設定（allow + deny）
- `CLAUDE.md`: Gitワークフローのルール例
- README.md: セットアップ手順と使い方

### レシピ17: 複数リポジトリを横断して調査する

**ディレクトリ**: [`recipe-17-cross-repo`](./recipe-17-cross-repo/)

GitHub MCPのコード検索機能とClaude Codeのファイル参照を組み合わせて、複数リポジトリにまたがる調査を効率化します。マイクロサービスやモノレポの全体像把握に役立ちます。

- README.md: 実践パターンと使い方ガイド（概念レシピのため設定ファイルなし）

## 動作確認環境

- Claude Code: v0.2.0+
- Node.js: 20+
- GitHub CLI (gh): 2.0+ (オプション)

## 関連章

- 第1章: CLAUDE.md & 設定最適化
- 第4章: ブラウザ自動化 & テスト（Playwright MCP）
- 第7章: Skills設計と基本（カスタムSkills作成）
