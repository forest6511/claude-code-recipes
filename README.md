# Claude Code実践レシピ サンプルコード

書籍「**Claude Code実践レシピ** --- MCP・Skills・Hooks・サブエージェントを自在に操る」（森川 陽介 著）のサンプルコード・設定ファイル集です。

## 使い方

各ディレクトリは書籍の章・レシピ番号に対応しています。必要なファイルをコピーして、ご自身のプロジェクトに適用してください。

> **Note**: `.mcp.json`等の設定ファイルに含まれるAPIキーは`${BRAVE_API_KEY}`のようなプレースホルダーです。ご自身の環境変数に実際のキーを設定してから使用してください。

```bash
# 例: レシピ01のCLAUDE.mdテンプレートをコピー
cp claude-code-recipes/ch01-claude-md/recipe-01-effective-claude-md/CLAUDE.md ./CLAUDE.md
```

## ディレクトリ構成

| ディレクトリ | 章 | レシピ数 |
|-------------|---|---------|
| `ch01-claude-md/` | 第1章: CLAUDE.md & 設定最適化 | 6 |
| `ch02/` | 第2章: コンテキスト管理とコスト最適化 | 6 |
| `ch03-github-search/` | 第3章: GitHub & Web検索連携 | 5 |
| `ch04-playwright/` | 第4章: ブラウザ自動化 & テスト | 5 |
| `ch05-database/` | 第5章: データベース & 外部サービス連携 | 6 |
| `ch06-mcp-development/` | 第6章: MCPサーバー開発 | 6 |
| `ch07-skills-basics/` | 第7章: Skills設計と基本 | 5 |
| [`ch08/`](./ch08/) | 第8章: 実践Skillsテンプレート集 | 8 |
| [`ch09-skills-tips/`](./ch09-skills-tips/) | 第9章: Skills TIPS & 上級テクニック | 9 |
| `ch10-subagents-basics/` | 第10章: サブエージェントの基礎と設計 | 5 |
| [`ch11-subagent-dev/`](./ch11-subagent-dev/) | 第11章: サブエージェント駆動開発 | 7 |
| [`ch12-agent-teams/`](./ch12-agent-teams/) | 第12章: Agent Teams & 設計パターン | 10 |
| `ch13-hooks-basics/` | 第13章: Hooksの仕組みと基礎 | 4 |
| `ch14-hooks-recipes/` | 第14章: Hooks活用レシピ | 8 |
| [`ch15-workflows/`](./ch15-workflows/) | 第15章: プロジェクトワークフロー | 5 |
| [`ch16-power-user/`](./ch16-power-user/) | 第16章: パワーユーザーTIPS集 | 5 |
| `shared/` | 共通テンプレート・設定 | - |

## レシピ対応表

サンプルコードが含まれるレシピの一覧です（概念説明中心のレシピは省略）。

> 各レシピのサンプルコードは、書籍の執筆完了後に順次追加されます。

### 第1部: 基盤編

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 01 | 効果的なCLAUDE.mdの書き方 | WHY/WHAT/HOWの3層構造で300行以内にまとめる | [`recipe-01`](./ch01-claude-md/recipe-01-effective-claude-md/) |
| 02 | CLAUDE.md階層設計 | グローバル・プロジェクト・ローカルの3階層で設定を分離する | [`recipe-02`](./ch01-claude-md/recipe-02-hierarchy/) |
| 03 | .claude/rules/で条件付きルール | pathsフロントマターで特定ファイル操作時にだけルールを適用 | [`recipe-03`](./ch01-claude-md/recipe-03-conditional-rules/) |
| 04 | モノレポでのCLAUDE.md分割戦略 | 再帰的探索と遅延読み込みを活用したパッケージ別配置 | [`recipe-04`](./ch01-claude-md/recipe-04-monorepo/) |
| 05 | settings.jsonの実践設定 | 3つのスコープでパーミッション・モデル・MCP設定を管理 | [`recipe-05`](./ch01-claude-md/recipe-05-settings-json/) |
| 06 | パーミッション設計 | deny/ask/allowの3段階評価で安全性と生産性を両立 | [`recipe-06`](./ch01-claude-md/recipe-06-permissions/) |
| 07 | コンテキストウィンドウの仕組みと/contextで監視する | ステータスラインでコンテキスト使用率をリアルタイム監視 | [`recipe-07`](./ch02/recipe-07/) |
| 08 | /compactのカスタム圧縮指示とタイミング戦略 | CLAUDE.mdにcompact指示を記述し重要情報を優先保持 | [`recipe-08`](./ch02/recipe-08/) |
| 09 | モデル選択戦略 | Opus・Sonnet・Haiku・opusplanのタスク別使い分け | [`recipe-09`](./ch02/recipe-09/) |
| 10 | トークン消費を削減するプロンプトテクニック | 具体的なプロンプトとCLAUDE.md簡潔化でコスト削減 | [`recipe-10`](./ch02/recipe-10/) |
| 11 | /cost・/usage・/statsでコストを可視化・管理する | コストをリアルタイム表示するステータスラインスクリプト | [`recipe-11`](./ch02/recipe-11/) |
| 12 | セッション管理 | /continue・/resume・/rewindの使い分けガイド | [`recipe-12`](./ch02/recipe-12/) |

### 第2部: MCP実践レシピ

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 13 | Brave Search MCP | Brave Search APIでWeb検索をClaude Codeに統合 | [`recipe-13`](./ch03-github-search/recipe-13-brave-search/) |
| 14 | GitHub MCP | GitHub Issue・PRワークフローを会話内で自動化 | [`recipe-14`](./ch03-github-search/recipe-14-github-mcp/) |
| 15 | GitHub Actions連携 | `@claude`メンションでPRレビューを自動化 | [`recipe-15`](./ch03-github-search/recipe-15-github-actions/) |
| 16 | Git自動化 | ブランチ作成・コミット・PR作成フローを効率化 | [`recipe-16`](./ch03-github-search/recipe-16-git-automation/) |
| 17 | 複数リポジトリ横断調査 | マイクロサービス横断のAPI依存関係分析 | [`recipe-17`](./ch03-github-search/recipe-17-cross-repo/) |
| 18 | Playwright MCPセットアップ | .mcp.jsonの設定方法と基本的な操作フロー | [`recipe-18`](./ch04-playwright/recipe-18-setup/) |
| 19 | E2Eテスト自動生成 | testing Capabilityを使ったテストコード自動生成 | [`recipe-19`](./ch04-playwright/recipe-19-e2e-test/) |
| 22 | アクセシビリティテスト | WCAG 2.1準拠チェックとレポート生成 | [`recipe-22`](./ch04-playwright/recipe-22-a11y-test/) |
| 23 | PostgreSQL MCP | .mcp.jsonとサンプルスキーマの設定例 | `ch05-database/mcp-configs/` |
| 29 | MCPサーバー設計 --- ACI原則 | ACI設計原則に基づくMCPサーバー設計ガイド | [`recipe-29`](./ch06-mcp-development/recipe-29-aci-design/) |
| 30 | TypeScript MCPサーバー | MCP SDK v1.xでタスク管理サーバーを実装 | [`recipe-30`](./ch06-mcp-development/recipe-30-typescript-mcp/) |
| 31 | Python MCPサーバー | FastMCPでファイル分析サーバーを実装 | [`recipe-31`](./ch06-mcp-development/recipe-31-python-mcp/) |
| 32 | MCPテストとデバッグ | MCP Inspectorと/mcpコマンドによるデバッグ手順 | [`recipe-32`](./ch06-mcp-development/recipe-32-mcp-testing/) |
| 33 | Tool Searchとコンテキスト最適化 | ENABLE_TOOL_SEARCHとinstructionsフィールドの設定 | [`recipe-33`](./ch06-mcp-development/recipe-33-tool-search/) |
| 34 | claude mcp serve | Claude Code自体をMCPサーバーとして公開する設定 | [`recipe-34`](./ch06-mcp-development/recipe-34-mcp-serve/) |

### 第3部: Skills実践レシピ

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 35 | SKILL.mdの基本構造 | フロントマターとマークダウン本文の役割を理解する | [`recipe-35`](./ch07-skills-basics/recipe-35-basic-structure/) |
| 36 | 初めてのカスタムSkills | コミットメッセージ生成とコード説明のSkillsを作成する | [`recipe-36`](./ch07-skills-basics/recipe-36-first-skill/) |
| 37 | $ARGUMENTSで動的パラメータ | 引数展開と`` !`command` ``でSkillsを動的にする | [`recipe-37`](./ch07-skills-basics/recipe-37-arguments/) |
| 38 | context:forkでサブエージェント実行 | メインコンテキストを消費せず重い処理を分離実行 | [`recipe-38`](./ch07-skills-basics/recipe-38-context-fork/) |
| 40 | コードレビューSkills | PRの差分を自動取得し複数の観点で体系的にレビュー | [`recipe-40`](./ch08/recipe-40/) |
| 41 | TDD Skills | Red-Green-Refactorサイクルをガイドするテストファースト開発 | [`recipe-41`](./ch08/recipe-41/) |
| 42 | リファクタリングSkills | コードスメル検出から安全なリファクタリング計画・実行 | [`recipe-42`](./ch08/recipe-42/) |
| 43 | GitワークフローSkills | コミット・PR作成・リリースノート生成の3つのGit操作 | [`recipe-43`](./ch08/recipe-43/) |
| 44 | セキュリティスキャンSkills | Semgrep連携と脆弱性分析・修正案提示 | [`recipe-44`](./ch08/recipe-44/) |
| 45 | API設計・OpenAPI生成Skills | リソース設計からOpenAPI 3.1スペック生成 | [`recipe-45`](./ch08/recipe-45/) |
| 46 | ドキュメント自動生成Skills | README生成とコードコメント・docstring生成 | [`recipe-46`](./ch08/recipe-46/) |
| 47 | Headless実行用Skills | CI/CDパイプラインにSkillsを組み込む | [`recipe-47`](./ch08/recipe-47/) |
| 48 | 活性化率を20%→84%に上げるテクニック | descriptionの書き方でSkillsの自動発動率を改善する | [`recipe-48`](./ch09-skills-tips/recipe-48/) |
| 49 | !`command`で動的コンテキストを注入する | 前処理メカニズムで実行時の情報を自動収集する | [`recipe-49`](./ch09-skills-tips/recipe-49/) |
| 50 | namespace設計 | プラグインのnamespace（plugin:skill-name）で名前衝突を回避する | [`recipe-50`](./ch09-skills-tips/recipe-50/) |
| 51 | Skills内でMCPサーバーのツールを指定する | ServerName:tool_name形式でMCPツールを確実に呼び出す | [`recipe-51`](./ch09-skills-tips/recipe-51/) |
| 53 | サイレント失敗の原因と対処法 | Skillsが動作しない7つの典型パターンとデバッグ手順 | [`recipe-53`](./ch09-skills-tips/recipe-53/) |
| 54 | 段階的読み込みアーキテクチャ | ファイル分割でオンデマンド読み込みを実現しトークンを節約 | [`recipe-54`](./ch09-skills-tips/recipe-54/) |
| 55 | フロントマターHooks | SKILL.mdにスコープ付きHooksを定義する | [`recipe-55`](./ch09-skills-tips/recipe-55/) |

### 第4部: サブエージェント実践レシピ

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 59 | カスタムエージェント定義 | .claude/agents/で専門エージェントを定義する | `ch10-subagents-basics/recipe-59-custom-agents/` |
| 61 | 永続メモリパターン | MEMORY.mdによるセッション横断の知識管理 | `ch10-subagents-basics/recipe-61-memory/` |
| 62 | 並列Exploreで大規模コードベースを高速調査 | 複数のExploreサブエージェントを並列起動しモジュール単位で同時調査 | [`recipe-62`](./ch11-subagent-dev/recipe-62-parallel-explore/) |
| 63 | マルチファイルリファクタリングの自動化 | Explore（調査）+ general-purpose（実行）の2フェーズで安全にリファクタリング | [`recipe-63`](./ch11-subagent-dev/recipe-63-multi-file-refactoring/) |
| 64 | Prompt Chainingと中間ゲート設計 | サブエージェントを順次呼び出すチェーン方式で品質を保つワークフロー構築 | [`recipe-64`](./ch11-subagent-dev/recipe-64-prompt-chaining/) |
| 65 | テスト実行とレポート集約（バックグラウンド実行） | テストをバックグラウンドで実行し待ち時間に他の作業を並行して進める | [`recipe-65`](./ch11-subagent-dev/recipe-65-background-test/) |
| 66 | サブエージェント駆動のコードレビュー | レビュー専用カスタムエージェントと永続メモリで学習するレビューを実現 | [`recipe-66`](./ch11-subagent-dev/recipe-66-code-review/) |
| 67 | レガシーコード分析と移行計画の自動生成 | 並列調査とチェーンを組み合わせ分析から移行計画生成までを自動化 | [`recipe-67`](./ch11-subagent-dev/recipe-67-legacy-analysis/) |
| 68 | ドキュメント・コメント一括生成 | ドキュメント生成専用サブエージェントでファイル単位の並列ドキュメント生成 | [`recipe-68`](./ch11-subagent-dev/recipe-68-doc-generation/) |
| 69 | Agent Teamsの基本 | リーダー・チームメイトの仕組みと有効化設定 | [`recipe-69`](./ch12-agent-teams/recipe-69-agent-teams-basics/) |
| 70 | 並列チーム開発 | フロントエンド+バックエンド+テストの3層並列開発 | [`recipe-70`](./ch12-agent-teams/recipe-70-parallel-team/) |
| 71 | 共有タスクリストと依存関係管理 | タスクの状態管理と依存関係の自動化 | [`recipe-71`](./ch12-agent-teams/recipe-71-task-list/) |
| 72 | Git Worktree並列開発 | Worktreeで物理的に並列作業するセットアップ | [`recipe-72`](./ch12-agent-teams/recipe-72-worktree/) |
| 73 | Routingパターン | 入力の複雑度でモデル・エージェントを振り分ける | [`recipe-73`](./ch12-agent-teams/recipe-73-routing/) |
| 74 | バックグラウンド実行と結果監視 | Ctrl+Bでタスクをバックグラウンドに切り替え並行管理 | [`recipe-74`](./ch12-agent-teams/recipe-74-background/) |
| 75 | --agentsフラグで動的エージェント定義 | JSONでセッション限りのエージェントを動的に定義 | [`recipe-75`](./ch12-agent-teams/recipe-75-agents-flag/) |
| 76 | Map-Reduceパターン | 並列処理・集約・Voting（合議）の応用 | [`recipe-76`](./ch12-agent-teams/recipe-76-map-reduce/) |
| 77 | 専門ロールパターン | PM/Architect/Developer/QAの4ロール定義 | [`recipe-77`](./ch12-agent-teams/recipe-77-role-pattern/) |
| 78 | コスト最適化パターン | 18.75倍のモデル価格差を活かしたコスト最適化 | [`recipe-78`](./ch12-agent-teams/recipe-78-cost-optimization/) |

### 第5部: Hooks実践レシピ

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 80-81 | Hooks基本設定 | settings.jsonでのHooks定義とマッチャーパターン | `ch13-hooks-basics/` |
| 83 | コミット前lint/format | PreToolUseフックで自動lint・フォーマット実行 | [`recipe-83`](./ch14-hooks-recipes/recipe-83-lint-format/) |
| 84 | 危険コマンドブロック | rm -rfやforce push等の危険コマンドを検出・ブロック | [`recipe-84`](./ch14-hooks-recipes/recipe-84-danger-block/) |
| 85 | 機密情報漏洩防止 | .envやAPIキーのコミット・出力を防止 | [`recipe-85`](./ch14-hooks-recipes/recipe-85-env-protection/) |
| 86 | ファイル変更時テスト自動実行 | PostToolUseフックでテストを非同期実行 | [`recipe-86`](./ch14-hooks-recipes/recipe-86-auto-test/) |
| 87 | デスクトップ/サウンド通知 | タスク完了時のデスクトップ・サウンド通知 | [`recipe-87`](./ch14-hooks-recipes/recipe-87-notifications/) |
| 88 | Gitチェックポイント自動作成 | 一定間隔でgit commitを自動実行 | [`recipe-88`](./ch14-hooks-recipes/recipe-88-git-checkpoint/) |
| 89 | prompt/agent型Hooks | prompt型・agent型による高度な条件制御 | [`recipe-89`](./ch14-hooks-recipes/recipe-89-prompt-agent/) |
| 90 | Stop Hooks自動検証 | Evaluator-Optimizerパターンで品質を自動検証 | [`recipe-90`](./ch14-hooks-recipes/recipe-90-evaluator-optimizer/) |

### 第6部: 統合 & パワーユーザーTIPS

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 91 | 品質ゲートパイプライン | MCP+Skills+Hooksで「生成→評価→改善」を自動反復する品質管理パイプライン | [`recipe-91`](./ch15-workflows/recipe-91-quality-gate/) |
| 92 | Spec駆動開発 | 仕様→設計→実装→テストの4フェーズをSkillsとPlan Modeで管理 | [`recipe-92`](./ch15-workflows/recipe-92-spec-driven/) |
| 93 | CI/CDパイプライン | claude-code-actionとヘッドレスモードでCI/CDを自動化 | [`recipe-93`](./ch15-workflows/recipe-93-ci-cd/) |
| 94 | Issue駆動開発 | GitHub Issue取得からブランチ作成・実装・PR作成まで一気通貫 | [`recipe-94`](./ch15-workflows/recipe-94-issue-driven/) |
| 95 | マルチセッション・チーム開発 | Git Worktreeとセッション管理で並行開発とチーム共有を実現 | [`recipe-95`](./ch15-workflows/recipe-95-multi-session/) |
| 97 | Docker隔離実行 | DockerとDevContainerでClaude Codeを安全に隔離 | [`recipe-97`](./ch16-power-user/recipe-97-docker/) |
| 98 | ヘッドレスモード | バッチ処理やCI環境でのヘッドレス実行 | [`recipe-98`](./ch16-power-user/recipe-98-headless/) |
| 100 | 究極のカスタマイズ戦略 | CLAUDE.md+Skills+Hooks+Agentsの統合設定テンプレート | [`recipe-100`](./ch16-power-user/recipe-100-ultimate-setup/) |

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
