# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/buster64"

  # Configura a rede do VM
  config.vm.network "private_network", ip: "192.168.50.10"

  # Configura as pastas compartilhadas
  config.vm.synced_folder "files/", "/var/www/html/"

  # Define as configurações de provisionamento
  config.vm.provision "shell", path: "scripts/install-dhcp.sh"
  config.vm.provision "shell", path: "scripts/install-dns.sh"
  config.vm.provision "shell", path: "scripts/install-webserver.sh"

  # Define as configurações de firewall
  config.vm.provision "shell", inline: <<-SHELL
    sudo iptables-restore < /vagrant/config/iptables.rules
    sudo apt-get install iptables-persistent -y
    sudo systemctl enable netfilter-persistent
  SHELL

  # Define as configurações de virtualização
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
  end
end
