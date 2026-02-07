# 第8章: 実践Skillsテンプレート集

書籍「Claude Code実践レシピ」第8章のサンプルコードです。

前章でSkillsの基本構造と設計原則を学び、本章ではその知識を実務に直結する8つのSkillsテンプレートとして具体化します。

## レシピ一覧

| # | レシピ | 説明 | ディレクトリ |
|---|--------|------|-------------|
| 40 | コードレビューSkillsを作る | PRの差分を自動取得し複数の観点で体系的にレビューする | [`recipe-40/`](./recipe-40/) |
| 41 | テスト駆動開発（TDD）Skillsを作る | Red-Green-Refactorサイクルをガイドするテストファーストの開発 | [`recipe-41/`](./recipe-41/) |
| 42 | リファクタリングSkillsを作る | コードスメル検出から安全なリファクタリング計画・実行まで | [`recipe-42/`](./recipe-42/) |
| 43 | GitワークフローSkillsを作る | コミット・PR作成・リリースノート生成の3つのGit操作Skills | [`recipe-43/`](./recipe-43/) |
| 44 | セキュリティスキャンSkillsを作る | Semgrep連携とClaude Codeによる脆弱性分析・修正案提示 | [`recipe-44/`](./recipe-44/) |
| 45 | API設計・OpenAPI生成Skillsを作る | リソース設計からOpenAPI 3.1スペック生成までをガイド | [`recipe-45/`](./recipe-45/) |
| 46 | ドキュメント自動生成Skillsを作る | README生成とコードコメント・docstring生成の2つのSkills | [`recipe-46/`](./recipe-46/) |
| 47 | Headless実行用Skillsを作る | `-p`フラグでCI/CDパイプラインにSkillsを組み込む | [`recipe-47/`](./recipe-47/) |

## 使い方

各レシピのディレクトリにある `.claude/skills/` 以下のファイルを、ご自身のプロジェクトの `.claude/skills/` にコピーしてください。

```bash
# 例: レシピ40のコードレビューSkillsをコピー
cp -r ch08/recipe-40/.claude/skills/review-code .claude/skills/
```
