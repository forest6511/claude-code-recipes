---
# 修正例1: コロンを含む値はクォートで囲む
name: my-skill
description: "This skill does: something"
---

# 修正パターン

## YAML構文エラーの修正
値にコロン(:)を含む場合はクォートで囲みます。

## nameの修正
```yaml
# Before: My_Skill
# After:
name: my-skill
```
小文字、数字、ハイフンのみ使用可能です。

## context:forkの修正
ガイドライン型のSkillsにはcontext:forkを使いません。
```yaml
---
name: api-conventions
---
# context:forkなし（インラインで読み込まれる）
```

## !`command`のフォールバック追加
```
!`gh pr diff 2>/dev/null || echo "現在のブランチにPRが見つかりません。手動で対象を指定してください。"`
```
