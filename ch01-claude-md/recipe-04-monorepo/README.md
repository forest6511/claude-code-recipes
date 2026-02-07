# レシピ04: モノレポでのCLAUDE.md分割戦略

Claude Codeの再帰的メモリ探索とサブツリー遅延読み込みを活用し、モノレポの各階層に適切な`CLAUDE.md`を配置する手法です。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `CLAUDE.md` | ルート: モノレポ全体の共通設定 |
| `packages/web/CLAUDE.md` | フロントエンド(Next.js)パッケージ固有設定 |
| `packages/api/CLAUDE.md` | バックエンド(Express)パッケージ固有設定 |
| `.claude/rules/frontend.md` | フロントエンド用の条件付きルール |

## 使い方

```bash
# モノレポのルートにコピー
cp CLAUDE.md /path/to/your-monorepo/CLAUDE.md
cp -r .claude /path/to/your-monorepo/.claude

# 各パッケージにコピー
cp packages/web/CLAUDE.md /path/to/your-monorepo/packages/web/CLAUDE.md
cp packages/api/CLAUDE.md /path/to/your-monorepo/packages/api/CLAUDE.md
```

## カスタマイズ

- **ルートCLAUDE.md**: パッケージマネージャ(pnpm/npm/yarn)、ビルドツール(Turborepo/Nx)に合わせる
- **パッケージCLAUDE.md**: 各パッケージの技術スタックとコマンドに合わせる
- **条件付きルール**: `.claude/rules/`のpathsパターンをパッケージのディレクトリ構造に合わせる
