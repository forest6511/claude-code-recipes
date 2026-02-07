# レシピ06: パーミッション設計で安全性を確保する

deny/ask/allowの3段階評価で安全性と生産性を両立するパーミッション設計パターンです。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.claude/settings.json` | Bash/Read/Edit/MCP/Taskの包括的パーミッション設定 |

## 使い方

```bash
mkdir -p .claude
cp .claude/settings.json /path/to/your-project/.claude/settings.json
```

## 評価順序

ルールは `deny` → `ask` → `allow` の順に評価され、最初にマッチしたルールが適用されます。

```
例: git push origin main
1. deny: "Bash(git push --force *)" → マッチしない → 次へ
2. ask:  "Bash(git push *)"         → マッチ → 確認ダイアログ表示
3. allow: (評価されない)
```

## カスタマイズ

- **deny**: 絶対に実行を許可しないコマンド・ファイルアクセスを追加
- **ask**: 都度確認が必要な操作を追加（git push、docker等）
- **allow**: 安全で頻繁に使うコマンドを追加（確認なしで実行）
- **MCP制御**: `mcp__servername`で特定MCPサーバーの全ツールを制御可能
