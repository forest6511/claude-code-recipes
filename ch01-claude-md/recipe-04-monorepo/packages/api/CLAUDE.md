# packages/api

Express + Prismaのバックエンド API。

## 技術スタック
- Express 4.18
- Prisma 6 + PostgreSQL 16
- Redis（キャッシュ）

## コマンド
- 開発: `pnpm dev`
- マイグレーション: `pnpm prisma migrate dev`
- シード: `pnpm prisma db seed`

## ルール
- APIエンドポイントはOpenAPI仕様を満たす
- バリデーションはZodで行う
- エラーレスポンスは統一フォーマットに従う
