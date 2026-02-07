# レシピ45: API設計・OpenAPI生成Skillsを作る

API設計の方針策定からOpenAPI 3.1スペック生成までをガイドするSkillsです。

## ファイル構成

```
.claude/skills/api-design/
└── SKILL.md    # API設計・OpenAPI生成Skills本体
```

## 使い方

```bash
# 新規リソースのAPI設計
> /api-design users

# 既存コードからOpenAPIスペックを逆生成
> /api-design src/routes/
```

## ポイント

- フェーズ分け（リソース設計 → OpenAPIスペック生成 → 出力）で設計品質に集中
- エラーレスポンスの標準形式を定義し、全エンドポイントのエラー処理を統一
- `disable-model-invocation: true` でAPI設計という重要なアーキテクチャ決定を明示的に起動
