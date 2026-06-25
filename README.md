# Como usar Terraform no Proxmox VE para automatizar criação de sua infraestrutura de máquinas virtuais

## 📚 Documentação por Componente

## 🚀 Cenários Utilizados

### 1. Cenário proposto
- **Proxmox:** Versão 9.x
- **FQDN:** proxmox-00.connect.local
- **Sistema das máquinas virtuais:** Ubuntu Server 26.04
- **FQDN:** zabbix.connect.local e grafana.connect.local
- 📄 [Guia de Instalação do Zabbix →](Zabbix/zabbix.md)
- 📄 [Guia de Configuração do Grafana →](Zabbix/grafana.md)

## 🔗 Integração

- 📄 [Guia de como integrar Zabbix com GLPI](GLPI/integracao.md)


## Se acaso não conseguir acesso via terraform init
```bash
export TF_HTTP_MAX_RETRIES=5
export TF_REGISTRY_CLIENT_TIMEOUT=120
```