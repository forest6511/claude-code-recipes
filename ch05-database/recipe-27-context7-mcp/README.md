# レシピ27: Context7 MCPでフレームワーク公式ドキュメントを参照する

Context7 MCPサーバーの`.mcp.json`設定パターンを収録しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | Context7 MCPの基本設定 |

## セットアップ

1. Context7のAPIキーを取得します。

```text
1. https://context7.com/dashboard にアクセス
2. アカウントを作成
3. APIキーを生成
4. 環境変数に設定:
   export CONTEXT7_API_KEY="your-api-key"
```

2. `.mcp.json`をプロジェクトルートにコピーします。

```bash
cp .mcp.json /path/to/your/project/.mcp.json
```

## CLIから追加する場合

```bash
claude mcp add --transport stdio \
  --env CONTEXT7_API_KEY=${CONTEXT7_API_KEY} \
  context7 -- npx -y @upstash/context7-mcp
```

## 使い方

```text
> Next.js 15のServer Actionsの使い方をContext7で調べて
> React 19のuseフックの公式ドキュメントを取得して
> Express.js 5のルーティングの変更点を調べて
```
