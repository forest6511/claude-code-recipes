# レシピ44: セキュリティスキャンSkillsを作る（CodeQL/Semgrep連携）

Semgrep（静的解析ツール）の実行結果をClaude Codeが分析・解釈し、脆弱性の検出から修正案の提示までを行うSkillsです。

## ファイル構成

```
.claude/skills/security-scan/
├── SKILL.md                    # セキュリティスキャンSkills本体
└── rules/
    └── custom-rules.yml        # Semgrepカスタムルール
```

## 前提条件

```bash
# Semgrepのインストール
brew install semgrep    # macOS
pip install semgrep     # pip
```

## 使い方

```bash
> /security-scan src/api/
```

## ポイント

- `context: fork` でスキャン結果がメインのコンテキストを圧迫しない
- Semgrepの結果をClaude Codeが文脈を踏まえて解釈し、手動分析で補完
- CWE番号を報告に含め、業界標準の分類で脆弱性を識別
