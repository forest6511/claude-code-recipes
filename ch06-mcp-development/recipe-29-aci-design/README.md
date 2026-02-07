# レシピ29: カスタムMCPサーバーの設計と実装 — ACI設計原則とポカヨケ

MCPサーバーのツールインターフェースを、Anthropicが提唱するACI（Agent-Computer Interface）設計原則に基づいて設計するためのガイドです。

## ファイル構成

```
recipe-29-aci-design/
├── README.md
├── good-tool-definition.json    # ACI原則に沿った良いツール定義の例
└── bad-tool-definition.json     # 改善が必要なツール定義の例
```

## ACI設計原則

1. **明確性（Clarity）**: ツールの説明とパラメータを見ただけで使い方が自明
2. **ポカヨケ（Mistake-proofing）**: LLMが間違いを起こしにくいパラメータ設計
3. **自然なフォーマット（Natural format）**: モデルの学習データに自然に出現する形式

## 使い方

`good-tool-definition.json`を参考に、自作MCPサーバーのツール定義を設計してください。
