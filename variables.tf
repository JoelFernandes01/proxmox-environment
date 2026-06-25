variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
  default     = "https://proxmox-00.connect.local:8006/api2/json"
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "SSH public key for VMs"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBojwLtvrf/o9+uQPdBUiBKACIGxMEhazCQs7VLjSf0K joel_fernandes@hotmail.com"
}

variable "vm_template" {
  description = "VM template name"
  type        = string
  default     = "ubuntu-26-server-template"
}

variable "vm_disk_size" {
  description = "Disk size for VMs"
  type        = string
  default     = "50G"
}

variable "storage_name" {
  description = "Storage name where template resides"
  type        = string
  default     = "storage-vms"
}

variable "vm_list" {
  description = "List of VMs to create"
  type = list(object({
    name      = string
    hostname  = string
    vmid      = number
    cores     = number
    memory    = number
    ip_config = list(object({
      ipv4 = object({
        address = string
        gateway = string
      })
    }))
  }))
  default = [
    {
      name      = "zabbix"
      hostname  = "zabbix.connect.local"
      vmid      = 2000
      cores     = 2
      memory    = 4096
      ip_config = [
        {
          ipv4 = {
            address = "10.0.39.220"
            gateway = "10.0.39.1"
          }
        }
      ]
    },
    {
      name      = "glpi"
      hostname  = "glpi.connect.local"
      vmid      = 2001
      cores     = 2
      memory    = 4096
      ip_config = [
        {
          ipv4 = {
            address = "10.0.39.222"
            gateway = "10.0.39.1"
          }
        }
      ]
    }
  ]
}