#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# 保護対象ファイルパターン
PROTECTED_PATTERNS=(".env" ".git/" "node_modules/" "credentials" "secret" "id_rsa" "id_ed25519")

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "保護対象ファイル '$FILE_PATH' の編集をブロックしました。" >&2
    exit 2
  fi
done

exit 0