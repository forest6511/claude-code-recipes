#!/bin/bash
# review-changes.sh - mainブランチとの差分を自動レビュー
set -euo pipefail

BRANCH=$(git branch --show-current)
DIFF=$(git diff main..."$BRANCH" --name-only)

if [ -z "$DIFF" ]; then
  echo "No changes to review"
  exit 0
fi

echo "Reviewing changes on branch: $BRANCH"
echo "Changed files:"
echo "$DIFF"

# Claude Codeでレビューを実行
git diff main..."$BRANCH" | claude -p \
  "コードレビューを実施してください。以下の観点でレビューしてください:
   1. バグの可能性
   2. セキュリティ上の懸念
   3. パフォーマンスの問題
   各問題はファイル名と行番号を含めて報告してください。" \
  --output-format text > review-report.txt

echo "Review complete: review-report.txt"
