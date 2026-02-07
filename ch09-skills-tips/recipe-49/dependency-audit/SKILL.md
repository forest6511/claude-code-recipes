---
name: dependency-audit
description: >-
  Audits project dependencies for outdated packages and security vulnerabilities.
  Use when checking dependency health or before major updates.
context: fork
agent: Explore
---

## package.json
!`cat package.json 2>/dev/null || echo "{}"`

## 依存関係のバージョン情報
!`npm ls --depth=0 2>/dev/null || pip list --format=json 2>/dev/null || echo "依存関係情報を取得できません"`

## セキュリティ監査
!`npm audit --json 2>/dev/null | head -50 || pip-audit --format=json 2>/dev/null | head -50 || echo "監査ツール未インストール"`

## 指示
上記の情報を分析し、以下を報告してください。

1. 古い依存関係（メジャーバージョンが2以上遅れているもの）
2. セキュリティ脆弱性のある依存関係
3. 更新の優先順位と推奨アクション
