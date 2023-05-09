Neste arquivo, definimos a configuração do ambiente virtual que será criado. Aqui está uma breve explicação das configurações:

Vagrant.configure("2") do |config|: Define a versão do Vagrant e inicia a configuração.
config.vm.box = "debian/buster64": Define a imagem base que será usada para criar o ambiente virtual.
config.vm.network "private_network", ip: "192.168.50.10": Define a rede privada e o endereço IP que será atribuído ao ambiente virtual.
config.vm.synced_folder "files/", "/var/www/html/": Define a pasta compartilhada entre o host e o ambiente virtual.
config.vm.provision "shell", path: "scripts/install-dhcp.sh": Define a instalação e configuração do servidor DHCP.
config.vm.provision "shell", path: "scripts/install-dns.sh": Define a instalação e configuração do servidor DNS.
config.vm.provision "shell", path: "scripts/install-webserver.sh": Define a instalação e configuração do servidor web Apache.
config.vm.provision "shell", inline: <<-SHELL ... SHELL: Define as configurações de firewall utilizando o iptables. O iptables-restore carrega as regras de firewall a partir do arquivo iptables.rules e iptables-persistent é usado para persistir as regras após a reinicialização do sistema.
config.vm.provider "virtualbox" do |vb| ... end: Define as configurações de virtualização do ambiente, neste caso estamos definindo a quantidade de memória que será alocada para o ambiente virtual.