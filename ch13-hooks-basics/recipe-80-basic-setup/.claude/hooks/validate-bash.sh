#!/bin/bash
# Bashコマンドの事前検証フック
# PreToolUseイベントで、Bashツール使用前に発火する

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command')

# rm -rf を含むコマンドをブロック
if echo "$COMMAND" | grep -qE 'rm\s+-rf\s+/'; then
  echo "危険なコマンドがブロックされました: $COMMAND" >&2
  exit 2
fi

# git push --force をブロック
if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force'; then
  echo "force pushはブロックされています" >&2
  exit 2
fi

exit 0
