---
name: release-notes
description: リリースノートを生成する
disable-model-invocation: true
argument-hint: [version]
---

# リリースノート生成: v$0

## 前回リリースからの変更
!`git log $(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD~20")..HEAD --oneline`

## 変更されたファイル
!`git diff $(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD~20")..HEAD --stat`

## 指示
上記の変更内容から、v$0のリリースノートを以下の形式で生成してください。

### 新機能
- 機能追加のコミットを要約

### バグ修正
- バグ修正のコミットを要約

### その他の変更
- リファクタリング、ドキュメント更新等
