#!/bin/bash
INPUT=$(cat)

# Stop Hooksによる継続中かチェック（無限ループ防止）
STOP_HOOK_ACTIVE=$(echo "$INPUT" | jq -r '.stop_hook_active')
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
  exit 0  # 2回目以降はClaude Codeの停止を許可
fi

# テストスイートを実行
TEST_OUTPUT=$(npm test 2>&1)
TEST_EXIT=$?

if [ $TEST_EXIT -ne 0 ]; then
  FAILURES=$(echo "$TEST_OUTPUT" | grep -E "FAIL|Error" | head -10)
  echo "テストが失敗しています。以下のエラーを修正してください:" >&2
  echo "$FAILURES" >&2
  exit 2  # Claude Codeに作業継続を指示
fi

# lintチェック
LINT_OUTPUT=$(npx eslint src/ 2>&1)
LINT_EXIT=$?

if [ $LINT_EXIT -ne 0 ]; then
  ERRORS=$(echo "$LINT_OUTPUT" | grep "error" | head -5)
  echo "lintエラーがあります:" >&2
  echo "$ERRORS" >&2
  exit 2
fi

exit 0  # 全チェック通過、停止を許可