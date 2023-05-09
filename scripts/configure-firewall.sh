#!/bin/bash

# Limpa as regras atuais
iptables -F
iptables -X

# Define política padrão DROP para input, forward e output
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Permite tráfego na interface loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Permite conexões SSH
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# Permite conexões HTTP e HTTPS
iptables -A INPUT -p tcp -m multiport --dports 80,443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 80,443 -m state --state ESTABLISHED -j ACCEPT

# Permite conexões DNS
iptables -A INPUT -p udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp --sport 53 -m state --state ESTABLISHED -j ACCEPT

# Permite conexões DHCP
iptables -A INPUT -p udp --dport 67:68 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp --sport 67:68 -m state --state ESTABLISHED -j ACCEPT

# Permite tráfego ICMP (ping)
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

# Salva as regras de firewall para persistência após a reinicialização
iptables-save > /etc/iptables/rules.v4