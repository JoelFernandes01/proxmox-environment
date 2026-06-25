resource "proxmox_virtual_environment_vm" "vm" {
  name    = var.vm_name
  vm_id   = var.vm_id
  node_name = var.node_name
  pool_id = var.pool_id
  tags    = ["terraform", "cloud-init"]

  cpu {
    cores = var.cpu_cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory_mb
  }

  agent {
    enabled = true
  }

  disk {
    datastore_id = var.datastore_id
    file_id      = var.cloud_image_id
    interface    = "scsi0"
    size         = var.disk_size_gb
    discard      = "on"
    ssd          = true
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    datastore_id = var.datastore_id

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.dns_server]
    }

    user_account {
      username = var.username
      keys     = [var.ssh_public_key]
    }
  }
}