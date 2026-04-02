#!/bin/bash
# XRay Reality Config Generator
# Usage: ./generate-xray-config.sh <client_name> <server_ip> <server_port> <uuid> <public_key> [sni]

CLIENT=$1
SERVER_IP=$2
PORT=$3
UUID=$4
PUBLIC_KEY=$5
SNI=${6:-"www.microsoft.com"}  # default если не указан

cat > "/opt/base/vpn-configs/${CLIENT}.json" << EOF
{
  "inbounds": [],
  "outbounds": [
    {
      "tag": "proxy",
      "protocol": "vless",
      "settings": {
        "vnext": [
          {
            "address": "${SERVER_IP}",
            "port": ${PORT},
            "users": [
              {
                "id": "${UUID}",
                "flow": "xtls-rprx-vision"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "reality",
        "realitySettings": {
          "serverName": "${SNI}",
          "fingerprint": "chrome",
          "publicKey": "${PUBLIC_KEY}",
          "shortId": ""
        }
      }
    }
  ]
}
EOF

echo "Config saved: /opt/base/vpn-configs/${CLIENT}.json"
echo "vless://${UUID}@${SERVER_IP}:${PORT}?encryption=none&flow=xtls-rprx-vision&security=reality&sni=${SNI}&fp=chrome&pbk=${PUBLIC_KEY}&sid=&type=tcp&headerType=none#${CLIENT}"
