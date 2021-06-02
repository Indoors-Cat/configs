source /etc/profile

###EXPORT
export HISTCONTROL=ignoredups:erasedups 	#no dublicate entries
#export EDITOR="vim"				#$EDITOR use vim in terminal

### Shell Color Script ###
#colorscript -r

###ALIASES
##Arch:
#pacman
#alias pac='sudo pacman -Syu'            	#Update standard packages
#alias pacit='sudo pacman -S'            	#Install package(s)
#alias pacrem='sudo pacman -R'           	#Remove package(s)
#alias pacremall='sudo pacman -Rncs'		#Remove package(s) and all dependencies
#alias pacseach='sudo pacman -Q'         	#Search for package(s)
#yay
#alias yaysua='sudo yay -Sua'            	#Updates only AUR packages
#alias yayrem='sudo yay -R'              	#Remove package(s)
#alias yaysearch='sudo yay -Q'           	#Search for package(s)
#paru
#alias parusua='sudo paru -Sua'          	#Updates only AUR packages
#alias parurem='sudo paru -R'            	#Remove package(s)
#alias parusearch='sudo paru -Q'         	#Search for package(s)

##Debian:
#apt & apt-get
#alias up='sudo apt-get update'			#Downloads updates
#alias upg='sudo apt-get upgrade'		#Applies updates to system
#alias it='sudo apt install'			#Install package(s)
#alias rem='sudo apt remove'			#Remove package(s)
#alias atrm='sudo apt autoremove'		#Autoremove no longer needed package(s)

#BSD:
#alias bsdup='sudo freebsd-update fetch'     	#Download system updates
#alias bsdupg='sudo freebsd-update install'  	#Install updates to system
#alias upg='sudo pkg upgrade'                	#Download and apply updates for package(s)
#alias pkgit='sudo pkg install'              	#Install package(s)
#alias pkgrem='sudo pkg remove'              	#Remove package(s)
#alias atrm='sudo pkg autoremove'            	#Autoremove orphaned dependencies
#alias pkglock='sudo pkg lock'               	#Lock package(s) from being removed or edited
#alias pkgulock='sudo pkg unlock'            	#Unlock package(s)
#alias audit='sudo pkg audit'                	#Audit package(s) for vulnerabilities and bugs
#alias auditall='sudo pkg audit -F'          	#Audit all packages for vulnerabilities and bugs
#alias chshb='chsh -s /usr/local/bin/bash'   	#Changes user shell to 'bash' shell (reboot required)
#alias chshf='chsh -s /usr/local/bin/fish'   	#Changes user shell to 'fish' shell (reboot required)
#alias chshz='chsh -s /usr/local/bin/zsh'    	#Changes user shell to 'zsh' shell (reboot required)

##navigation shortcuts:
#alias ..='cd ..'				#Go up one directory
#alias .2='cd ../..'				#Go up two directories
#alias .3='cd ../../..'				#Go up three directories

#Surfshark-VPN Aliases:
#alias vpnup='sudo surfshark-vpn attack'        #Quick connect to nearest server
#alias vpnmulti='sudo surfshark-vpn multi'      #Connects to multi-hop server
#alias vpndown='sudo surfshark-vpn down'        #Disconnects vpn
#alias vpnstat='sudo surfshark-vpn status'      #Show vpn status
#alias vpnver='sudo surfshark-vpn version'      #Show surfshark-vpn version

#'liquidctl' Aliases (Corsair Commander Pro):
#alias liqlist='sudo liquidctl list'			#List available devices
#alias liqstart='sudo liquidctl initialize'		#Initialize all available device(s)
#alias liqstart='sudo liquidctl status'			#Show status of available device(s)
#alias fan1start='sudo liquidctl set fan1 speed 60'	#Set fan1 to 60% speed
#alias fan2start='sudo liquidctl set fan2 speed 60'	#Set fan2 to 60% speed
#alias fan3start='sudo liquidctl set fan3 speed 60'	#Set fan3 to 60% speed

##"cat" to "bat" swap:
#alias cat='bat'                         	#Use bat and not cat

##'ls' to 'exa' swap:
#alias la='exa -al --color=always'		#Ls listing all in list format
#alias la='ls -a --color=always'		#Ls listing all
#alias ll='ls -l --color=always'		#Ls list format

#General Aliases:
#alias c='clear'				#lear screen
#alias h='history'				#Show command history
#alias nft='neofetch'                           #Neofetch
#alias rft='neofetch | lolcat'                  #Rgb neofetch

##General System Tools:
#alias mv='mv -i'				#Interactive move of file
#alias rm='rm -i'				#Interactive removing of file
#alias cp='cp -i'				#Interactive copy of file
#alias df='df -h'				#Show disk space in human-readable format
#alias free='free -m'				#Show memory utilization in MB

##Power Commands:
#Linux Power Commands:
#alias shutdown='sudo shutdown now'		#Shutdown system
#alias reboot='sudo reboot now'			#Reboot system
##BSD Commands:
#alias shutdown='sudo poweroff'			#Shutdown system
#alias reboot='sudo init 6'			#Reboot system

##Text Editor & Config File Aliases
#VIM ALIASES:
#alias v='vim'					#Aliases for vim editor
#alias vbash='vim ~/.bashrc'			#Open bashrc in vim
#alias vfish='vim ~/.config/fish/config.fish'	#Open config.fish in vim
#alias vv='vim ~/.vimrc'			#Open vimrc in vim
#alias vnv='vim ~/.config/nvim/init.vim'	#Open neovim config file in vim
#alias vzsh='vim ~/.zshrc'			#Open zshrc in vim
#NEOVIM ALIASES:
#alias vim='nvim'				#Alias to replace vim with neovim
#alias nvbash='nvim ~/.bashrc'			#Open bashrc in neovim
#alias nvfish='nvim ~/.config/fish/config.fish'	#Open config.fish in neovim
#alias nvv='nvim ~/.vimrc'			#Open vimrc in neovim
#alias nvnv='nvim ~/.config/nvim/init.vim'	#Open neovim config file in neovim
#alias nvzsh='nvim ~/.zshrc'			#Open zshrc in neovim

##some quality jokes:
#alias cow "fortune | cowsay" 			#Give randomly generated fortune with cow
#alias cowstoned "fortune | cowsay -f bong"	#Give randomly generated fortune with cow smoking a bong
#alias rgbaqua "asciiquarium | lolcat"		#Rainbow aquarium
#alias aqua "asciiquarium"			#Aqauarium
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


