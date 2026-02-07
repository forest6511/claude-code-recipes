# レシピ34: Claude Code自体をMCPサーバーとして使う（claude mcp serve）

`claude mcp serve`コマンドで、Claude Codeの強力なファイル操作・コード編集機能を、他のアプリケーションからMCPプロトコル経由で利用する設定例です。

## 起動方法

```bash
claude mcp serve
```

## Claude Desktopからの接続

`claude_desktop_config.json`に以下の設定を追加します。

## ファイル構成

```
recipe-34-mcp-serve/
├── README.md
└── claude_desktop_config.json  # Claude Desktop用の設定例
```

## 利用可能になるツール（一部）

| ツール名 | 説明 |
|----------|------|
| View | ファイルの読み取り |
| Edit | ファイルの編集 |
| Write | ファイルの書き込み |
| LS | ディレクトリ一覧 |
| Bash | コマンド実行 |
| Glob | ファイル検索 |
| Grep | テキスト検索 |

## 注意事項

- `claude`コマンドにPATHが通っていない場合は、フルパスを指定してください
- セキュリティ上、接続するクライアントが適切な確認メカニズムを持っていることを確認してください
