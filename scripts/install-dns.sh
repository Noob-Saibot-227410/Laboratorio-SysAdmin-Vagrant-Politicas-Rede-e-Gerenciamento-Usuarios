#!/bin/bash

# Atualiza a lista de pacotes
apt update

# Instala o servidor DNS
apt install -y bind9

# Copia os arquivos de configuração named.conf e named.conf.options para a pasta /etc/bind/
cp /vagrant/config/named.conf /etc/bind/
cp /vagrant/config/named.conf.options /etc/bind/

# Copia a zona de exemplo example.com.zone para a pasta /etc/bind/
cp /vagrant/files/example.com.zone /etc/bind/

# Reinicia o serviço DNS
systemctl restart bind9.service
