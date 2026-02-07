---
name: release-notes
description: リリースノートを生成する。タグ間の変更をまとめる。
argument-hint: [version]
disable-model-invocation: true
allowed-tools: Bash(git *)
---

# リリースノート生成: v$ARGUMENTS

## 前回リリースからの変更
!`git log $(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD~30")..HEAD --oneline`

## 変更の統計
!`git diff $(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD~30")..HEAD --stat`

## 形式

以下の形式でリリースノートを生成してください。

    # v$ARGUMENTS リリースノート

    ## 新機能
    - feat系コミットを要約

    ## バグ修正
    - fix系コミットを要約

    ## 改善
    - refactor, perf系コミットを要約

    ## その他
    - docs, chore, ci系コミットを要約

## ルール

- コミットメッセージのtypeに基づいて分類する
- ユーザー視点の表現にする（内部実装の詳細は省略）
- 各項目は1行で簡潔に
