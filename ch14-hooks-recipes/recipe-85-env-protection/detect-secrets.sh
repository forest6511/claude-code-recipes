#!/bin/bash
INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Write/Editツールの場合: ファイル内容を検査
if [ "$TOOL" = "Write" ] || [ "$TOOL" = "Edit" ]; then
  CONTENT=""
  if [ "$TOOL" = "Write" ]; then
    CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')
  else
    CONTENT=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')
  fi

  # 機密情報パターン
  SECRET_PATTERNS=(
    'AKIA[0-9A-Z]{16}'                     # AWS Access Key
    'sk-[a-zA-Z0-9]{20,}'                  # OpenAI/Anthropic API Key
    'ghp_[a-zA-Z0-9]{36}'                  # GitHub Personal Token
    'xoxb-[0-9]{10,13}-[a-zA-Z0-9-]+'     # Slack Bot Token
    'password\s*[:=]\s*["\x27][^"\x27]+'   # password = "..." or password: "..."
    'secret\s*[:=]\s*["\x27][^"\x27]+'     # secret = "..."
  )

  for pattern in "${SECRET_PATTERNS[@]}"; do
    if echo "$CONTENT" | grep -qE "$pattern"; then
      echo "機密情報のパターンを検出しました。環境変数や.envファイルを使用してください。" >&2
      exit 2
    fi
  done
fi

# Bashツールの場合: 機密ファイルへのアクセスを検査
if [ "$TOOL" = "Bash" ]; then
  COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

  SENSITIVE_FILES=(".env" ".env.local" ".env.production" "credentials.json" "serviceAccountKey.json" "id_rsa" "id_ed25519")
  for file in "${SENSITIVE_FILES[@]}"; do
    if echo "$COMMAND" | grep -qE "(cat|less|head|tail|cp|mv|scp)\s+.*$file"; then
      echo "機密ファイル '$file' への操作をブロックしました。" >&2
      exit 2
    fi
  done
fi

exit 0