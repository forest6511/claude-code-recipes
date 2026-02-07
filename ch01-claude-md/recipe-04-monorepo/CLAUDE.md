# my-monorepo

Turborepo管理のモノレポ。3つのパッケージで構成。

## 技術スタック共通
- TypeScript 5.5（全パッケージ共通）
- pnpm workspaces
- Turborepo（ビルドオーケストレーション）

## 共通コマンド
- 全体ビルド: `pnpm build`
- 全体テスト: `pnpm test`
- 特定パッケージ: `pnpm --filter web dev`

## 共通ルール
- パッケージ間の依存はworkspaceプロトコル（`workspace:*`）を使用する
- 共有型は`packages/shared`に集約する
- 各パッケージのREADMEを最新に保つ
