#!/bin/bash
INPUT=$(cat)
MESSAGE=$(echo "$INPUT" | jq -r '.message // "Claude Codeからの通知"')
TITLE=$(echo "$INPUT" | jq -r '.title // "Claude Code"')

# macOS: デスクトップ通知
osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\"" 2>/dev/null

# macOS: サウンド通知
afplay /System/Library/Sounds/Glass.aiff &

exit 0