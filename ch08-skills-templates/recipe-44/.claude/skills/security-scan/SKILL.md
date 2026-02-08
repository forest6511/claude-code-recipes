---
name: security-scan
description: セキュリティスキャンを実行し、脆弱性の検出と修正案を提示する
argument-hint: [file-or-directory]
context: fork
disable-model-invocation: true
allowed-tools: Bash(semgrep scan *), Read, Grep, Glob
---

# セキュリティスキャン

## 対象
$ARGUMENTS

## ステップ1: 静的解析の実行

以下のコマンドでSemgrepを実行し、結果を分析してください。

    semgrep scan --config auto --json $ARGUMENTS 2>/dev/null

Semgrepがインストールされていない場合は、手動分析に切り替えてください。

## ステップ2: 手動分析（Semgrep結果の補完）

Semgrepが検出できない以下の項目を追加で確認してください。

### ビジネスロジックの脆弱性
- 認可チェックの漏れ（IDOR）
- レースコンディション
- 不適切なエラーハンドリング（スタックトレースの露出）

### 機密情報の取り扱い
- ハードコードされた認証情報
- ログへの機密情報出力
- エラーメッセージでの内部情報露出

### 依存関係
- `package.json` / requirements.txt の既知の脆弱性

## ステップ3: 結果の統合と報告

Semgrepの結果と手動分析の結果を統合し、以下の形式で報告してください。

| # | 重要度 | CWE | ファイル:行 | 脆弱性 | 検出方法 | 修正案 |
|---|--------|-----|-----------|--------|---------|--------|
| 1 | CRITICAL/HIGH/MEDIUM/LOW | CWE-XXX | path:line | 説明 | Semgrep/手動 | 修正コード |

## ステップ4: 修正案の提示

CRITICAL/HIGHの脆弱性について、修正前と修正後のコードを対比で示してください。

    修正前:
    （脆弱なコード）

    修正後:
    （修正されたコード）

    理由:
    （なぜこの修正が必要か）
