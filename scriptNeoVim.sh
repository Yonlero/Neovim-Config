#!/bin/bash

#Pegando tipo de sistema
systemname=$(hostnamectl | awk 'NR == 6 {print $3}')
#Verificando sistema
case $systemname in
	#case 'Fedora'
	'Fedora') sudo yum install neovim ;;

	#case 'Ubuntu'
	'Ubuntu') sudo apt install neovim -y ;;

	#case 'Pop OS'
	'Pop!_OS') sudo apt install neovim -y ;;
esac

#Criando pasta de configurações do neovim
mkdir /home/$USER/.config/nvim
#Criando arquivo de configurações
touch /home/$USER/.config/nvim/init.vim

#Criando pasta de Plugins manualmente para evitar erros
mkdir /home/$USER/.config/nvim/autoload

#Baixando plugin gerenciador
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Movendo arquivo de configurações
cp init.vim /home/$USER/.config/nvim/

#Instalando plugins
nvim +PlugInstall

#Instalando Intelephense das linguagens
nvim -c 'CocInstall coc-json coc-html coc-tsserver coc-phpls coc-python coc-sql'
