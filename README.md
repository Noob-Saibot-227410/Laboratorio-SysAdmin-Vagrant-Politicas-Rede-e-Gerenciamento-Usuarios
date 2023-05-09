<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<!-- Font Awesome para os ícones -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-DPgSO3CXh2Kg3R910O+qPTk6n8hW2F2lLW6qQj5VPTODz+XZsJQMI3rWsZ5+V/Q/" crossorigin="anonymous">
</head>
<body>
	<header>
		<h1>Laboratório de Políticas de Segurança e Gerenciamento de Acesso do Usuário</h1>
		<p>Este é um laboratório para aprender sobre implementação de políticas de segurança de rede e gerenciamento de acesso do usuário. Para isso, utilizamos algumas tecnologias como Vagrant, Linux, DHCP, DNS e Firewall.</p>
	</header>

<div align="center">
  <h1>Tecnologias Utilizadas</h1>
  <br>
  <img src="https://img.shields.io/badge/Curso-SysAdmin-blueviolet">
  <img src="https://img.shields.io/badge/Laboratório-2-important">
  <br>
  <br>
  <img src="https://img.shields.io/badge/Vagrant-%231563FF.svg?&style=for-the-badge&logo=vagrant&logoColor=white">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
  <img src="https://img.shields.io/badge/DHCP-5E8CC6?style=for-the-badge&logo=dhcp&logoColor=white">
  <img src="https://img.shields.io/badge/DNS-000000?style=for-the-badge&logo=dns&logoColor=white">
  <img src="https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white">
</div>

    
<main>
		<h2>Índice</h2>
		<ul>
			<li><a href="#pre-requisitos">Pré-requisitos</a></li>
			<li><a href="#instalacao">Instalação</a></li>
			<li><a href="#configuracao">Configuração</a></li>
			<li><a href="#utilizacao">Utilização</a></li>
		</ul>
		<h2 id="pre-requisitos">Pré-requisitos</h2>
		<ul>
			<li>Vagrant 2.2.18 ou superior</li>
			<li>VirtualBox 6.1.22 ou superior</li>
			<li>Conhecimentos básicos de rede e segurança</li>
		</ul>
		<h2 id="instalacao">Instalação</h2>
		<p>Para instalar o laboratório, siga os passos abaixo:</p>
		<ol>
			<li>Clone o repositório do laboratório</li>
			<li>Navegue até a pasta do laboratório no terminal</li>
			<li>Rode o comando <code>vagrant up</code> para criar a máquina virtual</li>
		</ol>
		<h2 id="configuracao">Configuração</h2>
		<p>As configurações do laboratório são feitas através de arquivos de configuração. Veja abaixo a descrição de cada arquivo:</p>
		<ul>
			<li><code>config/dhcpd.conf</code>: arquivo de configuração do servidor DHCP</li>
			<li><code>config/named.conf</code>: arquivo de configuração do servidor DNS</li>
			<li><code>config/named.conf.options</code>: arquivo de opções do servidor DNS</li>
			<li><code>config/iptables.rules</code>: arquivo de regras do Firewall</li>
		</ul>
		<h2 id="utilizacao">Utilização</h2>
<p>Após seguir os passos de instalação, você terá uma máquina virtual com as seguintes características:</p>
<ul>
	<li>Sistema operacional Ubuntu 20.04 LTS (64-bit)</li>
	<li>Servidor DHCP configurado com a rede 192.168.50.0/24</li>
	<li>Servidor DNS configurado com a zona example.com</li>
	<li>Servidor web Apache instalado e configurado com a página inicial exibindo "Hello, World!"</li>
	<li>Firewall configurado para permitir somente conexões SSH, HTTP e HTTPS</li>
</ul>
<h3>Conexão SSH</h3>
<p>Para se conectar à máquina virtual via SSH, utilize o seguinte comando:</p>
<pre><code>ssh vagrant@192.168.50.10 -p 2222</code></pre>
<p>A senha padrão do usuário vagrant é "vagrant".</p>
<h3>Acesso à internet</h3>
<p>A máquina virtual está configurada para obter um endereço IP automaticamente através do VirtualBox NAT, o que permite acesso à internet.</p>
<h3>Servidor DHCP</h3>
<p>O servidor DHCP está configurado para a rede 192.168.50.0/24, com faixa de endereços de 192.168.50.100 a 192.168.50.200. O tempo de concessão dos endereços é de 12 horas.</p>
<h3>Servidor DNS</h3>
<p>O servidor DNS está configurado com a zona example.com, que inclui os seguintes registros:</p>
<ul>
	<li>host1.example.com (192.168.50.11)</li>
	<li>host2.example.com (192.168.50.12)</li>
	<li>www.example.com (192.168.50.10)</li>
</ul>
<p>Para testar a resolução de nomes, utilize o seguinte comando:</p>
<pre><code>nslookup host1.example.com 192.168.50.10</code></pre>
<h3>Servidor web</h3>
<p>O servidor web Apache está instalado e configurado com a página inicial exibindo "Hello, World!" Para acessar a página, utilize um navegador web e digite o seguinte endereço:</p>
<pre><code>http://192.168.50.10/</code></pre>

<h3>Firewall</h3>
<p>O firewall está configurado para permitir somente conexões SSH (porta 22), HTTP (porta 80) e HTTPS (porta 443). Todas as outras conexões são bloqueadas.</p>
<h3>Serviços de rede</h3>
<p>Os seguintes serviços de rede estão configurados e em execução:</p>
<ul>
	<li><strong>DHCP</strong>: servidor DHCP configurado para fornecer endereços IP dinâmicos aos dispositivos na rede.</li>
	<li><strong>DNS</strong>: servidor DNS configurado com a zona de exemplo.com para resolução de nomes.</li>
	<li><strong>Web Server</strong>: servidor web Apache configurado para hospedar o site padrão.</li>
</ul>
<h2 id="utilizacao">Utilização</h2>
<p>Após seguir os passos de instalação, você terá uma máquina virtual com as seguintes características:</p>
<ul>
	<li>Sistema operacional: Debian 10 (Buster)</li>
	<li>Endereço IP da máquina virtual: 192.168.33.10</li>
	<li>Endereço IP da rede interna: 192.168.33.0/24</li>
	<li>Usuário padrão: vagrant</li>
	<li>Senha padrão: vagrant</li>
</ul>
<p>Para utilizar a máquina virtual, siga os seguintes passos:</p>
<ol>
	<li>Instale o <a href="https://www.vagrantup.com/downloads" target="_blank">Vagrant</a> e o <a href="https://www.virtualbox.org/wiki/Downloads" target="_blank">VirtualBox</a> na sua máquina host, caso ainda não tenha instalado.</li>
	<li>Baixe ou clone este repositório em sua máquina host.</li>
	<li>Navegue até a pasta do projeto e execute o comando <code>vagrant up</code>. O Vagrant criará a máquina virtual e executará as provisões necessárias para configurar os serviços de rede.</li>
	<li>Após a conclusão da provisão, você poderá se conectar à máquina virtual com o comando <code>vagrant ssh</code>.</li>
</ol>
<h3>Acesso aos serviços de rede</h3>
<p>Após a inicialização da máquina virtual, você poderá acessar os serviços de rede pelos seguintes endereços:</p>
<ul>
	<li><strong>Web Server</strong>: <a href="http://192.168.33.10" target="_blank">http://192.168.33.10</a></li>
	<li><strong>DNS</strong>: 192.168.33.10</li>
</ul>
<h3>Configurações adicionais</h3>
<p>Caso deseje modificar as configurações dos serviços de rede, como endereços IP, portas ou zonas DNS, você poderá editar os arquivos de configuração na pasta <code>config/</code> e, em seguida, executar o comando <code>vagrant reload</code> para atualizar as configurações da máquina virtual.</p>
<h3>Desligar a máquina virtual</h3>
<p>Para desligar a máquina virtual, execute o comando <code>vagrant halt</code> na pasta do projeto. Para excluí-la completamente, execute o comando <code>vagrant destroy</p>

<h2 id="conclusao">Conclusão</h2>
<p>Neste laboratório, foi possível aprender sobre a implementação de políticas de segurança de rede e gerenciamento de acesso do usuário utilizando tecnologias como DHCP, DNS, firewall e gerenciamento de usuários.</p>
<p>Esses conhecimentos são fundamentais para qualquer profissional de segurança da informação e administração de sistemas, já que a segurança de uma rede é uma das maiores preocupações em qualquer ambiente corporativo.</p>
<p>Com o uso do Vagrant, foi possível criar um ambiente virtualizado de forma rápida e prática, facilitando a reprodução do ambiente em diferentes máquinas.</p>
<p>Espero que este laboratório tenha sido útil para o seu aprendizado e desenvolvimento na área de segurança da informação e administração de sistemas.</p>

