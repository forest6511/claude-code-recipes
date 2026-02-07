# レシピ33: Tool Searchとコンテキスト最適化

Claude CodeのTool Search機能を使い、多数のMCPサーバー接続時のコンテキスト消費を最適化する設定例です。

## Tool Searchの有効化

```bash
# 自動モード（デフォルト: ツール定義がコンテキストの10%超で有効化）
claude

# 常に有効
ENABLE_TOOL_SEARCH=true claude

# カスタムしきい値（5%で有効化）
ENABLE_TOOL_SEARCH=auto:5 claude

# 無効化
ENABLE_TOOL_SEARCH=false claude
```

## ファイル構成

```
recipe-33-tool-search/
├── README.md
├── settings-example.json       # settings.jsonでの永続的な設定例
└── server-instructions.ts      # instructionsフィールドの設定例（TypeScript）
```

## MCPサーバー側の最適化

`instructions`フィールドを設定すると、Tool Searchがツールを正確に見つけやすくなります。詳しくは`server-instructions.ts`を参照してください。
