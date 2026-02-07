#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# git commitコマンドでなければスキップ
if ! echo "$COMMAND" | grep -qE '^git commit'; then
  exit 0
fi

# ステージされたファイルからJS/TSファイルを抽出
STAGED_FILES=$(git diff --cached --name-only --diff-filter=d | grep -E '\.(js|ts|jsx|tsx)$')
if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

# ESLintを実行
LINT_ERRORS=""
for file in $STAGED_FILES; do
  RESULT=$(npx eslint "$file" 2>&1) || LINT_ERRORS="$LINT_ERRORS\n$RESULT"
done

if [ -n "$LINT_ERRORS" ]; then
  echo "lint/formatエラーがあります。修正してからコミットしてください:" >&2
  echo -e "$LINT_ERRORS" >&2
  exit 2
fi

# Prettierでフォーマット（ステージに再追加）
echo "$STAGED_FILES" | xargs npx prettier --write 2>/dev/null
echo "$STAGED_FILES" | xargs git add

exit 0