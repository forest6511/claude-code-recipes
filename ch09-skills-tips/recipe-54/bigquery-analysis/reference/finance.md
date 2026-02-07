# Finance Reference

## 目次
- 売上テーブル（revenue_daily, revenue_monthly）
- 課金テーブル（billing_events, subscriptions）
- ARR計算（arr_snapshots, arr_movements）
- よく使うJOINパターン

## 売上テーブル

### revenue_daily
| カラム | 型 | 説明 |
|--------|-----|------|
| date | DATE | 日付（UTC） |
| account_id | STRING | アカウントID |
| amount | DECIMAL | 売上額（USD） |
| currency | STRING | 通貨コード |
| plan_type | STRING | プランタイプ（free/pro/enterprise） |
| account_type | STRING | アカウント種別（real/test） |

### revenue_monthly
| カラム | 型 | 説明 |
|--------|-----|------|
| month | DATE | 月初日（UTC） |
| account_id | STRING | アカウントID |
| mrr | DECIMAL | 月次経常収益 |
| plan_type | STRING | プランタイプ |

## 課金テーブル

### billing_events
| カラム | 型 | 説明 |
|--------|-----|------|
| event_id | STRING | イベントID |
| timestamp | TIMESTAMP | イベント発生時刻 |
| account_id | STRING | アカウントID |
| event_type | STRING | charge/refund/upgrade/downgrade |
| amount | DECIMAL | 金額 |

### subscriptions
| カラム | 型 | 説明 |
|--------|-----|------|
| subscription_id | STRING | サブスクリプションID |
| account_id | STRING | アカウントID |
| plan_type | STRING | プランタイプ |
| status | STRING | active/canceled/trial |
| start_date | DATE | 開始日 |
| end_date | DATE | 終了日（NULLは継続中） |

## ARR計算

### arr_snapshots
| カラム | 型 | 説明 |
|--------|-----|------|
| snapshot_date | DATE | スナップショット日 |
| arr | DECIMAL | 年間経常収益 |
| customer_count | INT | 顧客数 |

## よく使うJOINパターン

```sql
-- 売上とサブスクリプションの結合
SELECT r.date, r.amount, s.plan_type, s.status
FROM revenue_daily r
JOIN subscriptions s ON r.account_id = s.account_id
WHERE r.account_type != 'test'
  AND s.status = 'active'
```
