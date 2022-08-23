#!/bin/bash
# Autor: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Data de criação: 25/08/2021
# Data de atualização: 22/08/2022
# Versão: 0.06
# Testado e homologado para a versão do Linux Mint 20.1 Ulyssa, 20.2 Uma e 20.3 Una x64
# Testado e homologado para a versão do Arduino IDE v2.0.x e Fritzing v0.9.x
#
# Arduino é uma plataforma de prototipagem eletrônica de hardware livre e de placa única, 
# projetada com um microcontrolador Atmel AVR com suporte de entrada/saída embutido, uma 
# linguagem de programação padrão, a qual tem origem em Wiring, e é essencialmente C/C++.
#
# Arduino Integrated Development Environment IDE é uma aplicação de plataforma cruzada, 
# escrito em funções de C e C ++. É usado para escrever e fazer upload de programas em 
# placas compatíveis com Arduino, mas também, com a ajuda de núcleos de terceiros, outras 
# placas de desenvolvimento de fornecedores.
#
# A nova versão principal do IDE do Arduino é mais rápida e ainda mais poderosa! Além de 
# um editor mais moderno e uma interface mais ágil, possui preenchimento automático, 
# navegação de código e até mesmo um depurador ao vivo.
#
# O Fritzing é uma iniciativa de código aberto para desenvolver um software tipo CAD amador 
# para design de hardware eletrônico, para apoiar designers e artistas prontos para deixar 
# de experimentar um protótipo e construir um circuito mais permanente com uma Placa de 
# Circuito Impresso. 
#
# Site Oficial do Arduino IDE: https://www.arduino.cc/
# Projeto do Github do Arduino IDE 2.x: https://github.com/arduino/arduino-ide
# Site Oficial do Fritzing: https://fritzing.org/
#
# Vídeo de instalação da versão do Arduino IDE 1.8.x: https://www.youtube.com/watch?v=n9cRUE3io-Q
#
# OBSERVAÇÃO IMPORTANTE: Nesse vídeo utilizei os conceitos do Git para clonar o projeto no Linux Mint
# Ctrl+Alt+t (Atalho do Terminal)
#		git clone https://github.com/vaamonde/arduino
#			cd arduino/
#				bash install20.sh
#
# Terminal
#		arduino-20
#
# Arduino IDE 2.0.x
#	Tools
#		Board "Arduino Uno"
#		Port: "/dev/ttyACM0"
#		Get Board Info
#
# File
#	Examples
#		01. Basics
#			Blink
#				Upload
#
# Variável da Data Inicial para calcular o tempo de execução do script (VARIÁVEL MELHORADA)
# opção do comando date: +%T (Time)
HORAINICIAL=$(date +%T)
#
# Variável do usuário local que vai executar o Arduino IDE
# opção da variável de ambiente USER: usuário atual logado no sistema 
USUARIO=$(echo $USER)
#
# Variável do caminho do Log dos Script utilizado nesse curso (VARIÁVEL MELHORADA)
# opção do shell script: piper | = Conecta a saída padrão com a entrada padrão de outro comando
# opção do shell script: aspas simples ' ' = Protege uma string completamente (nenhum caractere é especial)
# opção do shell script: aspas duplas " " = Protege uma string, mas reconhece $, \ e ` como especiais
# opções do comando cut: -d (delimiter), -f (fields)
# opção da variável de ambiente $0: nome do comando ou script digitado
LOG="$HOME/$(echo $0 | cut -d'/' -f2)"
#
# Declarando as variáveis de download do Arduino IDE e do Fritzing (Links atualizados no dia 22/08/2022)
ARDUINO="https://downloads.arduino.cc/arduino-ide/arduino-ide_2.0.0-rc9.2_Linux_64bit.zip"
FRITZING="https://github.com/fritzing/fritzing-parts.git"
AGENTFIREFOX="https://github.com/arduino/arduino-create-agent/releases/download/1.2.6/ArduinoCreateAgent-1.2.6-linux-amd64-installer-firefox.run"
AGENTCHROME="https://github.com/arduino/arduino-create-agent/releases/download/1.2.6/ArduinoCreateAgent-1.2.6-linux-amd64-installer-chrome.run"
#
# Script de instalação do Arduino IDE 2.0.x e do Fritzing no Linux Mint 20.1 Ulyssa, 20.2 Uma ou 20.3 Una 
# opção do comando echo: -e (enable interpretation of backslash escapes), \n (new line)
# $0 (variável de ambiente do nome do comando)
# opção do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
echo -e "Início do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
clear
#
echo
echo -e "Instalação do Arduino IDE 2.x e do Fritzing no Linux Mint 20.x\n"
echo -e "Após a instalação do Arduino IDE digitar no console: arduino-20"
echo -e "Após a instalação do Fritzing localizar na busca indexada por: Fritzing.\n"
echo -e "Aguarde, esse processo demora um pouco dependendo do seu Link de Internet...\n"
echo -e "Será necessário digitar a senha do seu usuário: $USUARIO que tem direitos administrativos do sudo.\n"
sleep 5
#
echo -e "Atualizando o Sources List do Apt, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	sudo apt update &>> $LOG
echo -e "Listas atualizadas com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Atualizando o sistema operacional, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando apt: -y (yes)
	sudo apt upgrade -y &>> $LOG
	sudo apt full-upgrade -y &>> $LOG
	sudo apt dist-upgrade -y &>> $LOG
echo -e "Sistema atualizado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando as dependências desse script, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando apt: -y (yes)
	sudo apt install -y members git vim unzip &>> $LOG
echo -e "Dependências instaladas com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Removendo os software desnecessários, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando apt: -y (yes)
	sudo apt autoremove -y &>> $LOG
	sudo apt autoclean -y &>> $LOG
echo -e "Software desnecessários removidos com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Arduino IDE 2.x e do Fritzing, aguarde...\n"
#
echo -e "Verificando a conexão com a Porta TTY (USB) do Arduino, aguarde..."
# opção do bloco de agrupamento "": Protege uma string, mas reconhece $, \ e ` como especiais
# opção do bloco de agrupamento $(): Executa comandos numa subshell, retornando o resultado
# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
# opção do redirecionar |: Conecta a saída padrão com a entrada padrão de outro comando
# opção do operador ; (ponto e vírgula): operador que executa vários comandos em sucessão
# opção da variável de ambiente $?: Código de retorno do último comando executado
# opção do operador relacional ==: Igual
if [ "$(sudo lsusb | grep Arduino &>> $LOG ; echo $?)" == "0" ]
	then
		echo -e "Arduino: $(sudo lsusb | grep Arduino)"
		echo -e "Arduino está conectado na Porta USB do seu computador, Pressione <Enter> para continuar.\n"
		read
		sleep 5
	else
		echo -e "Arduino não está conectado na Porta USB, conecte o Arduino ou verifique a porta"
		echo -e "USB ou cabo USB, execute novamente esse script."
		exit 1
fi
#
echo -e "Verificando a conexão com a Porta Dialout do Arduino, aguarde..."
# opção do bloco de agrupamento "": Protege uma string, mas reconhece $, \ e ` como especiais
# opção do bloco de agrupamento $(): Executa comandos numa subshell, retornando o resultado
# opção do comando ls: -l (listing), -h (human-readable)
# opção do redirecionador >: Redireciona a saída padrão (STDOUT)
# opção do operador ; (ponto e vírgula): operador que executa vários comandos em sucessão
# opção da variável de ambiente $?: Código de retorno do último comando executado
# opção do operador relacional ==: Igual
# opção do caractere curinga *: Qualquer coisa
if [ "$(sudo ls -lh /dev/ttyA* &>> $LOG ; echo $?)" == "0" ]
	then
		echo -e "Conexão Dialout: $(sudo ls -lh /dev/ttyACM*)"
		echo -e "Conexão com a Porta Dialout do Arduino verificada com sucesso!!!, continuando com o script...\n"
		#
		echo -e "Alterando as permissões da Porta Dialout para todos os usuários, aguarde..."
		# opção do comando chmod: -v (verbose) a (all users), + (added), r (read), w (write)
		# opção do comando ls: -l (listing), -h (human-readable)
		# opção do caractere curinga *: Qualquer coisa
		echo -e "Permissões: $(sudo chmod -v a+rw /dev/ttyACM*)"
		echo -e "Permissões alteradas com sucesso!!!, Pressione <Enter> para continuar.\n"
		read
		sleep 5
	else
		echo -e "Conexão com a Porta Dialout do Arduino não está disponível, verifique se você conectou"
		echo -e "corretamente o Arduino na Porta USB, conecte o Arduino ou verifique o cabo USB, execute"
		echo -e "novamente esse script."
		exit 1
fi
#
echo -e "Verificando o grupo de acesso ao Dialout do Arduino, aguarde..."
# opção do bloco de agrupamento "": Protege uma string, mas reconhece $, \ e ` como especiais
# opção do bloco de agrupamento $(): Executa comandos numa subshell, retornando o resultado
# opção do redirecionar |: Conecta a saída padrão com a entrada padrão de outro comando
# opção do redirecionador >: Redireciona a saída padrão (STDOUT)
# opção do operador ; (ponto e vírgula): operador que executa vários comandos em sucessão
# opção da variável de ambiente $?: Código de retorno do último comando executado
# opção do operador relacional ==: Igual
if [ "$(sudo cat /etc/group | grep dialout &>> $LOG ; echo $?)" == "0" ]
	then
		echo -e "Grupo Dialout: $(sudo cat /etc/group | grep dialout)"
		echo -e "Grupo de acesso ao Dialout do Arduino verificado com sucesso!!!, continuando com o script....\n"
		sleep 5
		#
		echo -e "Verificando os Membros efetivos dos grupos Dialout e Plugdev, aguarde..."
		# opção do comando members: -a (all)
		echo -e "Grupo Dialout: $(sudo members -a dialout)"
		echo -e "Grupo Plugdev: $(sudo members -a plugdev)"
		echo -e "Membros efetivos dos grupos Dialout e Plugdev verificado com sucesso!!!, continuando com o script....\n"
		sleep 5
		#
		echo -e "Adicionando o usuário local: $USUARIO nos grupos: Dialout, Plugdev, TTY e UUCP, aguarde..."
		# opção do comando usermod: -a (append), -G (groups)
		# opção do comando members: -a (all)
		sudo usermod -a -G dialout $USUARIO
		sudo usermod -a -G plugdev $USUARIO
		sudo usermod -a -G tty $USUARIO
		sudo usermod -a -G uucp $USUARIO
		echo -e "Grupo Dialout: $(sudo members -a dialout)"
		echo -e "Grupo Plugdev: $(sudo members -a plugdev)"
		echo -e "Grupo TTY: $(sudo members -a tty)"
		echo -e "Grupo UUCP: $(sudo members -a uucp)"
		echo -e "Usuário $USUARIO: $(id)"
		echo -e "Usuário adicionado nos grupos com sucesso!!!, Pressione <Enter> para continuar.\n"
		read
		sleep 5
	else
		echo -e "Grupo de Dialout do Arduino não está disponível, verifique se você conectou corretamente o"
		echo -e "Arduino na Porta USB, conecte o Arduino ou verifique o cabo USB, execute novamente esse script."
		exit 1
fi
#
echo -e "Fazendo o download do Arduino IDE 2.x do site Oficial, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando wget: -v (verbose), -O (output-document)
	sudo wget -v -O /tmp/arduino20.zip $ARDUINO &>> $LOG
echo -e "Download do Arduino IDE 2.x do site Oficial feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Fazendo o download do Arduino Agent Cloud do site Oficial, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando wget: -v (verbose), -O (output-document)
	# opção do comando chmod: -v (verbose), +x (execution)
	sudo wget -v -O /tmp/firefox.run $AGENTFIREFOX &>> $LOG
	sudo wget -v -O /tmp/chrome.run $AGENTCHROME &>> $LOG
	sudo chmod -v +x /tmp/*.run &>> $LOG
echo -e "Download do Arduino Agent Cloud do site Oficial feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Descompactando o Arduino IDE 2.x no diretório: /opt/arduino20, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando mv: -v (verbose)
	cd /tmp
		sudo unzip arduino20.zip &>> $LOG
		sudo mv -v arduino-*/ /opt/arduino20 &>> $LOG
	cd - &>> $LOG
echo -e "Descompactação do Arduino IDE 2.x no diretório /opt/arduino20 feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Arduino Agent Cloud Firefox, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando mv: -v (verbose)
	cd /tmp
		./firefox.run
	cd - &>> $LOG
echo -e "Instalando o Arduino Agent Cloud Firefox feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Arduino Agent Cloud Google Chrome, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando mv: -v (verbose)
	cd /tmp
		./chrome.run
	cd - &>> $LOG
echo -e "Instalando o Arduino Agent Cloud Google Chrome feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Criando o Link Simbólico do Arduino IDE 2.x no diretório: /bin, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando ln: -s (symbolic), -v (verbose)
	# opção do comando cp: -R (recursive), -f (force), -v (verbose)
	sudo ln -sv /opt/arduino20/arduino-ide /bin/arduino-20 &>> $LOG
	sudo cp -Rfv icons/ /opt/arduino20/ &>> $LOG
echo -e "Link Simbólico do Arduino IDE 2.x feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalando o Fritzing, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	# opção do comando apt: -y (yes)
	sudo apt install -y fritzing &>> $LOG
echo -e "Instalação do Fritzing feito com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Clonando o projeto do Fritzing Parts do Github, aguarde..."
	# opção do redirecionador &>>: Redireciona a saída padrão (STDOUT) anexando
	sudo git clone $FRITZING /usr/share/fritzing/parts &>> $LOG
echo -e "Projeto do Fritzing Parts clonado com sucesso!!!, continuando com o script...\n"
sleep 5
#
echo -e "Instalação do ArduinoIDE 2.x e do Fritzing feita com Sucesso!!!."
	# script para calcular o tempo gasto (SCRIPT MELHORADO, CORRIGIDO FALHA DE HORA:MINUTO:SEGUNDOS)
	# opção do comando date: +%T (Time)
	HORAFINAL=$(date +%T)
	# opção do comando date: -u (utc), -d (date), +%s (second since 1970)
	HORAINICIAL01=$(date -u -d "$HORAINICIAL" +"%s")
	HORAFINAL01=$(date -u -d "$HORAFINAL" +"%s")
	# opção do comando date: -u (utc), -d (date), 0 (string command), sec (force second), +%H (hour), %M (minute), %S (second), 
	TEMPO=$(date -u -d "0 $HORAFINAL01 sec - $HORAINICIAL01 sec" +"%H:%M:%S")
	# $0 (variável de ambiente do nome do comando)
	echo -e "Tempo gasto para execução do script $0: $TEMPO"
echo -e "Pressione <Enter> para concluir o processo."
# opção do comando date: + (format), %d (day), %m (month), %Y (year 1970), %H (hour 24), %M (minute 60)
echo -e "Fim do script $0 em: $(date +%d/%m/%Y-"("%H:%M")")\n" &>> $LOG
read
exit 1
