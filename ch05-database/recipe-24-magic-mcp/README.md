# レシピ24: Magic MCPでUIコンポーネントを自動生成する

21st.devのMagic MCPサーバーの`.mcp.json`設定パターンを収録しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | Magic MCPの基本設定 |

## セットアップ

1. 21st.devでAPIキーを取得します。

```text
1. https://21st.dev/magic/console にアクセス
2. アカウントを作成またはログイン
3. APIキーを生成
4. 環境変数に設定:
   export TWENTY_FIRST_API_KEY="your-api-key"
```

2. CLIでインストールします（推奨）。

```bash
npx @21st-dev/cli@latest install claude --api-key ${TWENTY_FIRST_API_KEY}
```

3. 手動設定の場合は`.mcp.json`をプロジェクトルートにコピーします。

## 使い方

```text
> /ui レスポンシブなナビゲーションバーを作成して
> /ui src/components/Header.tsx のデザインを改善して
> /logo GitHub Discord Slack
```
