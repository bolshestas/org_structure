# 01 — Docker Cloud Platform

![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)
![Traefik](https://img.shields.io/badge/Proxy-Traefik-24A1C1?logo=traefikproxy)
![Let's Encrypt](https://img.shields.io/badge/SSL-Let's%20Encrypt-003A70)
![Cloudflare](https://img.shields.io/badge/DNS-Cloudflare-F38020?logo=cloudflare)

Self-hosted cloud services platform with automated SSL, reverse proxy, and DDNS.

## 🏗️ Architecture
```
Internet
    ↓
Cloudflare DNS (system-forge.net)
    ↓ Cloudflare Proxy (DDoS protection)
Router — Port 443 → Server
    ↓
Traefik (Reverse Proxy + SSL)
    ↓
┌─────────────────┬─────────────────┐
│   Vaultwarden   │   Nextcloud     │
│ vault.system-   │ cloud.system-   │
│ forge.net       │ forge.net       │
└─────────────────┴─────────────────┘
```

## 🚀 Services

| Service | URL | Description |
|---------|-----|-------------|
| Vaultwarden | vault.system-forge.net | Self-hosted password manager |
| Nextcloud | cloud.system-forge.net | Personal cloud storage |
| Traefik Dashboard | traefik.system-forge.net | Reverse proxy dashboard |

## ⚙️ Tech Stack

- **Docker Compose** — container orchestration
- **Traefik v2** — reverse proxy + automatic SSL
- **Let's Encrypt** — free SSL certificates via DNS challenge
- **Cloudflare** — DNS management + DDoS protection + DDNS

## 🔒 Security

- All traffic encrypted via HTTPS (TLS 1.2/1.3)
- Automatic SSL certificate renewal
- Cloudflare proxy hides server IP
- No open ports except 443

## 🚀 Quick Start
```bash
# Clone repo
git clone https://github.com/bolshestas/org_structure.git
cd org_structure/01-docker-cloud-platform

# Configure environment
cp .env.example .env
nano .env  # fill in your values

# Deploy
docker compose up -d
```

## 📁 Structure
```
01-docker-cloud-platform/
├── docker-compose.yml    # All services definition
├── traefik/
│   └── traefik.yml      # Reverse proxy config
├── .env.example         # Environment template
└── README.md
```
