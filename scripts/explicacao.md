install-dhcp.sh
Esse script é responsável por instalar e configurar o servidor DHCP.

---

Explicações:

O script começa atualizando a lista de pacotes com o comando apt update.
Depois, o servidor DHCP é instalado com o comando apt install -y isc-dhcp-server.
Em seguida, o arquivo de configuração dhcpd.conf é copiado da pasta /vagrant/config/ para a pasta /etc/dhcp/ com o comando cp /vagrant/config/dhcpd.conf /etc/dhcp/.
Por fim, o serviço do servidor DHCP é reiniciado com o comando systemctl restart isc-dhcp-server.service.
install-dns.sh
Esse script é responsável por instalar e configurar o servidor DNS.

---

Explicações:

O script começa atualizando a lista de pacotes com o comando apt update.
Depois, o servidor DNS é instalado com o comando apt install -y bind9.
Em seguida, os arquivos de configuração named.conf e named.conf.options são copiados da pasta /vagrant/config/ para a pasta /etc/bind/ com os comandos cp /vagrant/config/named.conf /etc/bind/ e cp /vagrant/config/named.conf.options /etc/bind/.
Além disso, a zona de exemplo example.com.zone é copiada da pasta /vagrant/files/ para a pasta /etc/bind/ com o comando cp /vagrant/files/example.com.zone /etc/bind/.
Por fim, o serviço do servidor DNS é reiniciado com o comando systemctl restart bind9.service.
install-webserver.sh
Esse script é responsável por instalar e configurar o servidor web Apache.

---

O arquivo configure-firewall.sh é um script bash utilizado para configurar as regras de firewall do sistema utilizando o iptables. O código completo com as explicações dentro do código está abaixo:

---

No início do script, as regras atuais são limpas com os comandos "iptables -F" e "iptables -X". A política padrão é definida como DROP para input, forward e output, o que significa que todo o tráfego será bloqueado, a menos que seja explicitamente permitido pelas regras subsequentes.

A seguir, o tráfego na interface loopback é permitido com as regras "iptables -A INPUT -i lo -j ACCEPT" e "iptables -A OUTPUT -o lo -j ACCEPT".

As conexões SSH são permitidas com as regras "iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT" e "iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT".

As conexões HTTP e HTTPS são permitidas com as regras "iptables -A INPUT -p tcp -m multiport --dports 80,443 -m state --state NEW,ESTABLISHED -j ACCEPT" e "iptables -A OUTPUT -p tcp -m multiport --sports 80,443 -m state --state ESTABLISHED -j ACCEPT".

As conexões DNS são permitidas com as regras "iptables -A INPUT -p udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT" e "iptables -A OUTPUT -p udp --sport 53 -m state --state ESTABLISHED -j ACCEPT".

As conexões DHCP, Por padrão, as conexões DHCP são permitidas pelo firewall. As seguintes regras são adicionadas ao script configure-firewall.sh para permitir as conexões DHCP:

# Permitir conexões DHCP

iptables -A INPUT -p udp --dport 67:68 --sport 67:68 -j ACCEPT
iptables -A OUTPUT -p udp --dport 67:68 --sport 67:68 -j ACCEPT
A primeira regra permite o tráfego UDP nas portas de origem 67 e 68 e portas de destino 67 e 68, que são usadas pelo protocolo DHCP. A segunda regra faz o mesmo para o tráfego de saída.

