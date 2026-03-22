# 🏗️ Homelab Infrastructure

![Infrastructure](https://img.shields.io/badge/Infrastructure-Self--Hosted-blue)
![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-k3s-326CE5?logo=kubernetes)
![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform)
![Ansible](https://img.shields.io/badge/Config-Ansible-EE0000?logo=ansible)

Production-grade homelab infrastructure built with DevOps best practices.
Self-hosted cloud services, automated provisioning, and multi-region VPN.

## 🖥️ Hardware

| Component | Spec |
|-----------|------|
| CPU | Intel i7-7700 (4c/8t) |
| RAM | 16GB DDR4 |
| Storage | 256GB NVMe + 1TB HDD |
| OS | Debian 13 (Trixie) |
| VPS | Iceland 1984.is ($9/mo) |

## 🚀 Projects

| # | Project | Stack | Status |
|---|---------|-------|--------|
| 01 | [Docker Cloud Platform](./01-docker-cloud-platform/) | Docker, Traefik, SSL | ✅ Live |
| 02 | [Infrastructure as Code](./02-infrastructure-as-code/) | Terraform, Ansible, GitHub Actions | ✅ Live |
| 03 | [Kubernetes Cluster](./03-kubernetes-cluster/) | k3s, ArgoCD, Helm, Longhorn | 🚧 WIP |
| 04 | [Backup Automation](./04-backup-automation/) | Python, Restic, S3, Telegram | 🚧 WIP |
| 05 | [Multi-Region VPN](./05-multi-region-vpn/) | WireGuard, Terraform, Ansible | 🚧 WIP |

## 💰 Cost

| Resource | Cost |
|----------|------|
| Iceland VPS | $9/mo |
| Cloud Backups | ~$3/mo |
| **Total** | **~$12/mo** |

> Replacing $50+/mo in SaaS services
