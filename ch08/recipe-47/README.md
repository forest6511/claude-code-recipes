# レシピ47: Headless実行（-pフラグ）用Skillsを作る

Claude Codeの`-p`フラグ（printモード）を使って、SkillsをCI/CDパイプラインやバッチ処理に組み込む方法です。

## ファイル構成

```
.claude/skills/ci-review/
└── SKILL.md                     # CI/CD環境用コードレビューSkills
scripts/
└── ci-review.sh                 # CIスクリプト
.github/workflows/
└── ai-review.yml                # GitHub Actions統合例
```

## 使い方

```bash
# 基本: -pでSkillsを非対話型で実行
claude -p "/ci-review"

# JSON形式で構造化出力
claude -p "/ci-review" --output-format json

# JSON Schemaで出力構造を指定
claude -p "/ci-review" --json-schema '{...}'
```

## 注意事項

- `--dangerously-skip-permissions` はCI/CD環境でのみ使用してください
- ローカル環境での使用は、意図しないファイル変更やコマンド実行のリスクがあります
- CI環境ではコンテナの隔離やネットワーク制限と組み合わせて使用することを推奨します

## ポイント

- `-p`フラグでClaude Codeを「対話ツール」から「CLIプログラム」に切り替え
- `--json-schema` で出力構造を指定し、プログラムで確実にパース可能に
- `--max-turns` と `--max-budget-usd` で無限ループやコスト暴走を防止
