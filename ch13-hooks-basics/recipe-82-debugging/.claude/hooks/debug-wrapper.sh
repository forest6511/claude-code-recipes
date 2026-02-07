#!/bin/bash
# デバッグ用ラッパースクリプト
# フックの入出力をログファイルに記録する

LOG_DIR="${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/logs"
mkdir -p "$LOG_DIR"

TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
LOG_FILE="$LOG_DIR/hook_${TIMESTAMP}.log"

# stdin（JSON入力）をログに記録
INPUT=$(cat)
echo "=== Input ===" >> "$LOG_FILE"
echo "$INPUT" | jq '.' >> "$LOG_FILE" 2>/dev/null || echo "$INPUT" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 本来のスクリプトを実行（引数で指定）
ACTUAL_SCRIPT="$1"
shift

if [ -n "$ACTUAL_SCRIPT" ] && [ -x "$ACTUAL_SCRIPT" ]; then
  RESULT=$(echo "$INPUT" | "$ACTUAL_SCRIPT" "$@" 2>"$LOG_FILE.stderr")
  EXIT_CODE=$?
else
  echo "スクリプト未指定または実行権限なし: $ACTUAL_SCRIPT" >> "$LOG_FILE"
  EXIT_CODE=0
fi

# 出力をログに記録
echo "=== Output ===" >> "$LOG_FILE"
echo "Exit code: $EXIT_CODE" >> "$LOG_FILE"
echo "Stdout: $RESULT" >> "$LOG_FILE"
if [ -f "$LOG_FILE.stderr" ]; then
  echo "Stderr:" >> "$LOG_FILE"
  cat "$LOG_FILE.stderr" >> "$LOG_FILE"
  # stderrを元のstderrに転送
  cat "$LOG_FILE.stderr" >&2
  rm -f "$LOG_FILE.stderr"
fi

# 元の出力を返す
echo "$RESULT"
exit $EXIT_CODE
