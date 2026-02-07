#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# 危険パターンの定義
DANGEROUS_PATTERNS=(
  'rm -rf /'
  'rm -rf ~'
  'rm -rf \.'
  'rm -rf \*'
  'mkfs\.'
  'dd if='
  ':(){:|:&};:'
  '> /dev/sda'
  'chmod -R 777 /'
  'DROP DATABASE'
  'DROP TABLE'
  'TRUNCATE TABLE'
  'DELETE FROM .* WHERE 1'
  '--no-preserve-root'
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qiE "$pattern"; then
    echo "危険なコマンドをブロックしました: '$pattern' パターンに一致。安全な代替手段を使ってください。" >&2
    exit 2
  fi
done

# 保護対象ディレクトリへの書き込みをチェック
PROTECTED_DIRS=("/etc" "/usr" "/sys" "/boot" "/var/lib")
for dir in "${PROTECTED_DIRS[@]}"; do
  if echo "$COMMAND" | grep -qE "(rm|mv|cp|>)\s+.*$dir"; then
    echo "システムディレクトリ '$dir' への操作をブロックしました。" >&2
    exit 2
  fi
done

exit 0