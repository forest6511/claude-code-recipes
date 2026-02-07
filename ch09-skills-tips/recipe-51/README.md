# レシピ51: Skills内でMCPサーバーのツールを指定する（ServerName:tool_name形式）

Skills内でMCPサーバーのツールを確実に呼び出すための完全修飾名の使い方です。

## 含まれるファイル

| ファイル | 説明 |
|---------|------|
| `issue-triage/SKILL.md` | GitHub MCPのツールを使ってIssueを分類するSkills |
| `visual-test/SKILL.md` | Playwright MCPのツールを使ってビジュアルテストするSkills |

## ポイント

1. **2つの形式の使い分け**:
   - SKILL.md本文の指示: `ServerName:tool_name`（例: `GitHub:get_issue`）
   - `allowed-tools`フィールド: `mcp__server__tool`（例: `mcp__github__get_issue`）
2. **完全修飾名の必要性**: 複数のMCPサーバーが同名のツールを持つ場合に曖昧さを排除
3. **ワイルドカード**: `mcp__github__*`でサーバー単位の一括許可が可能（ただし最小限推奨）
