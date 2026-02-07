# レシピ05: settings.jsonの実践設定テクニック

3つのスコープ（ユーザー/プロジェクト/ローカル）で`settings.json`を管理し、パーミッション・モデル・MCPサーバーの設定を最適化する手法です。

## ファイル一覧

| ファイル | 配置先 | 説明 |
|---------|--------|------|
| `user-settings.json` | `~/.claude/settings.json` | 全プロジェクト共通の個人設定 |
| `project-settings.json` | `.claude/settings.json` | チーム共有のプロジェクト設定 |
| `local-settings.json` | `.claude/settings.local.json` | 個人のプロジェクト固有設定 |

## 使い方

```bash
# ユーザー設定
cp user-settings.json ~/.claude/settings.json

# プロジェクト設定（チーム共有、Git管理）
mkdir -p .claude
cp project-settings.json /path/to/your-project/.claude/settings.json

# ローカル設定（個人固有、Git管理外）
cp local-settings.json /path/to/your-project/.claude/settings.local.json
```

## カスタマイズ

- **permissions.allow**: プロジェクトで頻繁に使うコマンドを追加（確認ダイアログを削減）
- **permissions.deny**: 危険なコマンドや機密ファイルのパスを追加
- **model**: ローカル設定でコスト最適化のためSonnetに切り替え可能
- **enableAllProjectMcpServers**: チーム全員が同じMCPを使う場合にtrue
