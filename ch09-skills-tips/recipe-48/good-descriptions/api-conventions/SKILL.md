---
name: api-conventions
description: >-
  API design conventions and coding standards.
  Use when designing REST APIs, reviewing API code,
  or implementing new endpoints.
user-invocable: false
---

# API設計規約

参照型Skillsの例。user-invocable: falseにすることで、
/メニューを汚さず、Claude Codeが必要な時だけ自動参照します。

## RESTful設計原則

- リソースは複数形の名詞（/users, /orders）
- HTTPメソッドで操作を表現（GET, POST, PUT, DELETE）
- ステータスコードは適切なものを使用
