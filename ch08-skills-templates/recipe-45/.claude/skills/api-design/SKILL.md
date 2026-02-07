---
name: api-design
description: REST APIの設計とOpenAPI 3.1スペックを生成する。APIの新規作成や既存APIの仕様書化に使用する。
argument-hint: [リソース名またはファイルパス]
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep
---

# API設計・OpenAPI生成

## 対象
$ARGUMENTS

## フェーズ1: リソース設計

対象のリソースについて、以下を定義してください。

### リソース定義
- リソース名（複数形の英語名詞）
- 属性一覧（型、必須/任意、バリデーション）
- 関連リソースとの関係

### エンドポイント設計
| メソッド | パス | 説明 | リクエスト | レスポンス |
|---------|------|------|----------|-----------|
| GET | /resources | 一覧取得 | クエリパラメータ | 200: 配列 |
| GET | /resources/:id | 詳細取得 | - | 200/404 |
| POST | /resources | 新規作成 | body | 201/400 |
| PUT | /resources/:id | 更新 | body | 200/404 |
| DELETE | /resources/:id | 削除 | - | 204/404 |

### 設計原則
- RESTの原則に従う（リソース指向、ステートレス）
- 一貫した命名規則（kebab-case for paths, camelCase for fields）
- 適切なHTTPステータスコードの使用
- ページネーション、フィルタリング、ソートの標準パターン

## フェーズ2: OpenAPI 3.1スペック生成

設計に基づき、OpenAPI 3.1形式のYAMLファイルを生成してください。

### 必須要素
- info（タイトル、バージョン、説明）
- paths（全エンドポイント）
- components/schemas（リクエスト/レスポンスのスキーマ）
- components/responses（共通エラーレスポンス）

### エラーレスポンスの標準形式

    {
      "error": {
        "code": "RESOURCE_NOT_FOUND",
        "message": "指定されたリソースが見つかりません"
      }
    }

## フェーズ3: 出力

1. OpenAPI 3.1スペック（YAML形式）をファイルに保存する
2. 設計判断のサマリーを表示する
