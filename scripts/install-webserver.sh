#!/bin/bash

# Atualiza a lista de pacotes
apt update

# Instala o servidor web Apache
apt install -y apache2

# Copia o arquivo de configuração iptables.rules para a pasta /etc/
cp /vagrant/config/iptables.rules /etc/

# Copia a página HTML de exemplo para a pasta /var/www/html/
cp /vagrant/files/index.html /var/www/html/

# Reinicia o serviço do Apache
systemctl restart apache2.service

# Habilita o firewall
iptables-restore < /etc/iptables.rules
