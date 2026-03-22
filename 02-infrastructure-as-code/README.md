# 02 — Infrastructure as Code

![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform)
![Ansible](https://img.shields.io/badge/Config-Ansible-EE0000?logo=ansible)
![GitHub Actions](https://img.shields.io/badge/CI-GitHub%20Actions-2088FF?logo=githubactions)
![Cloudflare](https://img.shields.io/badge/DNS-Cloudflare-F38020?logo=cloudflare)

Automated infrastructure provisioning and configuration management using IaC principles.

## 🏗️ Architecture
```
GitHub Push
    ↓
GitHub Actions (terraform validate + fmt check)
    ↓
Terraform → Cloudflare DNS (9 records managed as code)
    ↓
Ansible → Home Server + Iceland VPS (automated config)
```

## ⚙️ Tech Stack

- **Terraform** — DNS infrastructure as code (Cloudflare provider)
- **Ansible** — server configuration management
- **Ansible Vault** — encrypted secrets management
- **GitHub Actions** — CI/CD pipeline for IaC validation

## 📋 What's Automated

**Terraform manages:**
- All DNS records for system-forge.net
- VPN endpoint records (vpn-us, vpn-is)

**Ansible configures both servers:**
- Base packages (curl, wget, git, htop)
- UFW firewall with minimal ruleset
- Fail2ban intrusion prevention
- SSH hardening (key-only auth)
- Automatic security updates

## 🚀 Quick Start
```bash
# Terraform
cd terraform
cp terraform.tfvars.example terraform.tfvars
nano terraform.tfvars  # fill in your values
terraform init
terraform plan
terraform apply

# Ansible
cd ansible
ansible-vault create inventory/secrets.yml
ansible-playbook -i inventory/hosts.yml playbooks/common.yml --ask-vault-pass
```

## 📁 Structure
```
02-infrastructure-as-code/
├── terraform/
│   ├── main.tf              # Provider configuration
│   ├── variables.tf         # Input variables
│   ├── dns.tf               # Cloudflare DNS records
│   └── terraform.tfvars.example
├── ansible/
│   ├── inventory/
│   │   └── hosts.yml        # Server inventory
│   └── playbooks/
│       └── common.yml       # Base server configuration
└── README.md
```
