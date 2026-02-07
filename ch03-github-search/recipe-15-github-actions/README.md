# レシピ15: GitHub ActionsでClaude Codeを実行する（claude-code-action）

`claude-code-action`をGitHub Actionsに設定し、`@claude`メンションでPRレビューやIssue対応を自動化します。

## セットアップ

### 方法1: 自動セットアップ（推奨）

Claude Code内で`/install-github-app`を実行します。

```bash
> /install-github-app
# ガイドに従ってGitHub Appのインストールとシークレット設定を完了
```

### 方法2: 手動セットアップ

1. Claude GitHub Appをリポジトリにインストールします。

```
1. https://github.com/apps/claude にアクセス
2. 「Install」→ 対象リポジトリを選択
3. Contents, Issues, Pull requestsのRead & Write権限を許可
```

2. リポジトリシークレットに`ANTHROPIC_API_KEY`を追加します。

```
リポジトリ → Settings → Secrets and variables → Actions
→ New repository secret → Name: ANTHROPIC_API_KEY → Value: sk-ant-...
```

3. ワークフローファイル（`claude.yml`または`claude-review.yml`）をコピーします。

## 使い方

### 基本的な使い方（`claude.yml`）

IssueやPRのコメントで`@claude`を使います。

```bash
# Issueコメントの例
@claude このIssueの内容を実装してPRを作成してください

# PRレビューコメントの例
@claude この関数にバリデーションを追加してください

# PRコメントの例
@claude セキュリティの観点からこのPRをレビューしてください
```

### Skills連携版（`claude-review.yml`）

`prompt`パラメータにSkills名を指定すると、`@claude`メンションなしで自動実行されます。

```yaml
prompt: "/review"
```

カスタム引数を渡す場合は`claude_args`パラメータを使います。

```yaml
claude_args: |
  --max-turns 10
  --model claude-sonnet-4-5-20250929
  --append-system-prompt "Follow our coding standards in CLAUDE.md"
```

## ワークフローファイル

- `claude.yml`: 基本版（`@claude`メンションで実行）
- `claude-review.yml`: Skills連携版（`prompt`パラメータ付き）
