#!/bin/bash
# scripts/ci-review.sh

# パーミッション確認をスキップ（CI環境）
# --dangerously-skip-permissions はCI環境でのみ使用してください
REVIEW_RESULT=$(claude -p "/ci-review" \
  --output-format json \
  --max-turns 10 \
  --max-budget-usd 1.00 \
  --dangerously-skip-permissions \
  --json-schema '{
    "type": "object",
    "properties": {
      "issues": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "severity": {"type": "string"},
            "file": {"type": "string"},
            "line": {"type": "number"},
            "description": {"type": "string"},
            "suggestion": {"type": "string"}
          },
          "required": ["severity", "file", "description"]
        }
      },
      "summary": {"type": "string"}
    },
    "required": ["issues", "summary"]
  }')

# HIGH重要度の指摘があるか確認
HIGH_COUNT=$(echo "$REVIEW_RESULT" | jq '[.result.issues[] | select(.severity == "HIGH")] | length')

if [ "$HIGH_COUNT" -gt 0 ]; then
  echo "HIGH重要度の指摘が${HIGH_COUNT}件あります"
  echo "$REVIEW_RESULT" | jq '.result.issues[] | select(.severity == "HIGH")'
  exit 1
fi

echo "レビュー完了: 重大な問題はありません"
exit 0
