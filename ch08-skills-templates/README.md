# 第8章: 実践Skillsテンプレート集

実務に直結する8つのSkillsテンプレート（コードレビュー、TDD、リファクタリング、Git、セキュリティ、API設計、ドキュメント、Headless）を提供します。そのままコピーして使えるだけでなく、プロジェクトに合わせたカスタマイズの起点として設計しています。

## レシピ一覧（8件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 40 | [コードレビューSkillsを作る](./recipe-40/) | ★★☆ | 5つの観点（正確性・セキュリティ・パフォーマンス・可読性・テスト）で体系的レビュー |
| 41 | [テスト駆動開発（TDD）Skillsを作る](./recipe-41/) | ★★☆ | Red-Green-Refactorサイクルの強制実行 |
| 42 | [リファクタリングSkillsを作る](./recipe-42/) | ★★☆ | コードスメル検出と安全なリファクタリング計画 |
| 43 | [GitワークフローSkillsを作る（コミット・PR・リリースノート）](./recipe-43/) | ★★☆ | Conventional Commitsに従ったGit操作の標準化 |
| 44 | [セキュリティスキャンSkillsを作る（CodeQL/Semgrep連携）](./recipe-44/) | ★★★ | Semgrep静的解析とClaude Codeによる脆弱性分析 |
| 45 | [API設計・OpenAPI生成Skillsを作る](./recipe-45/) | ★★★ | REST API設計からOpenAPI 3.1スペック生成 |
| 46 | [ドキュメント自動生成Skillsを作る](./recipe-46/) | ★★☆ | README、JSDoc、docstringの自動生成 |
| 47 | [Headless実行（-pフラグ）用Skillsを作る](./recipe-47/) | ★★★ | CI/CD環境での非対話型Skills実行 |

## 前提条件

- Claude Code: 最新版
- Node.js: 20+（テストランナー用）
- Python: 3.11+（テストランナー用）
- Semgrep（レシピ44用、`brew install semgrep`または`pip install semgrep`）
- GitHub CLI（レシピ43、47用、`gh`コマンド）

## クイックスタート

```bash
# コードレビューSkillsの作成と実行
mkdir -p .claude/skills/review-code
# SKILL.mdをコピー後
claude
> /review-code src/api/

# TDD Skillsの実行
> /tdd ユーザー認証のパスワードバリデーション機能

# Headless実行（CI/CD環境）
claude -p "/ci-review" \
  --output-format json \
  --max-turns 10 \
  --dangerously-skip-permissions \
  > review-result.json
```

## 備考

- 各SkillsはAgent Skillsオープンスタンダードに準拠しています
- `--dangerously-skip-permissions`はCI/CD環境でのみ使用してください
- セキュリティスキャンSkillsはSemgrepのインストールが必要です
- 詳しい解説は書籍本文を参照してください
