#!/bin/bash
set -euo pipefail

# 許可するドメイン一覧
ALLOWED_DOMAINS=(
  "api.anthropic.com"
  "statsig.anthropic.com"
  "sentry.io"
  "registry.npmjs.org"
  "github.com"
)

# iptablesルールをセットアップ
iptables -F OUTPUT 2>/dev/null || true

# DNS（ポート53）を許可
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

# ループバックを許可
iptables -A OUTPUT -o lo -j ACCEPT

# 確立済みの接続を許可
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# 許可ドメインへの接続を許可
for domain in "${ALLOWED_DOMAINS[@]}"; do
  ips=$(dig +short "$domain" 2>/dev/null || true)
  for ip in $ips; do
    iptables -A OUTPUT -d "$ip" -j ACCEPT
  done
done

# デフォルトで拒否
iptables -A OUTPUT -j DROP

echo "Firewall configured: ${#ALLOWED_DOMAINS[@]} domains allowed"
