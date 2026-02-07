---
name: visual-test
description: >-
  Takes page snapshots and verifies UI changes using Playwright.
  Use when checking visual regression, layout issues, or UI validation.
disable-model-invocation: true
context: fork
allowed-tools: mcp__playwright__browser_navigate, mcp__playwright__browser_snapshot, mcp__playwright__browser_take_screenshot, Read, Grep
---

# ビジュアルテスト

## 対象URL
$ARGUMENTS

## 手順

1. playwright:browser_navigateで対象URLにアクセスする
2. playwright:browser_snapshotでアクセシビリティスナップショットを取得する
3. playwright:browser_take_screenshotでスクリーンショットを保存する
4. 以下の観点で検証する
   - レイアウトの崩れがないか
   - テキストの切れや重なりがないか
   - インタラクティブ要素が操作可能か
5. 検証結果を報告する
