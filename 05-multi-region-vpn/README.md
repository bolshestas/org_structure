# 05 — Multi-Region VPN Infrastructure

![WireGuard](https://img.shields.io/badge/VPN-WireGuard-88171A?logo=wireguard)
![Ansible](https://img.shields.io/badge/Config-Ansible-EE0000?logo=ansible)
![Terraform](https://img.shields.io/badge/DNS-Terraform-7B42BC?logo=terraform)

Multi-region WireGuard VPN with USA and Iceland exit nodes for secure internet access.

## 🏗️ Architecture
```
Clients (Russia)
    ↓
┌─────────────────────┬─────────────────────┐
│   Exit Node #1      │   Exit Node #2      │
│   USA (home server) │   Iceland (VPS)     │
│   108.228.202.233   │   185.112.147.209   │
│   WireGuard         │   WireGuard         │
└─────────────────────┴─────────────────────┘
    ↓                         ↓
Internet (USA)           Internet (EU)
```

## 🚀 Features

- Dual-region setup (USA + Iceland)
- Per-client config files (2 configs each)
- One-tap region switching in WireGuard app
- Bypasses geo-restrictions
- Encrypted DNS (1.1.1.1 + 8.8.8.8)

## 📱 Client Setup

1. Install **WireGuard** app (iOS/Android)
2. Import `clientX-usa.conf` → USA server
3. Import `clientX-iceland.conf` → Iceland server
4. Switch between regions with one tap

## ⚙️ Tech Stack

- **WireGuard** — VPN protocol
- **iptables** — NAT and routing
- **Terraform** — DNS records (vpn-us, vpn-is)
- **Ansible** — automated server configuration

## 🖥️ Servers

| Node | Location | IP | Port |
|------|----------|----|------|
| USA | Home Server | 108.228.202.233 | 51820/UDP |
| Iceland | 1984.is VPS | 185.112.147.209 | 51820/UDP |
