#!/bin/bash
# dynamic-agents-example.sh - --agentsフラグの基本的な使い方

set -euo pipefail

# 複数エージェントの同時定義
claude --agents '{
  "researcher": {
    "description": "コードベースの調査を行う。調査依頼時に使用する。",
    "prompt": "指定された領域を調査し、簡潔な報告を作成してください。",
    "tools": ["Read", "Grep", "Glob"],
    "model": "haiku"
  },
  "implementer": {
    "description": "コード変更を実装する。実装依頼時に使用する。",
    "prompt": "調査結果に基づいてコード変更を実装してください。変更後にテストを実行すること。",
    "tools": ["Read", "Edit", "Write", "Bash", "Grep", "Glob"],
    "model": "sonnet"
  }
}'
