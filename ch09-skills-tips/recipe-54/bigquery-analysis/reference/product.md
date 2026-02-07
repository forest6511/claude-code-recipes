# Product Reference

## 目次
- API利用テーブル（api_usage）
- 機能利用テーブル（feature_usage）

## API利用テーブル

### api_usage
| カラム | 型 | 説明 |
|--------|-----|------|
| date | DATE | 日付 |
| account_id | STRING | アカウントID |
| endpoint | STRING | APIエンドポイント |
| request_count | INT | リクエスト数 |
| error_count | INT | エラー数 |
| avg_latency_ms | FLOAT | 平均レイテンシ（ミリ秒） |

## 機能利用テーブル

### feature_usage
| カラム | 型 | 説明 |
|--------|-----|------|
| date | DATE | 日付 |
| account_id | STRING | アカウントID |
| feature_name | STRING | 機能名 |
| usage_count | INT | 利用回数 |
| unique_users | INT | ユニークユーザー数 |
