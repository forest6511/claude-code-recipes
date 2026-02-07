#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# ソースファイル以外はスキップ
if [[ "$FILE_PATH" != *.ts && "$FILE_PATH" != *.js && "$FILE_PATH" != *.py ]]; then
  exit 0
fi

# テストスイートを実行
RESULT=$(npm test 2>&1)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  echo "{\"systemMessage\": \"テスト全件パス（${FILE_PATH} の変更後）\"}"
else
  # 失敗時はClaudeにフィードバック
  SUMMARY=$(echo "$RESULT" | tail -20)
  echo "{\"systemMessage\": \"テスト失敗（${FILE_PATH} の変更後）: $SUMMARY\"}"
fi