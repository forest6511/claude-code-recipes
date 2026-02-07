# よくあるクエリパターン

## 月次売上推移

```sql
SELECT
  month,
  SUM(mrr) AS total_mrr,
  COUNT(DISTINCT account_id) AS customer_count
FROM revenue_monthly
WHERE account_type != 'test'
GROUP BY month
ORDER BY month DESC
LIMIT 12
```

## パイプライン分析

```sql
SELECT
  stage,
  COUNT(*) AS deal_count,
  SUM(amount) AS total_amount,
  AVG(amount) AS avg_deal_size
FROM opportunities
WHERE close_date >= CURRENT_DATE()
GROUP BY stage
ORDER BY CASE stage
  WHEN 'lead' THEN 1
  WHEN 'qualified' THEN 2
  WHEN 'proposal' THEN 3
  WHEN 'closed_won' THEN 4
  WHEN 'closed_lost' THEN 5
END
```

## 機能利用率TOP10

```sql
SELECT
  feature_name,
  SUM(usage_count) AS total_usage,
  SUM(unique_users) AS total_users
FROM feature_usage
WHERE date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
GROUP BY feature_name
ORDER BY total_usage DESC
LIMIT 10
```

## キャンペーンROI

```sql
SELECT
  c.name AS campaign_name,
  c.channel,
  c.spend,
  SUM(a.revenue) AS attributed_revenue,
  SAFE_DIVIDE(SUM(a.revenue), c.spend) AS roi
FROM campaigns c
LEFT JOIN attribution a ON c.campaign_id = a.campaign_id
GROUP BY c.name, c.channel, c.spend
ORDER BY roi DESC
```
