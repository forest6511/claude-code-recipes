---
name: security-scan
description: >-
  Runs security vulnerability scanning and static analysis.
  Use when checking for security issues, vulnerabilities,
  CVEs, OWASP violations, or when the user mentions
  security review, penetration testing, or code audit.
---

# セキュリティスキャン

## 手順

1. 対象のソースコードをスキャンする
2. 以下の観点でチェックする
   - SQLインジェクション
   - XSS（クロスサイトスクリプティング）
   - ハードコードされた認証情報
   - 既知のCVE
   - OWASP Top 10
3. 結果を重要度順にレポートする
