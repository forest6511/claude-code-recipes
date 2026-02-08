# 第16章: パワーユーザーTIPS集

Docker隔離実行、ヘッドレスモード、究極のカスタマイズ戦略で、Claude Codeの活用をさらに高度化するTIPS集です。

## レシピ一覧

| # | レシピ | 説明 |
|---|--------|------|
| 96 | キーボードショートカット完全ガイド & Vim mode活用 | *書籍本文で解説（サンプルコードなし）* |
| 97 | [Docker/DevContainerで安全に隔離実行](./recipe-97-docker/) | DevContainer+ファイアウォール+サンドボックスの多層防御を構築する |
| 98 | [ヘッドレスモードとシェルスクリプト連携](./recipe-98-headless/) | `-p`フラグでClaude CodeをUnixパイプラインに組み込む |
| 99 | スクリーンショット&画像でUIデバッグ・コード生成 | *書籍本文で解説（サンプルコードなし）* |
| 100 | [自分だけの開発環境を構築する](./recipe-100-ultimate-setup/) | 本書の全技術を統合して4スコープの設定を段階的に整備する |

## 使い方

```bash
# 例: DevContainer設定をプロジェクトにコピー
cp -r recipe-97-docker/.devcontainer /path/to/your-project/

# 例: ヘッドレスモードのレビュースクリプトをコピー
cp recipe-98-headless/review-changes.sh /path/to/your-project/scripts/
chmod +x /path/to/your-project/scripts/review-changes.sh
```

レシピ96、99は操作解説が中心のため、書籍本文を参照してください。
