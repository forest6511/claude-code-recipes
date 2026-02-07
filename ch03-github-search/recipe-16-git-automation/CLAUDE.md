# Git Workflow Rules

Claude Codeを使ったGit操作のルールと戦略を定義します。

## Gitワークフロー

- ブランチ命名規則: feature/*, fix/*, chore/*
- コミットメッセージ: Conventional Commits形式（feat:, fix:, chore:）
- PRを作成する前に必ずlintとテストを実行すること
- mainブランチへの直接コミットは禁止

## 自動化フロー

### Issue駆動開発

Issue番号を指定したら、以下のフローで作業を進めます:

1. Issueの内容を読み、実装方針を確認
2. feature/issue-{番号} ブランチを作成
3. Issueの内容に基づいて実装
4. テストを実行して全てパスすることを確認
5. Conventional Commitsに従ってコミット
6. PRを作成（タイトルと説明はIssueから生成）

### コミットメッセージフォーマット

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- feat: 新機能
- fix: バグ修正
- chore: 設定変更、依存関係更新
- docs: ドキュメント更新
- refactor: リファクタリング
- test: テスト追加・修正
- perf: パフォーマンス改善

## 危険な操作の禁止

以下の操作は`settings.json`の`deny`リストで禁止されています:

- `git push --force` / `git push -f`
- `git reset --hard`
- `git clean -f`

これらの操作は明示的な確認が必要な場合のみ実行してください。
