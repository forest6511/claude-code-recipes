---
name: implement-feature
description: 機能を実装する
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
