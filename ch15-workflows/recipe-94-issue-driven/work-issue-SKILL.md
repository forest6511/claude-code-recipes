---
name: work-issue
description: "GitHub Issueを取得し、ブランチ作成から実装、PR作成までを実行する"
---
# Issue駆動開発

Issue番号 $ARGUMENTS に基づいて、以下の手順で開発を進めてください。

## ステップ1: Issue内容の取得
- GitHub MCPを使用してIssue #$ARGUMENTS の内容を取得する
- タイトル、本文、ラベル、アサインを確認する

## ステップ2: ブランチ作成
- Issueの内容に基づいて適切なブランチ名を決定する
  - 命名規則: `feature/issue-{番号}-{簡潔な説明}` または `fix/issue-{番号}-{簡潔な説明}`
- `git checkout -b {ブランチ名}` でブランチを作成する

## ステップ3: 実装
- Issueの要件に基づいてコードを実装する
- 実装中は適宜コミットする（コミットメッセージに `#$ARGUMENTS` を含める）

## ステップ4: 品質チェック
- lint、型チェック、テストを実行する
- 問題があれば修正する

## ステップ5: PR作成
- 変更をpushする
- PR本文にはIssueへの参照（`Closes #$ARGUMENTS`）を含める
- 変更内容のサマリーとテスト結果を記載する
