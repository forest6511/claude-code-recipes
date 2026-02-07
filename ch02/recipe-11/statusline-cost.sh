#!/bin/bash
# モデル名・コスト・コンテキスト使用率・経過時間を表示するステータスラインスクリプト
# 配置先: ~/.claude/statusline-cost.sh
# 設定: settings.json の statusLine で登録
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')

COST_FMT=$(printf '$%.2f' "$COST")
MINS=$((DURATION_MS / 60000))
SECS=$(((DURATION_MS % 60000) / 1000))

echo "[$MODEL] $COST_FMT | ${PCT}% context | ${MINS}m ${SECS}s"
