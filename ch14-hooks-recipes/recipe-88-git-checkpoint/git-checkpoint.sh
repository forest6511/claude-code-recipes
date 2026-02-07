#!/bin/bash
INPUT=$(cat)

# Gitリポジトリでなければスキップ
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  exit 0
fi

# 未コミットの変更がなければスキップ
if git diff --quiet && git diff --cached --quiet; then
  exit 0
fi

# 最後のチェックポイントから60秒以内ならスキップ（頻繁な実行を防止）
LAST_CHECKPOINT=$(git log --oneline --grep="checkpoint:" -1 --format="%ct" 2>/dev/null)
NOW=$(date +%s)
if [ -n "$LAST_CHECKPOINT" ] && [ $((NOW - LAST_CHECKPOINT)) -lt 60 ]; then
  exit 0
fi

# チェックポイントコミット
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
git add -A >/dev/null 2>&1
git commit -m "checkpoint: auto-save before Claude edit ($TIMESTAMP)" --no-verify >/dev/null 2>&1

exit 0