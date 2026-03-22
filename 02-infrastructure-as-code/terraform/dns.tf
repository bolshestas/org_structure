# ─── HOME SERVER SUBDOMAINS ───────────────────────────────────────
resource "cloudflare_record" "vault" {
  zone_id = var.cloudflare_zone_id
  name    = "vault"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "cloud" {
  zone_id = var.cloudflare_zone_id
  name    = "cloud"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "media" {
  zone_id = var.cloudflare_zone_id
  name    = "media"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "docs" {
  zone_id = var.cloudflare_zone_id
  name    = "docs"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "grafana" {
  zone_id = var.cloudflare_zone_id
  name    = "grafana"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "prometheus" {
  zone_id = var.cloudflare_zone_id
  name    = "prometheus"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "status" {
  zone_id = var.cloudflare_zone_id
  name    = "status"
  content = var.home_server_ip
  type    = "A"
  proxied = true
}

# ─── ICELAND VPS SUBDOMAINS ───────────────────────────────────────
resource "cloudflare_record" "vpn_iceland" {
  zone_id = var.cloudflare_zone_id
  name    = "vpn-is"
  content = var.iceland_vps_ip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "vpn_usa" {
  zone_id = var.cloudflare_zone_id
  name    = "vpn-us"
  content = var.home_server_ip
  type    = "A"
  proxied = false
}
