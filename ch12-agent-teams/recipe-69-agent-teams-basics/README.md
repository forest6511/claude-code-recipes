# レシピ69: Agent Teamsの基本 --- リーダー・チームメイトの仕組み

Agent Teamsを有効化し、リーダー・チームメイト構成でタスクを分担します。有効化方法、アーキテクチャの概要、表示モードの設定を解説します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `settings.json` | Agent Teamsを有効化する`settings.json`設定 |
| `prompts/team-creation.txt` | チーム構成の指示プロンプト例 |

## 使い方

```bash
# Agent Teamsを有効化（settings.jsonをプロジェクトに配置）
cp settings.json /path/to/your-project/.claude/settings.json

# または環境変数で有効化
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

# 表示モードの指定（CLIフラグ）
claude --teammate-mode in-process
```

## アーキテクチャ

```
リーダー（Team Lead）
  - メインのClaude Codeセッション
  - チームの作成、タスクの割り当て、結果の統合を担当

チームメイト（Teammates）
  - 独立したClaude Codeインスタンス
  - それぞれ独自のコンテキストウィンドウを持つ
  - チームメイト同士で直接メッセージ交換が可能

共有タスクリスト（Task List）
  - 全メンバーが参照・更新できる作業項目リスト

メールボックス（Mailbox）
  - エージェント間のメッセージングシステム
```

## 表示モード

| モード | 説明 |
|--------|------|
| `in-process`（デフォルト） | 全チームメイトがメインターミナル内で動作。Shift+上下キーでチームメイト選択 |
| `tmux`（split panes） | 各チームメイトが独立ペインで動作。tmuxまたはiTerm2が必要 |

## 関連レシピ

- レシピ57「Taskツールの仕組みと独立コンテキスト」
- レシピ71「共有タスクリストと依存関係管理」
- レシピ78「コスト最適化パターン」
