# レシピ97: Docker/DevContainerでClaude Codeを安全に隔離実行する

信頼性の低いリポジトリでClaude Codeを実行する際に、ホストシステムへの影響を防ぐ隔離環境を構築します。DevContainer設定、ファイアウォールによるネットワーク制限、サンドボックス機能を組み合わせた多層防御アプローチです。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `.devcontainer/devcontainer.json` | DevContainer設定（Node.js 20、Claude Code自動インストール） |
| `.devcontainer/Dockerfile` | コンテナイメージ定義 |
| `.devcontainer/init-firewall.sh` | 許可ドメインのみに接続を制限するファイアウォールスクリプト |
| `.claude/settings.json` | サンドボックス機能の有効化設定 |

## 配置先

```
your-project/
├── .devcontainer/
│   ├── devcontainer.json   ← DevContainer設定
│   ├── Dockerfile          ← コンテナイメージ
│   └── init-firewall.sh    ← ファイアウォール設定
└── .claude/
    └── settings.json       ← サンドボックス設定
```

## 使い方

1. `.devcontainer/` ディレクトリ一式をプロジェクトにコピーする
2. `.claude/settings.json` のサンドボックス設定をプロジェクトに適用する
3. VS Codeの「Reopen in Container」またはGitHub Codespacesで開く
4. コンテナ内では `--dangerously-skip-permissions` を安全に使用可能

## セキュリティの多層構造

| 層 | 保護内容 | 技術基盤 |
|---|---|---|
| ファイルシステム分離 | 作業ディレクトリ外への書き込みをブロック | macOS: Seatbelt / Linux: bubblewrap |
| ネットワーク分離 | 許可ドメイン以外への接続をブロック | プロキシサーバー経由の通信制御 |
| デフォルト拒否 | 許可されていない操作はすべてブロック | OSレベルのセキュリティプリミティブ |

## 注意事項

- `init-firewall.sh` の `ALLOWED_DOMAINS` は環境に応じてカスタマイズしてください
- Linuxでサンドボックスを使うには `bubblewrap` と `socat` の事前インストールが必要です
- `sandbox.excludedCommands` に `docker` を含めることが推奨されます（Dockerはサンドボックスとの互換性がないため）
