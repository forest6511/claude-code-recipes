---
name: daily-report
description: >-
  Generates a daily project report with security scan results.
  Use when creating daily status reports or project summaries.
disable-model-invocation: true
hooks:
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "echo 'セキュリティスキャン実行中...' && npm audit --json 2>/dev/null | head -20"
          once: true
---

# 日次レポート生成

## セキュリティ状態
上記のセキュリティスキャン結果を基に報告してください。

## プロジェクト状態
- 未解決のIssue数
- 直近のコミット履歴
- テストの実行結果

## レポート形式
マークダウン形式で出力してください。
