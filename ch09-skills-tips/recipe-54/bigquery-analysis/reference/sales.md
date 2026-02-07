# Sales Reference

## 目次
- 商談テーブル（opportunities）
- パイプラインテーブル（pipeline_snapshots）
- アカウントテーブル（accounts）

## 商談テーブル

### opportunities
| カラム | 型 | 説明 |
|--------|-----|------|
| opportunity_id | STRING | 商談ID |
| account_id | STRING | アカウントID |
| stage | STRING | ステージ（lead/qualified/proposal/closed_won/closed_lost） |
| amount | DECIMAL | 見込み金額 |
| close_date | DATE | クローズ予定日 |
| owner_id | STRING | 担当者ID |

## パイプラインテーブル

### pipeline_snapshots
| カラム | 型 | 説明 |
|--------|-----|------|
| snapshot_date | DATE | スナップショット日 |
| stage | STRING | パイプラインステージ |
| total_amount | DECIMAL | ステージ合計金額 |
| deal_count | INT | 案件数 |
