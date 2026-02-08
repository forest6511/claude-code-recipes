# レシピ100: 自分だけの開発環境を構築する

本書で学んだ`CLAUDE.md`、Skills、Hooks、サブエージェント、MCPの全技術を統合して、自分だけの開発環境を構築するカスタマイズ戦略です。4つのスコープの設定ファイルを段階的に整備していきます。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `user-settings.json` | ユーザースコープ設定（`~/.claude/settings.json`の例） |
| `project-settings.json` | プロジェクトスコープ設定（`.claude/settings.json`の例） |
| `local-settings.json` | ローカルスコープ設定（`.claude/settings.local.json`の例） |

## 設定スコープの優先順位

| スコープ | ファイルの場所 | 影響範囲 | チーム共有 |
|---|---|---|---|
| Managed | システムレベルの`managed-settings.json` | マシン全ユーザー | IT部門が配布 |
| User | `~/.claude/settings.json` | 全プロジェクト共通 | 不可 |
| Project | `.claude/settings.json` | このリポジトリの全員 | Git経由で共有 |
| Local | `.claude/settings.local.json` | 自分だけ、このリポジトリ | 不可（`.gitignore`） |

優先順位: Managed > CLIフラグ > Local > Project > User

## 配置先

```
~/.claude/
└── settings.json              ← user-settings.json

your-project/
├── .claude/
│   ├── settings.json          ← project-settings.json（Git管理）
│   ├── settings.local.json    ← local-settings.json（.gitignore）
│   ├── agents/                # カスタムサブエージェント
│   ├── skills/                # カスタムSkills
│   └── rules/                 # 条件付きルール
├── CLAUDE.md                  # プロジェクトコンテキスト
└── .mcp.json                  # MCPサーバー設定
```

## 使い方

1. `user-settings.json` を `~/.claude/settings.json` にコピーし、全プロジェクト共通のパーミッションを設定する
2. `project-settings.json` を `.claude/settings.json` にコピーし、チーム共有のルールとHooksを設定する
3. `local-settings.json` を `.claude/settings.local.json` にコピーし、個人のモデル選好や追加パーミッションを設定する

## カスタマイズの段階的アプローチ

1. **基盤**: `CLAUDE.md` + Rules + パーミッション設定
2. **外部ツール連携**: MCPサーバーの設定（`.mcp.json`）
3. **自動化**: Skillsとサブエージェントの定義
4. **品質保証**: Hooksでコミット前チェック・危険コマンド防止
5. **ワークフロー統合**: CI/CD連携・ヘッドレスモード・チーム開発

## 注意事項

- APIキーや個人的な設定は必ず `settings.local.json`（`.gitignore`対象）に記述してください
- `settings.json`（Project scope）はGit管理対象です。機密情報を含めないでください
- 設定はマージされます。上位スコープの設定を下位スコープで上書きできます
