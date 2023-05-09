#!/bin/bash

# Atualiza a lista de pacotes
apt update

# Instala o servidor DHCP
apt install -y isc-dhcp-server

# Copia o arquivo de configuração dhcpd.conf para a pasta /etc/dhcp/
cp /vagrant/config/dhcpd.conf /etc/dhcp/

# Reinicia o serviço DHCP
systemctl restart isc-dhcp-server.service
