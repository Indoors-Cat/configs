source /etc/profile

###EXPORT
export HISTCONTROL=ignoredups:erasedups 	#no dublicate entries
#export EDITOR="vim"				#$EDITOR use vim in terminal

### Shell Color Script ###
#colorscript -r

###ALIASES
##Arch
#pacman
#alias pac='sudo pacman -Syu'            	#update standard packages
#alias pacit='sudo pacman -S'            	#install package(s)
#alias pacrem='sudo pacman -R'           	#remove package(s)
#alias pacremall='sudo pacman -Rncs'		#remove package(s) and all dependencies
#alias pacseach='sudo pacman -Q'         	#Search for package(s)
#yay
#alias yaysua='sudo yay -Sua'            	#updates only AUR packages
#alias yayrem='sudo yay -R'              	#remove package(s)
#alias yaysearch='sudo yay -Q'           	#search for package(s)
#paru
#alias parusua='sudo paru -Sua'          	#updates only AUR packages
#alias parurem='sudo paru -R'            	#remove package(s)
#alias parusearch='sudo paru -Q'         	#search for package(s)

##Debian
#apt & apt-get
#alias up='sudo apt-get update'			#downloads updates
#alias upg='sudo apt-get upgrade'		#applies updates to system
#alias it='sudo apt install'			#install package(s)
#alias rem='sudo apt remove'			#remove package(s)
#alias atrm='sudo apt autoremove'		#autoremove no longer needed package(s)

#BSD
#alias bsdup='sudo freebsd-update fetch'     	#download system updates
#alias bsdupg='sudo freebsd-update install'  	#install updates to system
#alias upg='sudo pkg upgrade'                	#download and apply updates for package(s)
#alias pkgit='sudo pkg install'              	#install package(s)
#alias pkgrem='sudo pkg remove'              	#remove package(s)
#alias atrm='sudo pkg autoremove'            	#autoremove orphaned dependencies
#alias pkglock='sudo pkg lock'               	#lock package(s) from being removed or edited
#alias pkgulock='sudo pkg unlock'            	#unlock package(s)
#alias audit='sudo pkg audit'                	#audit package(s) for vulnerabilities and bugs
#alias auditall='sudo pkg audit -F'          	#audit all packages for vulnerabilities and bugs
#alias chshb='chsh -s /usr/local/bin/bash'   	#changes user shell to 'bash' shell (reboot required)
#alias chshf='chsh -s /usr/local/bin/fish'   	#changes user shell to 'fish' shell (reboot required)
#alias chshz='chsh -s /usr/local/bin/zsh'    	#changes user shell to 'zsh' shell (reboot required)

##navigation shortcuts
#alias ..='cd ..'				#go up one directory
#alias .2='cd../..'				#go up two directories
#alias .3='cd../../..'				#go up three directories

#Surfshark-VPN Aliases
#alias vpnup='sudo surfshark-vpn attack'        #quick connect to nearest server
#alias vpnmulti='sudo surfshark-vpn multi'      #connects to multi-hop server
#alias vpndown='sudo surfshark-vpn down'        #disconnects vpn
#alias vpnstat='sudo surfshark-vpn status'      #show vpn status
#alias vpnver='sudo surfshark-vpn version'      #show surfshark-vpn version

#'liquidctl' Aliases (Corsair Commander Pro)
#alias liqlist='sudo liquidctl list'			#list available devices
#alias liqstart='sudo liquidctl initialize'		#initialize all available device(s)
#alias liqstart='sudo liquidctl status'			#show status of available device(s)
#alias fan1start='sudo liquidctl set fan1 speed 60'	#set fan1 to 60% speed
#alias fan2start='sudo liquidctl set fan2 speed 60'	#set fan2 to 60% speed
#alias fan3start='sudo liquidctl set fan3 speed 60'	#set fan3 to 60% speed

##"cat" to "bat" swap
#alias cat='bat'                         	#use bat and not cat

##'ls' to 'exa' swap
#alias la='exa -al --color=always'		#ls listing all in list format
#alias la='ls -a --color=always'		#ls listing all
#alias ll='ls -l --color=always'		#ls list format

#General Aliases
#alias c='clear'				#clear screen
#alias h='history'				#show command history
#alias nft='neofetch'                           #neofetch
#alias rft='neofetch | lolcat'                  #rgb neofetch

##General System Tools
#alias mv='mv -i'				#interactive move of file
#alias rm='rm -i'				#interactive removing of file
#alias cp='cp -i'				#interactive copy of file
#alias df='df -h'				#show disk space in human-readable format
#alias free='free -m'				#show memory utilization in MB

#Power Commands
#alias shutdown='sudo shutdown now'
#alias reboot='sudo reboot now'

##Text Editor & Config File Aliases
#VIM ALIASES:
#alias v='vim'					#aliases for vim editor
#alias vbash='vim ~/.bashrc'			#open bashrc in vim
#alias vfish='vim ~/.config/fish/config.fish'	#open config.fish in vim
#alias vv='vim ~/.vimrc'			#open vimrc in vim
#alias vnv='vim ~/.config/nvim/init.vim'	#open neovim config file in vim
#alias vzsh='vim ~/.zshrc'			#open zshrc in vim
#NEOVIM ALIASES:
#alias vim='nvim'				#alias to replace vim with neovim
#alias nvbash='nvim ~/.bashrc'			#open bashrc in neovim
#alias nvfish='nvim ~/.config/fish/config.fish'	#open config.fish in neovim
#alias nvv='nvim ~/.vimrc'			#open vimrc in neovim
#alias nvnv='nvim ~/.config/nvim/init.vim'	#open neovim config file in neovim
#alias nvzsh='nvim ~/.zshrc'			#open zshrc in neovim

##some quality jokes
#alias cow "fortune | cowsay" 			#give randomly generated fortune with cow
#alias cowstoned "fortune | cowsay -f bong"	#give randomly generated fortune with cow smoking a bong
#alias rgbaqua "asciiquarium | lolcat"		#rainbow aquarium
#alias aqua "asciiquarium"			#aqauarium
#alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
### PROMPT

### PATH
#if [ -d "$HOME/.bin" ] ;
	  #then PATH="$HOME/.bin:$PATH"
#fi

#if [ -d "$HOME/.local/bin" ] ;
	  #then PATH="$HOME/.local/bin:$PATH"
#fi

#if [ -d "$HOME/Applications" ] ;
	  #then PATH="$HOME/Applications:$PATH"
#fi


