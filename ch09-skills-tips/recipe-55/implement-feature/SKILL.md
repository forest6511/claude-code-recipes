---
name: implement-feature
description: >-
  Implements a feature with automatic test execution on file changes.
  Use when implementing new features with TDD workflow.
disable-model-invocation: true
hooks:
  PostToolUse:
    - matcher: "Write|Edit"
      hooks:
        - type: command
          command: "npm test 2>&1 | tail -20"
          timeout: 60
---

# 機能実装

$ARGUMENTS を実装してください。

## ルール
- テストファーストで実装する
- ファイル変更後にテストが自動実行されるので、結果を確認する
- テストが失敗した場合は修正してから次のステップに進む
