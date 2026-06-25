# Criando as VMs
resource "proxmox_virtual_environment_vm" "vm" {
  for_each = { for vm in var.vm_list : vm.name => vm }

  vm_id       = each.value.vmid
  node_name   = "proxmox-00"
  name        = each.value.name
  description = "VM: ${each.value.hostname}"

  # Configuração do Sistema Operacional
  clone {
    vm_id     = data.proxmox_virtual_environment_vm.template.id
    full      = true
    datastore = var.storage_name
  }

  # Hardware
  cpu {
    cores = each.value.cores
    type  = "host"
  }

  memory {
    dedicated = each.value.memory
  }

  # Disco (já clonado do template)
  disk {
    datastore = var.storage_name
    size      = var.vm_disk_size
    interface = "scsi0"
  }

  # Rede
  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # Configuração Inicial (cloud-init)
  initialization {
    type           = "cloud-init"
    datastore_id   = var.storage_name
    user_account {
      username = var.vm_username
      password = var.vm_password
      keys     = [var.ssh_public_key]
    }
    ip_config {
      ipv4 {
        address = each.value.ip_config[0].ipv4.address
        gateway = each.value.ip_config[0].ipv4.gateway
      }
    }
  }

  # Dependência do template
  depends_on = [data.proxmox_virtual_environment_vm.template]
}

# Data source para buscar o template
data "proxmox_virtual_environment_vm" "template" {
  node_name = "proxmox-00"
  vm_id     = data.proxmox_virtual_environment_vms.template_ids.ids[0]
}

# Buscar todas as VMs para encontrar o template
data "proxmox_virtual_environment_vms" "template_ids" {
  node_name = "proxmox-00"
  tags      = ["template"]
}