#!/bin/bash
# ci-review.sh - PRの自動レビュースクリプト
# 使い方: ./ci-review.sh <PR番号>

set -euo pipefail

PR_NUMBER=${1:?"Usage: $0 <PR_NUMBER>"}

claude --agents '{
  "security-checker": {
    "description": "セキュリティ脆弱性を検査する。",
    "prompt": "変更されたファイルのセキュリティ脆弱性を検査し、CVSSスコア付きで報告してください。",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "sonnet"
  },
  "test-validator": {
    "description": "テストカバレッジを検証する。",
    "prompt": "変更されたコードのテストカバレッジを検証し、不足しているテストケースを報告してください。",
    "tools": ["Read", "Grep", "Glob", "Bash"],
    "model": "haiku"
  }
}' -p "PR #${PR_NUMBER}のコード変更をレビューしてください。security-checkerとtest-validatorの両方を並列で実行してください。"
