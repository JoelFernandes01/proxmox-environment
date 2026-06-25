proxmox_endpoint = "https://proxmox-00.connect.local:8006/api2/json"
proxmox_api_token = "terraform@pam!terraform=a08bbfd5-e7b9-4fce-9544-9165b29fe61e"
vm_username = "connect"
vm_password = "connect2026"
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBojwLtvrf/o9+uQPdBUiBKACIGxMEhazCQs7VLjSf0K joel_fernandes@hotmail.com"
storage_name = "storage-vms"

vm_list = [
  {
    name      = "zabbix"
    hostname  = "zabbix.connect.local"
    vmid      = 100
    cores     = 2
    memory    = 4096
    ip_config = [
      {
        ipv4 = {
          address = "192.168.1.10/24"
          gateway = "192.168.1.1"
        }
      }
    ]
  },
  {
    name      = "glpi"
    hostname  = "glpi.connect.local"
    vmid      = 101
    cores     = 2
    memory    = 4096
    ip_config = [
      {
        ipv4 = {
          address = "192.168.1.11/24"
          gateway = "192.168.1.1"
        }
      }
    ]
  }
]