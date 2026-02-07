---
name: monitored-deploy
description: >-
  Deploys with pre-validation, action logging, and post-deployment summary.
  Use when deploying to staging or production environments.
disable-model-invocation: true
hooks:
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate-deploy-command.sh"
  PostToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/log-deploy-action.sh"
          async: true
  Stop:
    - hooks:
        - type: command
          command: "./scripts/deploy-summary.sh"
---

# デプロイ実行

$ARGUMENTS 環境にデプロイします。

## 手順
1. テストスイートを実行する
2. ビルドを生成する
3. デプロイを実行する
4. ヘルスチェックを確認する
