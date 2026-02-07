---
name: test-runner
description: >-
  Detects test framework and runs the project test suite.
  Use when running tests, checking test status, or validating changes.
disable-model-invocation: true
---

## テストフレームワーク検出
!`if [ -f "package.json" ]; then grep -oE '"(jest|vitest|mocha|playwright)"' package.json 2>/dev/null | head -3 || echo "テストフレームワーク未検出"; elif [ -f "pytest.ini" ] || [ -f "pyproject.toml" ]; then echo "pytest"; elif [ -f "go.mod" ]; then echo "go test"; else echo "テストフレームワーク未検出"; fi`

## テスト設定
!`cat jest.config.js 2>/dev/null || cat vitest.config.ts 2>/dev/null || cat pytest.ini 2>/dev/null || echo "テスト設定ファイルなし"`

## 指示
上記で検出されたテストフレームワークと設定に基づいて、テストを実行してください。
