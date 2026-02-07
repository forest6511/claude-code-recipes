# my-team-plugin

チーム共通のSkillsとHooksをまとめたプラグインサンプルです。

## 導入方法

```
# 公式マーケットプレイスから導入
> /plugin install plugin-name@claude-plugins-official

# 第三者のマーケットプレイスを追加
> /plugin marketplace add owner/repo

# マーケットプレイスからプラグインを導入
> /plugin install plugin-name@marketplace-name
```

## 呼び出し方

```
# namespace付きで呼び出し
> /my-team-plugin:review-code src/auth.ts
> /my-team-plugin:deploy production
> /my-team-plugin:test-runner
```
