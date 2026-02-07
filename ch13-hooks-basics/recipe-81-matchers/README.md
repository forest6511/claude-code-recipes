# レシピ81: マッチャーパターンでツールをフィルタリングする

マッチャーの正規表現パターンの実践例です。

## 含まれるファイル

- `.claude/settings.json` — 複数のマッチャーグループ設定例

## 主なパターン

| パターン | マッチ対象 | 説明 |
|---------|----------|------|
| `Bash` | Bashのみ | 完全一致 |
| `Edit\|Write` | EditまたはWrite | OR演算子 |
| `Notebook.*` | NotebookEditなど | 前方一致 |
| `mcp__.*` | 全MCPサーバーのツール | MCP経由の全ツール |
| `mcp__github__.*` | GitHub MCPの全ツール | 特定MCPサーバー |
| `mcp__.*__write.*` | 任意MCPのwrite系 | サーバー横断 |

## イベント別マッチ対象

| イベント | マッチ対象 |
|---------|-----------|
| `PreToolUse`等 | ツール名 |
| `SessionStart` | `startup`, `resume`, `clear`, `compact` |
| `SessionEnd` | `clear`, `logout`, `prompt_input_exit`, `bypass_permissions_disabled`, `other` |
| `Notification` | `permission_prompt`, `idle_prompt`, `auth_success`, `elicitation_dialog` |
| `SubagentStart/Stop` | `Bash`, `Explore`, `Plan`, カスタム名 |
| `PreCompact` | `manual`, `auto` |

詳細は書籍「Claude Code実践レシピ」第13章を参照してください。
