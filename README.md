# Claude Code実践レシピ サンプルコード

書籍「**Claude Code実践レシピ** --- MCP・Skills・Hooks・サブエージェントを自在に操る」（森川 陽介 著）のサンプルコード・設定ファイル集です。

## 使い方

各ディレクトリは書籍の章・レシピ番号に対応しています。必要なファイルをコピーして、ご自身のプロジェクトに適用してください。

```bash
# 例: レシピ01のCLAUDE.mdテンプレートをコピー
cp claude-code-recipes/ch01-claude-md/recipe-01-effective-claude-md/CLAUDE.md ./CLAUDE.md
```

## ディレクトリ構成

| ディレクトリ | 章 | レシピ数 |
|-------------|---|---------|
| `ch01-claude-md/` | 第1章: CLAUDE.md & 設定最適化 | 6 |
| `ch03-github-search/` | 第3章: GitHub & Web検索連携 | 5 |
| `ch04-playwright/` | 第4章: ブラウザ自動化 & テスト | 5 |
| `ch05-database/` | 第5章: データベース & 外部サービス連携 | 6 |
| `ch06-mcp-development/` | 第6章: MCPサーバー開発 | 6 |
| `ch07-skills-basics/` | 第7章: Skills設計と基本 | 5 |
| `ch08-skills-templates/` | 第8章: 実践Skillsテンプレート集 | 8 |
| `ch09-skills-tips/` | 第9章: Skills TIPS & 上級テクニック | 9 |
| `ch10-subagents-basics/` | 第10章: サブエージェントの基礎と設計 | 5 |
| `ch11-subagent-dev/` | 第11章: サブエージェント駆動開発 | 7 |
| `ch12-agent-teams/` | 第12章: Agent Teams & 設計パターン | 10 |
| `ch13-hooks-basics/` | 第13章: Hooksの仕組みと基礎 | 4 |
| `ch14-hooks-recipes/` | 第14章: Hooks活用レシピ | 8 |
| `ch15-workflows/` | 第15章: プロジェクトワークフロー | 5 |
| `ch16-power-user/` | 第16章: パワーユーザーTIPS集 | 5 |
| `shared/` | 共通テンプレート・設定 | - |

## レシピ対応表

サンプルコードが含まれるレシピの一覧です（概念説明中心のレシピは省略）。

> 各レシピのサンプルコードは、書籍の執筆完了後に順次追加されます。

### 第1部: 基盤編

| # | レシピ | ディレクトリ |
|---|--------|-------------|
| 01 | 効果的なCLAUDE.mdの書き方 | `ch01-claude-md/recipe-01-effective-claude-md/` |
| 02 | CLAUDE.md階層設計 | `ch01-claude-md/recipe-02-hierarchy/` |
| 03 | .claude/rules/で条件付きルール | `ch01-claude-md/recipe-03-conditional-rules/` |
| 04 | モノレポでのCLAUDE.md分割戦略 | `ch01-claude-md/recipe-04-monorepo/` |
| 05 | settings.jsonの実践設定 | `ch01-claude-md/recipe-05-settings-json/` |
| 06 | パーミッション設計 | `ch01-claude-md/recipe-06-permissions/` |

### 第2部: MCP実践レシピ

| # | レシピ | ディレクトリ |
|---|--------|-------------|
| 13 | Brave Search MCP | `ch03-github-search/mcp-configs/` |
| 14 | GitHub MCP | `ch03-github-search/mcp-configs/` |
| 15 | GitHub Actions連携 | `ch03-github-search/recipe-15-github-actions/` |
| 18 | Playwright MCPセットアップ | `ch04-playwright/mcp-configs/` |
| 19 | E2Eテスト自動生成 | `ch04-playwright/recipe-19-e2e-test/` |
| 23 | PostgreSQL MCP | `ch05-database/mcp-configs/` |
| 29 | MCPサーバー設計 --- ACI原則 | `ch06-mcp-development/recipe-29-basic-design/` |
| 30 | TypeScript MCPサーバー | `ch06-mcp-development/recipe-30-typescript/` |
| 31 | Python MCPサーバー | `ch06-mcp-development/recipe-31-python/` |

### 第3部: Skills実践レシピ

| # | レシピ | ディレクトリ |
|---|--------|-------------|
| 35-38 | Skills基本パターン | `ch07-skills-basics/` |
| 40-47 | Skillsテンプレート集 | `ch08-skills-templates/` |
| 48-56 | Skills上級テクニック | `ch09-skills-tips/` |

### 第4部: サブエージェント実践レシピ

| # | レシピ | ディレクトリ |
|---|--------|-------------|
| 59 | カスタムエージェント定義 | `ch10-subagents-basics/recipe-59-custom-agents/` |
| 61 | 永続メモリパターン | `ch10-subagents-basics/recipe-61-memory/` |
| 70 | 並列チーム開発 | `ch12-agent-teams/recipe-70-parallel-team/` |
| 72 | Git Worktree並列開発 | `ch12-agent-teams/recipe-72-worktree/` |
| 77 | 専門ロールパターン | `ch12-agent-teams/recipe-77-role-pattern/` |

### 第5部: Hooks実践レシピ

| # | レシピ | ディレクトリ |
|---|--------|-------------|
| 80-81 | Hooks基本設定 | `ch13-hooks-basics/` |
| 83-90 | Hooks活用レシピ | `ch14-hooks-recipes/` |

### 第6部: 統合 & パワーユーザーTIPS

| # | レシピ | ディレクトリ |
|---|--------|-------------|
| 91 | 品質ゲートパイプライン | `ch15-workflows/recipe-91-quality-gate/` |
| 92 | Spec駆動開発 | `ch15-workflows/recipe-92-spec-driven/` |
| 93 | CI/CDパイプライン | `ch15-workflows/recipe-93-ci-cd/` |
| 97 | Docker隔離実行 | `ch16-power-user/recipe-97-docker/` |
| 98 | ヘッドレスモード | `ch16-power-user/recipe-98-headless/` |
| 100 | 究極のカスタマイズ戦略 | `ch16-power-user/recipe-100-ultimate-setup/` |

## 動作確認環境

- Claude Code: 執筆時点の最新版（各レシピに記載）
- Node.js: 20+
- Python: 3.11+

## 書籍情報

- **タイトル**: Claude Code実践レシピ
- **著者**: 森川 陽介
- **出版**: Kindle（2026年4月予定）
- **前作**: [Claude Codeではじめる開発入門](https://www.amazon.co.jp/dp/B0F2T3B8GR)

## ライセンス

MIT License --- 詳細は [LICENSE](./LICENSE) を参照してください。
