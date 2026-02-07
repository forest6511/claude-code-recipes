# Marketing Reference

## 目次
- キャンペーンテーブル（campaigns）
- アトリビューションテーブル（attribution）

## キャンペーンテーブル

### campaigns
| カラム | 型 | 説明 |
|--------|-----|------|
| campaign_id | STRING | キャンペーンID |
| name | STRING | キャンペーン名 |
| channel | STRING | チャネル（email/social/search/display） |
| start_date | DATE | 開始日 |
| end_date | DATE | 終了日 |
| budget | DECIMAL | 予算 |
| spend | DECIMAL | 実績支出 |

## アトリビューションテーブル

### attribution
| カラム | 型 | 説明 |
|--------|-----|------|
| event_date | DATE | コンバージョン日 |
| campaign_id | STRING | キャンペーンID |
| account_id | STRING | アカウントID |
| conversion_type | STRING | signup/trial/paid |
| revenue | DECIMAL | 帰属売上 |
