# 第1章: CLAUDE.md & 設定最適化

Claude Codeの生産性を左右する`CLAUDE.md`の設計パターン集です。WHY/WHAT/HOWの3層構造から、モノレポ対応の分割戦略まで、実践的なテンプレートを提供します。

## レシピ一覧（6件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 01 | [効果的な`CLAUDE.md`の書き方](./recipe-01-effective-claude-md/) | ★☆☆ | WHY/WHAT/HOWの3層構造で300行以内にまとめる |
| 02 | [`CLAUDE.md`階層設計](./recipe-02-hierarchy/) | ★★☆ | グローバル・プロジェクト・ローカルの3階層で設定を分離する |
| 03 | [.claude/rules/で条件付きルール](./recipe-03-conditional-rules/) | ★★☆ | pathsフロントマターで特定ファイル操作時にだけルールを適用 |
| 04 | [モノレポでの`CLAUDE.md`分割戦略](./recipe-04-monorepo/) | ★★★ | 再帰的探索と遅延読み込みを活用したパッケージ別配置 |
| 05 | [`settings.json`の実践設定](./recipe-05-settings-json/) | ★★☆ | 3つのスコープでパーミッション・モデル・MCP設定を管理 |
| 06 | [パーミッション設計](./recipe-06-permissions/) | ★★☆ | deny/ask/allowの3段階評価で安全性と生産性を両立 |

## 前提条件

- Claude Code: 最新版

## クイックスタート

```bash
# レシピ01のCLAUDE.mdをプロジェクトにコピー
cp ch01-claude-md/recipe-01-effective-claude-md/CLAUDE.md /path/to/your-project/CLAUDE.md
```

## 備考

- 各レシピのREADME.mdにファイルの説明とカスタマイズ方法を記載しています
- 詳しい解説は書籍本文を参照してください
