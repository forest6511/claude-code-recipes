# レシピ37: $ARGUMENTSで動的パラメータを受け取るSkillsを作る

引数展開（`$ARGUMENTS`、`$0`〜`$N`）と前処理コマンド（`` !`command` ``）で動的に動作するSkillsの作成手法です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `fix-issue/SKILL.md` | `$ARGUMENTS`でIssue番号を受け取りバグ修正する |
| `migrate-component/SKILL.md` | `$0`〜`$2`の位置引数でフレームワーク移行する |
| `pr-review/SKILL.md` | `` !`command` ``でPR差分を動的注入してレビューする |
| `release-notes/SKILL.md` | 引数と`` !`command` ``を組み合わせてリリースノートを生成する |

## 使い方

```bash
cp -r fix-issue /path/to/your-project/.claude/skills/fix-issue
```

```
# 呼び出し例
> /fix-issue 123
> /migrate-component SearchBar React Vue
> /pr-review
> /release-notes 2.1.0
```

## 変数リファレンス

| 変数 | 説明 | 例 |
|------|------|-----|
| `$ARGUMENTS` | 全引数をそのまま展開 | `123 --verbose` |
| `$0`（`$ARGUMENTS[0]`） | 第1引数 | `SearchBar` |
| `$1`（`$ARGUMENTS[1]`） | 第2引数 | `React` |
| `${CLAUDE_SESSION_ID}` | 現在のセッションID | `abc123def456` |
| `` !`command` `` | コマンド出力を前処理で注入 | PR差分、gitログ等 |
