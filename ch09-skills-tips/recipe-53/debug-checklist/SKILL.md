---
name: debug-skills
description: >-
  Diagnoses why a Skill is not working as expected.
  Use when a skill fails silently, does not activate,
  or produces unexpected results.
---

# Skillsデバッグチェックリスト

以下の手順で問題を特定してください。

## チェック1: 手動呼び出しの確認

```
/skill-name で手動呼び出しが成功するか?
  -> 失敗: SKILL.mdの内容を確認（チェック5, 6へ）
  -> 成功: descriptionの問題（チェック2へ）
```

## チェック2: バジェット超過の確認

```
/context で除外警告が出ていないか?
  -> 警告あり: バジェット超過（レシピ52参照）
  -> 警告なし: チェック3へ
```

## チェック3: descriptionのトリガー条件

```
descriptionに具体的なトリガー条件があるか?
  -> なし: "Use when..." を追加
  -> あり: チェック4へ
```

## チェック4: context:forkの適切性

```
context: fork を使っていて、明確なタスクがあるか?
  -> タスクなし: context:forkを削除するか、タスクを追加
  -> タスクあり: チェック5へ
```

## チェック5: YAML構文の検証

```
フロントマターにYAML構文エラーがないか?
  -> コロン(:)を含む値はクォートで囲む
  -> インデントは半角スペース2つ
```

## チェック6: nameフィールドの制約

```
nameが制約を満たしているか?
  -> 小文字、数字、ハイフンのみ
  -> 最大64文字
  -> 大文字、アンダースコアは不可
```

## チェック7: デバッグモード起動

```bash
claude --debug
```

デバッグモードではSkillsの読み込み、マッチング、実行の詳細がログに出力されます。
