# Code Reviewer メモリ（蓄積例）

以下は `memory: project` を設定したcode-reviewerサブエージェントが自動的に蓄積するメモリの例です。
このファイルは実際には `.claude/agent-memory/code-reviewer/MEMORY.md` に生成されます。

```markdown
# Code Reviewer メモリ

## プロジェクト規約
- APIレスポンス: { data, error, meta } の統一形式
- 認証: JWT + httpOnlyクッキー
- エラーハンドリング: 全APIに統一ミドルウェア

## 頻出する問題
- src/api/handlers/: try-catchの欠落が多い
- src/hooks/: useEffectの依存配列漏れ
- src/models/: バリデーションがコントローラー層に散在

## 過去の修正実績
- 2026-02: SQLインジェクション対策完了（パラメタライズドクエリに統一）
- 2026-02: XSS対策（DOMPurifyの導入）
```
