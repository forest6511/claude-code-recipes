---
name: project-status
description: >-
  Summarizes the current project state including git info, dependencies, and structure.
  Use when checking project status or starting a new session.
---

## Git情報
- ブランチ: !`git branch --show-current 2>/dev/null || echo "gitリポジトリではありません"`
- 未コミットの変更: !`git status --short 2>/dev/null || echo "なし"`
- 直近コミット: !`git log --oneline -3 2>/dev/null || echo "コミット履歴なし"`

## 依存関係
- Node.js: !`node --version 2>/dev/null || echo "未インストール"`
- Python: !`python3 --version 2>/dev/null || echo "未インストール"`

## プロジェクト構成
!`ls -la src/ 2>/dev/null || ls -la 2>/dev/null || echo "srcディレクトリなし"`
