# 第13章: Hooksの仕組みと基礎

Claude Code Hooksの14のライフサイクルイベント、`settings.json`での定義方法、マッチャーによるフィルタリング、デバッグ手法を4つのレシピで解説します。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 79 | [14のイベント種別と発火タイミング](./recipe-79-events/) | 全イベントの一覧とブロック可否を理解する |
| 80 | [`settings.json`でHooksを定義する](./recipe-80-basic-setup/) | 3層ネスト構造でPrettier自動実行とBash検証を設定する |
| 81 | [マッチャーパターンでツールをフィルタリング](./recipe-81-matchers/) | 正規表現パターンでフックの発火条件を制御する |
| 82 | [Hooksのデバッグとトラブルシューティング](./recipe-82-debugging/) | `--debug`フラグ、手動テスト、よくあるトラブルの解決策 |

## 使い方

```bash
# 例: 基本的なHooks設定をプロジェクトにコピー
cp -r recipe-80-basic-setup/.claude /path/to/your-project/

# 例: デバッグ用ラッパースクリプトをコピー
cp recipe-82-debugging/.claude/hooks/debug-wrapper.sh /path/to/your-project/.claude/hooks/
chmod +x /path/to/your-project/.claude/hooks/*.sh
```

レシピ79はイベント一覧のリファレンスです。各レシピのREADME.mdに設定の詳細を記載しています。
