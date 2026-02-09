# 第7章: Skills設計と基本

`SKILL.md`ファイルの基本構造から動的パラメータ、サブエージェント連携まで、5つのレシピでSkillsの土台を築きます。Skillsは必要な場面で自動的に読み込まれるか、スラッシュコマンド（`/skill-name`）で直接呼び出せます。

## レシピ一覧（5件）

| # | レシピ | 難易度 | 説明 |
|---|--------|--------|------|
| 35 | [SKILL.mdの基本構造とfrontmatterを理解する](./recipe-35-basic-structure/) | ★☆☆ | フロントマターと配置場所によるスコープ制御 |
| 36 | [初めてのカスタムSkillsを作る](./recipe-36-first-skill/) | ★☆☆ | コミットメッセージ生成Skillsの作成手順 |
| 37 | [$ARGUMENTSで動的パラメータを受け取るSkillsを作る](./recipe-37-arguments/) | ★★☆ | 引数展開と動的コンテキスト注入 |
| 38 | [context:forkでサブエージェント実行するSkillsを作る](./recipe-38-context-fork/) | ★★☆ | 独立コンテキストでの重い処理の分離実行 |
| 39 | 公式・第三者のSkillsを安全に導入する | ★☆☆ | プラグインとSkillsの安全な導入方法 |

## 前提条件

- Claude Code: 最新版

## クイックスタート

```bash
# プロジェクトSkillsの作成
mkdir -p .claude/skills/commit-message
cat > .claude/skills/commit-message/SKILL.md << 'EOF'
---
name: commit-message
description: ステージされた変更からコミットメッセージを生成する
disable-model-invocation: true
allowed-tools: Bash(git diff *), Bash(git log *)
---

# コミットメッセージ生成

ステージされた変更を分析し、Conventional Commitsに従ったコミットメッセージを生成します。
EOF

# Skillsの呼び出し
claude
> /commit-message

# 個人用Skillsの作成（全プロジェクト共通）
mkdir -p ~/.claude/skills/explain-code
# ~/.claude/skills/explain-code/SKILL.md を作成
```

## 備考

- レシピ39は概念説明中心のため、サンプルコードはありません
- SkillsはAgent Skillsオープンスタンダード（agentskills.io）に準拠しています
- 第三者のSkillsを導入する際は`allowed-tools`と`!`command``を必ず確認してください
- 詳しい解説は書籍本文を参照してください
