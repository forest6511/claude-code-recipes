---
# 悪い例1: 一人称のdescription
# description: I can help you process Excel files

# 悪い例2: 二人称のdescription
# description: You can use this to process Excel files

# 悪い例3: 曖昧なdescription
# description: Helps with documents

# 悪い例4: 冗長すぎるdescription（180文字超）
name: bad-review
description: >-
  This skill performs a comprehensive code review of the entire codebase,
  checking for bugs, security vulnerabilities, performance issues,
  code style violations, and best practice adherence. It generates
  a detailed report with severity levels and suggested fixes for each issue found.
---

# 悪い例: descriptionの問題パターン

このファイルは活性化率が低くなるdescriptionの典型例です。
書籍本文の「なぜこうするのか」セクションで詳しく解説しています。

## 問題点

1. 一人称（"I can help you..."）はClaude Code自身の発言と混同される
2. 二人称（"You can use..."）も判断精度が下がる
3. 曖昧な記述（"Helps with documents"）ではトリガー条件が不明
4. 冗長すぎるとキャラクターバジェットを消費する
