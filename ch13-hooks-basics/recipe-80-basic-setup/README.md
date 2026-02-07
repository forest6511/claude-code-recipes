# レシピ80: settings.jsonでHooksを定義する

Hooksの基本設定例です。

## 含まれるファイル

- `.claude/settings.json` — Prettier自動実行 + Bash検証フックの設定例
- `.claude/hooks/validate-bash.sh` — 危険コマンドブロックのスクリプト例

## 使い方

1. `.claude/settings.json` をプロジェクトの `.claude/` ディレクトリにコピー
2. `.claude/hooks/validate-bash.sh` をコピーし、実行権限を付与

```bash
chmod +x .claude/hooks/validate-bash.sh
```

## 3層ネスト構造

```
hooks                          ← 第1層: Hooks設定のルート
  └─ "PostToolUse"             ← 第2層: イベント名
       └─ [マッチャーグループ]   ← 第3層: matcher + hooks配列
            ├─ matcher          ← フィルタ条件
            └─ hooks            ← フックハンドラの配列
```

詳細は書籍「Claude Code実践レシピ」第13章を参照してください。
