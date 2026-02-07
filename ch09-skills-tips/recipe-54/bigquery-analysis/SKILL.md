---
name: bigquery-analysis
description: >-
  Analyzes data using BigQuery SQL queries.
  Use when working with business metrics, revenue data,
  sales pipeline, or product analytics.
allowed-tools: Read, Grep, Glob, Bash(python *)
---

# BigQueryデータ分析

## 利用可能なデータセット

**財務**: 売上、ARR、課金 → [reference/finance.md](reference/finance.md)を参照
**営業**: 商談、パイプライン、アカウント → [reference/sales.md](reference/sales.md)を参照
**プロダクト**: API利用、機能利用率 → [reference/product.md](reference/product.md)を参照
**マーケティング**: キャンペーン、アトリビューション → [reference/marketing.md](reference/marketing.md)を参照

## クイック検索

特定のメトリクスを探す場合:

    grep -i "revenue" reference/finance.md
    grep -i "pipeline" reference/sales.md

## 共通クエリパターン

よくあるクエリは [examples/common-queries.md](examples/common-queries.md) を参照してください。

## ルール

- テストアカウントは必ず除外する（account_type != 'test'）
- 日付フィルタはUTCで指定する
- 大量データは LIMIT を付けて確認してから実行する
