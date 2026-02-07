# プロジェクト概要

SaaSプラットフォームのフロントエンド。Next.js 15 + TypeScript。

## 技術スタック
- Next.js 15 (App Router)
- TypeScript 5.5
- Tailwind CSS 4
- Prisma 6 + PostgreSQL

## コーディング規約
- Server Componentsをデフォルトとし、クライアント操作が必要な場合のみ"use client"を使用する
- APIルートではZodによるバリデーションを必須とする
- テストはVitestを使用する

## 開発コマンド
- 開発サーバー: `npm run dev`
- テスト: `npm test`
- lint: `npm run lint`
- ビルド: `npm run build`
