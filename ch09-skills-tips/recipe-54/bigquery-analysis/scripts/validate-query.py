#!/usr/bin/env python3
"""BigQueryクエリのバリデーションスクリプト"""
import re
import sys


def validate_query(query: str) -> list[str]:
    """クエリの基本的なバリデーションを実行"""
    warnings = []

    # テストアカウント除外チェック
    if "account" in query.lower() and "account_type != 'test'" not in query:
        warnings.append("WARNING: テストアカウントの除外条件がありません")

    # LIMIT チェック
    if "SELECT" in query.upper() and "LIMIT" not in query.upper():
        warnings.append("WARNING: LIMITが指定されていません（大量データの可能性）")

    # SELECT * チェック
    if re.search(r"SELECT\s+\*", query, re.IGNORECASE):
        warnings.append("WARNING: SELECT * は避け、必要なカラムを明示してください")

    return warnings


if __name__ == "__main__":
    query = sys.stdin.read()
    warnings = validate_query(query)
    if warnings:
        for w in warnings:
            print(w)
        sys.exit(1)
    else:
        print("OK: クエリのバリデーションに問題はありません")
