---
# 失敗例1: YAML構文エラー（コロンがYAMLと衝突）
name: my-skill
description: This skill does: something
---

# 失敗例1の問題

descriptionの値にコロン(:)が含まれており、YAMLの構文と衝突します。
フロントマターが完全に無視され、デフォルト値にフォールバックします。

---

# 失敗例2: nameの制約違反
# ---
# name: My_Skill
# ---
# 大文字とアンダースコアはname制約に違反します。

---

# 失敗例3: context:forkにタスクがない
# ---
# name: api-conventions
# context: fork
# ---
# API設計では以下の規約に従ってください。
# - RESTfulなリソース設計
# - 一貫したエラーレスポンス
# サブエージェントは実行すべきタスクがないため何も返しません。

---

# 失敗例4: !`command`にフォールバックがない
# ---
# name: pr-review
# ---
# ## PR差分
# !`gh pr diff`
# PRがない場合: "no pull requests found..." がそのまま展開されます。
