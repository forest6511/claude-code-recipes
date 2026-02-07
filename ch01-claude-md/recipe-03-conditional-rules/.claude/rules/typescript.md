---
paths:
  - "src/**/*.ts"
  - "src/**/*.tsx"
---

# TypeScriptルール

- strict モードを維持する
- any型を使用しない。unknown型で受けてから型ガードで絞り込む
- 関数の戻り値型を明示する
- インターフェース名はI接頭辞を付けない
