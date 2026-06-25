variable "vm_name"        { type = string }
variable "vm_id"          { type = number }
variable "node_name"      { type = string; default = "proxmox-00" }
variable "pool_id"        { type = string; default = "vms" }
variable "cpu_cores"      { type = number; default = 2 }
variable "memory_mb"      { type = number; default = 2048 }
variable "disk_size_gb"   { type = number; default = 50 }
variable "datastore_id"   { type = string; default = "storage-vms" }
variable "cloud_image_id" { type = string }
variable "ip_address"     { type = string }
variable "gateway"        { type = string }
variable "dns_server"     { type = string; default = "1.1.1.1" }
variable "username"       { type = string; default = "connect" }
variable "ssh_public_key" { type = string }