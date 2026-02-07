# レシピ07: コンテキストウィンドウの仕組みと/contextで監視する

コンテキストウィンドウの使用状況をリアルタイムで監視するステータスラインスクリプトと設定例です。

## ファイル一覧

| ファイル | 配置先 | 説明 |
|---------|--------|------|
| `statusline.sh` | `~/.claude/statusline.sh` | コンテキスト使用率をプログレスバーで表示するスクリプト |
| `settings.json` | `~/.claude/settings.json` | ステータスラインを登録する設定 |

## 使い方

```bash
# スクリプトを配置して実行権限を付与
cp statusline.sh ~/.claude/statusline.sh
chmod +x ~/.claude/statusline.sh

# settings.jsonの statusLine セクションを既存の設定にマージ
```

## カスタマイズ

- `BAR_WIDTH`の値を変更してプログレスバーの幅を調整できます
- 色分け（70%未満: 緑、70-89%: 黄、90%以上: 赤）を追加すると、圧縮タイミングを直感的に把握できます
- `context_window.current_usage`からトークン内訳（input_tokens、cache_creation_input_tokens等）も取得可能です
