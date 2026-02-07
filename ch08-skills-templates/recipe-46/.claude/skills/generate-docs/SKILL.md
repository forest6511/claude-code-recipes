---
name: generate-docs
description: コードにJSDoc、docstring、型アノテーションを追加する
argument-hint: [file-or-directory]
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep
---

# ドキュメントコメント生成

## 対象
$ARGUMENTS

## ルール

### 対象範囲
- エクスポートされた関数、クラス、メソッド、型定義
- 複雑なロジック（条件分岐が3つ以上、アルゴリズム）

### 対象外
- プライベートな単純関数（自明なgetter/setter等）
- 既にドキュメントがある関数（上書きしない）

### 言語別形式

TypeScript/JavaScriptの場合:

    /**
     * ユーザーの認証トークンを検証する
     * @param token - JWTトークン文字列
     * @returns デコードされたユーザー情報。無効なトークンの場合はnull
     * @throws {TokenExpiredError} トークンの有効期限が切れている場合
     */

Pythonの場合:

    def validate_token(token: str) -> Optional[UserInfo]:
        """ユーザーの認証トークンを検証する。

        Args:
            token: JWTトークン文字列

        Returns:
            デコードされたユーザー情報。無効なトークンの場合はNone

        Raises:
            TokenExpiredError: トークンの有効期限が切れている場合
        """

### 品質基準
- 関数の「何をするか」を最初の1文で要約する
- パラメータの型と制約を明記する
- 戻り値の意味と型を明記する
- 例外・エラーケースを記述する
- 実装の詳細ではなく、利用者の視点で記述する
