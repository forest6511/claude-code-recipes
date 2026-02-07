#!/bin/bash
# Stop Hooksの無限ループ防止スクリプト
# stop_hook_activeフィールドをチェックし、
# 既にStop Hooksによる継続中の場合はスキップする

INPUT=$(cat)

# 既にStop Hooksによる継続中の場合はスキップ
if [ "$(echo "$INPUT" | jq -r '.stop_hook_active')" = "true" ]; then
  exit 0
fi

# 本来のチェックロジック（例: テスト実行）
npm test 2>/dev/null
if [ $? -ne 0 ]; then
  echo "テストが失敗しています。修正してから完了してください。" >&2
  exit 2
fi

exit 0
