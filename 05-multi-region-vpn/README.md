# 05 — Multi-Region VPN Infrastructure

![WireGuard](https://img.shields.io/badge/VPN-WireGuard-88171A?logo=wireguard)
![XRay](https://img.shields.io/badge/Protocol-XRay%20Reality-blue)
![Ansible](https://img.shields.io/badge/Config-Ansible-EE0000?logo=ansible)
![Terraform](https://img.shields.io/badge/DNS-Terraform-7B42BC?logo=terraform)

Multi-region VPN infrastructure with XRay Reality and WireGuard across USA and Iceland exit nodes.

## 🏗️ Architecture
```
Clients (Russia/Anywhere)
    ↓
┌─────────────────────┬─────────────────────┐
│   Exit Node #1      │   Exit Node #2      │
│   USA (home server) │   Iceland (VPS)     │
│   XRay Reality      │   XRay Reality      │
│   WireGuard         │   WireGuard         │
└─────────────────────┴─────────────────────┘
    ↓                         ↓
Internet (USA)           Internet (EU)
```

## 🚀 Features

- **XRay VLESS + Reality** — undetectable traffic, mimics HTTPS to microsoft.com
- **WireGuard** — fast VPN for personal use
- **Dual-region** — USA + Iceland for redundancy
- **Hiddify client** — iOS/Android/Desktop support
- **BBR congestion control** — optimized for high latency connections
- **Fail2ban** — SSH brute-force protection

## 📱 Client Setup (XRay)

1. Install **Hiddify** app (iOS/Android/Desktop)
2. Import `vless://` link provided by admin
3. Switch between USA/Iceland servers in app

## 📱 Client Setup (WireGuard)

1. Install **WireGuard** app
2. Import `.conf` file provided by admin
3. Connect and enjoy

## ⚙️ Tech Stack

| Component | Technology |
|-----------|------------|
| VPN Protocol | XRay VLESS + Reality |
| Backup VPN | WireGuard |
| Client App | Hiddify |
| Traffic Masking | microsoft.com SNI |
| DPI Bypass | XTLS Vision |
| SSH Protection | Fail2ban |
| TCP Optimization | BBR |
| DNS | Terraform (Cloudflare) |

## 🖥️ Servers

| Node | Location | XRay Port | WireGuard Port |
|------|----------|-----------|----------------|
| USA | Home Server | 8443/TCP | 51821/UDP |
| Iceland | 1984.is VPS | 443/TCP | 443/UDP |

## 🔧 Config Generation
```bash
# Generate client config
./scripts/generate-xray-config.sh <name> <server_ip> <port> <uuid> <public_key> [sni]

# Example
./scripts/generate-xray-config.sh client1 185.112.147.209 443 UUID PUBKEY
```

## 📁 Structure
```
05-multi-region-vpn/
├── scripts/
│   └── generate-xray-config.sh  # Client config generator
├── configs/
│   └── client.conf.example      # WireGuard config template
└── README.md
```
