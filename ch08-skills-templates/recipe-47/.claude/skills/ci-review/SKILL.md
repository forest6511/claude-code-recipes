---
name: ci-review
description: CI/CD環境でのコードレビュー。構造化出力に最適化。
context: fork
agent: Explore
disable-model-invocation: true
allowed-tools: Bash(git diff *), Bash(git log *), Read, Grep, Glob
---

# CI/CDコードレビュー

## 変更内容
!`git diff origin/main...HEAD --name-only 2>/dev/null || echo "差分なし"`

## タスク

変更されたファイルをレビューし、以下の形式で結果を返してください。

各指摘はissues配列の要素として、severity（HIGH/MEDIUM/LOW）、file（ファイルパス）、line（行番号）、description（指摘内容）、suggestion（修正案）を含めてください。

summaryにはレビュー結果の総評を1段落で記述してください。

指摘がない場合は空のissues配列と「問題は検出されませんでした」というsummaryを返してください。
