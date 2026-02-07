# レシピ82: Hooksのデバッグとトラブルシューティング

Hooksのデバッグ手法とトラブルシューティングの実践例です。

## 含まれるファイル

- `.claude/hooks/stop-guard.sh` — Stop Hooksの無限ループ防止スクリプト
- `.claude/hooks/debug-wrapper.sh` — フック入出力のログ記録ラッパー

## デバッグ方法

### 1. --debugフラグ

```bash
claude --debug
```

### 2. verbose mode（Ctrl+O）

セッション中にCtrl+Oでフック出力を表示

### 3. 手動テスト

```bash
echo '{"tool_name":"Bash","tool_input":{"command":"npm test"}}' | ./.claude/hooks/validate-bash.sh
echo $?
```

## Exit Code

| exit code | 意味 | 動作 |
|-----------|------|------|
| 0 | 成功 | アクション続行 |
| 2 | ブロックエラー | アクション阻止 |
| その他 | 非ブロックエラー | アクション続行 |

## よくあるトラブル

- **フックが発火しない**: マッチャーの大文字小文字を確認（`Bash`であって`bash`ではない）
- **JSON解析エラー**: `~/.zshrc`のecho文をインタラクティブモードに限定
- **Stop無限ループ**: `stop_hook_active`フィールドをチェック

詳細は書籍「Claude Code実践レシピ」第13章を参照してください。
