#!/bin/bash
# プラグインのlintチェックスクリプト
# ${CLAUDE_PLUGIN_ROOT}からの相対パスで実行される

if [ -f "package.json" ]; then
  npx eslint --quiet "$TOOL_INPUT_path" 2>/dev/null
elif [ -f "pyproject.toml" ]; then
  ruff check "$TOOL_INPUT_path" 2>/dev/null
fi
