#!/bin/bash
INPUT=$(cat)
MESSAGE=$(echo "$INPUT" | jq -r '.message // "Claude Codeからの通知"')
TITLE=$(echo "$INPUT" | jq -r '.title // "Claude Code"')

# Linux: デスクトップ通知
notify-send "$TITLE" "$MESSAGE"

# Linux: サウンド通知（PulseAudio）
paplay /usr/share/sounds/freedesktop/stereo/complete.oga &

exit 0