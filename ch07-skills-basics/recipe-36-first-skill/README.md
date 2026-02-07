# レシピ36: 初めてのカスタムSkillsを作る

実践的なSkillsの作成手順を、2つの例で解説します。

## ファイル一覧

| ファイル | 説明 |
|---------|------|
| `commit-message/SKILL.md` | ステージされた変更からConventional Commitsメッセージを生成（手動呼び出し専用） |
| `explain-code/SKILL.md` | コードの仕組みを図解と例えを交えて説明（自動読み込み対応） |

## 使い方

```bash
# プロジェクトSkillsとして配置
cp -r commit-message /path/to/your-project/.claude/skills/commit-message

# 個人Skillsとして配置（全プロジェクトで使用）
cp -r explain-code ~/.claude/skills/explain-code
```

```
# Claude Codeで呼び出し
> /commit-message
> /explain-code
```

## 設計のポイント

- **commit-message**: `disable-model-invocation: true`で手動呼び出し専用（副作用あり）
- **explain-code**: 自動読み込み有効（副作用なし、「説明して」で自動発動）
- **allowed-tools**: commit-messageではgit参照コマンドのみ許可（安全性維持）
