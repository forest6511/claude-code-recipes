# レシピ49: !`command`で動的コンテキストを注入する

`!`command``はSkillsの前処理メカニズムです。Skills呼び出し時にコマンドを実行し、その出力をSkills本文に動的に注入します。

## 含まれるファイル

| ファイル | 説明 |
|---------|------|
| `project-status/SKILL.md` | プロジェクトの状態を動的に収集するSkills |
| `test-runner/SKILL.md` | テストフレームワークを自動検出して実行するSkills |
| `dependency-audit/SKILL.md` | 依存関係を監査するSkills（context:fork使用） |

## ポイント

1. **前処理として実行**: `!`command``はClaude Codeに渡す前にサブプロセスで実行される
2. **エラーハンドリング**: `2>/dev/null || echo "fallback"` パターンで失敗時のフォールバックを設定
3. **出力サイズの制限**: `head`, `tail`, `--oneline` 等で出力を制限してトークン消費を抑える
4. **条件分岐**: シェルのif文で環境に応じた処理を分岐可能
