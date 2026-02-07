#!/bin/bash
# validate-readonly-query.sh
# SQLクエリがSELECT文（読み取り専用）であることを検証するスクリプト
#
# 使い方:
#   echo "SELECT * FROM users" | bash scripts/validate-readonly-query.sh
#   echo "DELETE FROM users" | bash scripts/validate-readonly-query.sh  # → エラー
#
# 終了コード:
#   0: 安全なクエリ（SELECT文のみ）
#   1: 危険なクエリ（変更操作を含む）

set -euo pipefail

# 標準入力からクエリを読み取り
QUERY=$(cat)

# 空クエリのチェック
if [ -z "$QUERY" ]; then
  echo "ERROR: クエリが空です" >&2
  exit 1
fi

# クエリを大文字に変換（比較用）
UPPER_QUERY=$(echo "$QUERY" | tr '[:lower:]' '[:upper:]')

# 禁止キーワードのリスト
FORBIDDEN_KEYWORDS=(
  "INSERT"
  "UPDATE"
  "DELETE"
  "DROP"
  "ALTER"
  "CREATE"
  "TRUNCATE"
  "REPLACE"
  "GRANT"
  "REVOKE"
  "EXEC"
  "EXECUTE"
  "INTO"
)

# 各キーワードをチェック
for keyword in "${FORBIDDEN_KEYWORDS[@]}"; do
  # 単語境界を考慮してチェック（部分一致を避ける）
  if echo "$UPPER_QUERY" | grep -qE "(^|[[:space:];])${keyword}([[:space:];(]|$)"; then
    echo "ERROR: 禁止キーワード '${keyword}' が検出されました" >&2
    echo "ERROR: 読み取り専用クエリ（SELECT文）のみ許可されています" >&2
    echo "BLOCKED: $QUERY" >&2
    exit 1
  fi
done

# セミコロンで区切られた複数文のチェック
STATEMENT_COUNT=$(echo "$QUERY" | grep -o ";" | wc -l | tr -d ' ')
if [ "$STATEMENT_COUNT" -gt 1 ]; then
  echo "ERROR: 複数のSQL文が検出されました（SQLインジェクションの可能性）" >&2
  echo "BLOCKED: $QUERY" >&2
  exit 1
fi

# SELECTで始まることを確認
TRIMMED_QUERY=$(echo "$UPPER_QUERY" | sed 's/^[[:space:]]*//')
if [[ ! "$TRIMMED_QUERY" =~ ^(SELECT|WITH|EXPLAIN|SHOW|DESCRIBE) ]]; then
  echo "ERROR: クエリはSELECT/WITH/EXPLAIN/SHOW/DESCRIBEで始まる必要があります" >&2
  echo "BLOCKED: $QUERY" >&2
  exit 1
fi

echo "OK: 読み取り専用クエリとして検証済み" >&2
exit 0
