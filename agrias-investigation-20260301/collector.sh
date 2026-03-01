#!/bin/bash

# agrias 라우터 상태 정보 수집 스크립트
# 대상: GL.iNet GL-MT3000 (agrias) - 100.86.91.107 (Tailscale)

set -e

ROUTER="100.86.91.107"
OUTPUT_DIR="$(pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$OUTPUT_DIR/raw-data-${TIMESTAMP}.txt"

echo "========================================="
echo "agrias 라우터 정보 수집 시작"
echo "대상: $ROUTER"
echo "출력: $OUTPUT_FILE"
echo "========================================="

ssh root@$ROUTER "
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    SYSTEM INFORMATION                      ║'
echo '╚════════════════════════════════════════════════════════════╝'
uname -a
echo ''
cat /etc/os-release
echo ''

echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    WIREGUARD STATUS                        ║'
echo '╚════════════════════════════════════════════════════════════╝'
echo '--- Configuration ---'
cat /etc/wireguard/wg0.conf 2>/dev/null || echo 'No WireGuard config found'
echo ''
echo '--- Interface Status ---'
wg show 2>/dev/null || echo 'WireGuard not running'
echo ''
echo '--- Service Status ---'
/etc/init.d/wireguard status 2>/dev/null || echo 'No wireguard init script'

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    UHTTPD WEB SERVER                       ║'
echo '╚════════════════════════════════════════════════════════════╝'
echo '--- UCI Configuration ---'
uci show uhttpd 2>/dev/null || echo 'No uhttpd config'
echo ''
echo '--- Service Status ---'
/etc/init.d/uhttpd status 2>/dev/null || echo 'No uhttpd init script'
echo ''
echo '--- Listening Ports ---'
netstat -tulpn | grep uhttpd || echo 'uhttpd not listening'

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    FIREWALL CONFIGURATION                  ║'
echo '╚════════════════════════════════════════════════════════════╝'
echo '--- UCI Firewall Config ---'
uci show firewall 2>/dev/null | head -100
echo ''
echo '--- iptables Filter Rules ---'
iptables -L -n -v 2>/dev/null || echo 'iptables not available'
echo ''
echo '--- iptables NAT Rules ---'
iptables -t nat -L -n -v 2>/dev/null || echo 'iptables NAT not available'

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    NETWORK INTERFACES                      ║'
echo '╚════════════════════════════════════════════════════════════╝'
ip addr show
echo ''
echo '--- Routing Table ---'
ip route show
echo ''
echo '--- Network Config ---'
uci show network 2>/dev/null | head -50

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    VPN STATUS                             ║'
echo '╚════════════════════════════════════════════════════════════╝'
echo '--- Tailscale ---'
tailscale status 2>/dev/null || echo 'Tailscale not installed or not running'
echo ''
echo '--- Tailscale IPs ---'
tailscale ip 2>/dev/null || echo 'N/A'
echo ''
echo '--- Surfshark Process ---'
ps aux | grep -i surfshark | grep -v grep || echo 'No Surfshark process found'

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    INSTALLED PACKAGES                     ║'
echo '╚════════════════════════════════════════════════════════════╝'
opkg list-installed | grep -E '(wireguard|openvpn|tailscale|uhttpd|firewall|luci)' || echo 'No matching packages'

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    RUNNING SERVICES                       ║'
echo '╚════════════════════════════════════════════════════════════╝'
/etc/init.d/list 2>/dev/null || ls /etc/init.d/ | head -20

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    ACTIVE CONNECTIONS                     ║'
echo '╚════════════════════════════════════════════════════════════╝'
netstat -tulpn | head -30

echo ''
echo '╔════════════════════════════════════════════════════════════╗'
echo '║                    RECENT LOGS                            ║'
echo '╚════════════════════════════════════════════════════════════╝'
logread | tail -50
" > "$OUTPUT_FILE"

echo ""
echo "========================================="
echo "수집 완료!"
echo "파일: $OUTPUT_FILE"
echo "크기: $(wc -l < "$OUTPUT_FILE") 줄"
echo "========================================="
