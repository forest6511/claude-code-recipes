---
name: migrate-component
description: コンポーネントをフレームワーク間で移行する
disable-model-invocation: true
argument-hint: [component-name] [from-framework] [to-framework]
---

$0 コンポーネントを $1 から $2 に移行してください。

## 移行ルール
- 既存の振る舞いとテストを全て維持する
- 移行先フレームワークのベストプラクティスに従う
- 型定義を移行先の慣例に合わせる
