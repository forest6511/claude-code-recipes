# レシピ60: tools/disallowedToolsでエージェントの権限を制御する

カスタムエージェントに対して、使用可能なツールを明示的に制限する方法を解説します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.claude/agents/safe-researcher.md` | 読み取り専用でコードベースを調査するエージェント（Read/Grep/Glob/Bashのみ） |
| `.claude/agents/db-reader.md` | データベースのSELECTクエリのみ実行するエージェント（Bash + Hooksバリデーション） |
| `scripts/validate-readonly-query.sh` | SQLクエリがSELECT文のみであることを検証するバリデーションスクリプト |

## 使い方

```bash
# プロジェクトに配置
cp -r .claude /path/to/your-project/.claude
cp -r scripts /path/to/your-project/scripts
chmod +x /path/to/your-project/scripts/validate-readonly-query.sh

# バリデーションスクリプトの動作確認
echo "SELECT * FROM users LIMIT 10" | bash scripts/validate-readonly-query.sh
# → OK: 読み取り専用クエリとして検証済み

echo "DELETE FROM users WHERE id = 1" | bash scripts/validate-readonly-query.sh
# → ERROR: 禁止キーワード 'DELETE' が検出されました
```

## tools と disallowedTools の使い分け

### tools（ホワイトリスト方式）

使用を**許可する**ツールを列挙します。リストにないツールは使用できません。

```yaml
---
name: read-only-agent
tools:
  - Read
  - Grep
  - Glob
---
```

### disallowedTools（ブラックリスト方式）

使用を**禁止する**ツールを列挙します。リストにないツールは使用できます。

```yaml
---
name: no-write-agent
disallowedTools:
  - Write
  - Edit
  - Bash
---
```

### 使い分けの基準

| 方式 | 適したケース |
|------|-------------|
| `tools`（ホワイトリスト） | 安全性重視。許可するツールが少数の場合 |
| `disallowedTools`（ブラックリスト） | 柔軟性重視。禁止するツールが少数の場合 |

## Task(agent_type) 構文

ビルトインエージェント種別をプロンプトから指定する構文です。

```
Task(agent_type="Explore", prompt="プロジェクト構造を調査して")
Task(agent_type="Plan", prompt="リファクタリング計画を策定して")
Task(agent_type="general-purpose", prompt="テストを追加して")
```

カスタムエージェントの場合:

```
Task(agent="code-reviewer", prompt="src/を全体レビューして")
Task(agent="db-reader", prompt="usersテーブルの最新10件を取得して")
```

## permissionMode

エージェントの権限モードを制御します。`settings.json`で設定可能です。

```json
{
  "permissions": {
    "allow": [
      "Task(Explore)",
      "Task(code-reviewer)"
    ],
    "deny": [
      "Task(general-purpose)"
    ]
  }
}
```

| 設定 | 説明 |
|------|------|
| `Task(Explore)` | Exploreエージェントのみ許可 |
| `Task(code-reviewer)` | 特定のカスタムエージェントを許可 |
| `Task(*)` | 全てのエージェント起動を許可 |

## 設計のポイント

- 最小権限の原則: エージェントには必要最低限のツールのみ許可する
- 多層防御: ツール制限 + Hooksバリデーション + `settings.json`権限を組み合わせる
- バリデーションスクリプトはエージェント定義とは独立して管理する（再利用性向上）

## 関連レシピ

- レシピ59「カスタムエージェントの定義」
- レシピ06「パーミッション設計で安全性を確保する」
- レシピ84「危険コマンドをブロックする」
