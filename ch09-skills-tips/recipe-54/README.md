# レシピ54: 段階的読み込みアーキテクチャでトークンを節約する

SKILL.mdを分割し、必要な部分だけをオンデマンドで読み込む「Progressive Disclosure」アーキテクチャのサンプルです。

## 含まれるファイル

| ファイル | 説明 |
|---------|------|
| `bigquery-analysis/SKILL.md` | 目次（ナビゲーション）として設計されたメインファイル |
| `bigquery-analysis/reference/finance.md` | 財務メトリクスのスキーマ |
| `bigquery-analysis/reference/sales.md` | 営業データのスキーマ |
| `bigquery-analysis/reference/product.md` | プロダクト利用データのスキーマ |
| `bigquery-analysis/reference/marketing.md` | マーケティングデータのスキーマ |
| `bigquery-analysis/examples/common-queries.md` | よくあるクエリパターン |
| `bigquery-analysis/scripts/validate-query.py` | クエリバリデーションスクリプト |

## ポイント

1. **3段階の遅延読み込み**: description -> SKILL.md -> 参照ファイル
2. **SKILL.mdは500行以内**: 目次とナビゲーションに徹する
3. **参照の深さは1階層**: SKILL.md -> reference/ のみ（ネストしない）
4. **参照ファイルに目次を付ける**: 先頭100行で全体構造を把握できるようにする
