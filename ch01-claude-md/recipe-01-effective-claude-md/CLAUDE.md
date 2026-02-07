# プロジェクト概要

ECサイトのバックエンドAPI。TypeScript + Express + Prisma。
本番環境で稼働中のため、破壊的変更は避ける。

## 技術スタック

| 技術 | バージョン | 用途 |
|------|-----------|------|
| TypeScript | 5.4 | メイン言語 |
| Express | 4.18 | APIフレームワーク |
| Prisma | 5.10 | ORM |
| PostgreSQL | 16 | データベース |

## コーディング規約

- 関数名はcamelCase、型名はPascalCase
- エラーハンドリングは必ずResult型を使用する
- データベースアクセスはRepository層に集約する
- APIレスポンスは必ず型定義を用意する

## ディレクトリ構造

src/
  controllers/  # ルーティングとバリデーション
  services/     # ビジネスロジック
  repositories/ # データベースアクセス
  types/        # 型定義
  utils/        # ユーティリティ関数

## 開発コマンド

- ビルド: `npm run build`
- テスト: `npm test`
- lint: `npm run lint`
- マイグレーション: `npx prisma migrate dev`

## ワークフロー

1. 機能追加時はfeatureブランチを作成する
2. テストを先に書く（TDD）
3. CIが通るまでPRをマージしない
