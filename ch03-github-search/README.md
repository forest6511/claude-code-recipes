# 第3章: GitHub & Web検索連携

GitHub MCPとBrave Search MCPを使った外部サービス連携と開発フロー自動化のレシピ集です。Issue管理からクロスリポジトリ調査まで、チーム開発を効率化します。

## レシピ一覧（5件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 13 | [Brave Search MCPでWeb検索結果をAI開発に活かす](./recipe-13-brave-search/) | ★☆☆ | リアルタイムWeb検索で最新情報を参照 |
| 14 | [GitHub MCPでIssue・PRワークフローを自動化する](./recipe-14-github-mcp/) | ★★☆ | Issue作成、PR管理、コードレビューを会話内で操作 |
| 15 | [GitHub ActionsでClaude Codeを実行する](./recipe-15-github-actions/) | ★★★ | `@claude`メンションでPRレビューやIssue対応を自動化 |
| 16 | [Git操作とブランチ戦略を自動化する](./recipe-16-git-automation/) | ★★☆ | ブランチ作成からPR提出までのフローを自動化 |
| 17 | [複数リポジトリを横断して調査する](./recipe-17-cross-repo/) | ★★☆ | マイクロサービスやモノレポの全体像把握を効率化 |

## 前提条件

- Claude Code: 最新版
- Node.js: 20+
- GitHub CLI (gh): 2.0+

## クイックスタート

```bash
# レシピ14のGitHub MCP設定を参考にプロジェクトに配置
cp ch03-github-search/recipe-14-github-mcp/.mcp.json /path/to/your-project/.mcp.json
```

## 備考

- レシピ17は概念説明中心のためサンプルコードがありません
- 詳しい解説は書籍本文を参照してください
