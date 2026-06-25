variable "proxmox_endpoint" {
  description = "URL da API do Proxmox (ex: https://192.168.41.51:8006)"
  type        = string
}

variable "proxmox_api_token" {
  description = "Token no formato usuario@realm!tokenid=secret"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Chave publica SSH para injetar nas VMs via cloud-init"
  type        = string
}
