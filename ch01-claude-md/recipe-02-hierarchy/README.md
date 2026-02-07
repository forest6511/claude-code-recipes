# レシピ02: CLAUDE.md階層設計

グローバル（個人設定）、プロジェクト（チーム共有）、ローカル（個人のプロジェクト固有）の3階層で設定を分離する手法です。

## ファイル一覧

| ファイル | 配置先 | 説明 |
|---------|--------|------|
| `global/CLAUDE.md` | `~/.claude/CLAUDE.md` | 全プロジェクト共通の個人設定 |
| `project/CLAUDE.md` | `./CLAUDE.md` | チーム全員で共有するプロジェクト設定 |
| `local/CLAUDE.local.md` | `./CLAUDE.local.md` | 個人のプロジェクト固有設定（Git管理外） |

## 使い方

```bash
# ユーザーメモリ（個人設定）
cp global/CLAUDE.md ~/.claude/CLAUDE.md

# プロジェクトメモリ（チーム共有）
cp project/CLAUDE.md /path/to/your-project/CLAUDE.md

# ローカルメモリ（個人固有）
cp local/CLAUDE.local.md /path/to/your-project/CLAUDE.local.md
```

## カスタマイズ

- **global**: コーディングスタイル、Git設定、出力言語の好みを設定
- **project**: 技術スタック、コーディング規約、開発コマンドをチームで統一
- **local**: ローカルDB接続先、作業メモなど個人環境に依存する情報を記述
