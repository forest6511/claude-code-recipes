# レシピ28: 複数MCPサーバーを組み合わせたデータパイプライン

複数MCPサーバーを連携させたワークフローの`.mcp.json`設定とSkillsテンプレートを収録しています。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.mcp.json` | 4つのMCPサーバーを統合した設定 |
| `weekly-report-skill.md` | 週次レポート生成のSkillsテンプレート |

## セットアップ

1. 各MCPサーバーに必要な環境変数を設定します。

```bash
export DATABASE_URL="postgresql://user:password@localhost:5432/mydb"
export CONTEXT7_API_KEY="your-context7-api-key"
```

2. `.mcp.json`をプロジェクトルートにコピーし、SlackのURLを設定します。

3. Skillsテンプレートを使う場合は、`weekly-report-skill.md`を`.claude/skills/weekly-report/SKILL.md`にコピーします。

```bash
mkdir -p .claude/skills/weekly-report
cp weekly-report-skill.md .claude/skills/weekly-report/SKILL.md
```

## 使い方

```text
# 直接指示する場合
> 以下の手順で週次レポートを作成・共有してください:
> 1. データベースから今週の売上をカテゴリ別・日別に集計
> 2. 前週比の増減率を計算
> 3. 結果をマークダウンのテーブルで整形
> 4. #weekly-report チャンネルに投稿

# Skillsとして実行する場合
> /weekly-report
```

## Tool Search

MCPサーバーの数が増えると、ツール定義がコンテキストウィンドウを圧迫します。Tool Search機能で最適化できます。

```bash
# 5%を超えたらTool Searchを有効化
ENABLE_TOOL_SEARCH=auto:5 claude

# 常に有効化
ENABLE_TOOL_SEARCH=true claude
```
