variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for system-forge.net"
  type        = string
}

variable "home_server_ip" {
  description = "Home server public IP"
  type        = string
  default = "<your-home-server-ip>"
}

variable "iceland_vps_ip" {
  description = "Iceland VPS public IP"
  type        = string
  default = "<your-iceland-vps-ip>"
}
