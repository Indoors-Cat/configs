source /etc/profile

###EXPORT
export HISTCONTROL=ignoredups:erasedups 	#no dublicate entries
export EDITOR="vim"				#$EDITOR use vim in terminal

### Shell Color Script ###
colorscript -r

###ALIASES
##Arch
#pacman
alias pac='sudo pacman -Syu'            	#update standard packages
alias pacit='sudo pacman -S'            	#install package(s)
alias pacrem='sudo pacman -R'           	#remove package(s)
alias pacremall='sudo pacman -Rncs'		#remove package(s) and all dependencies
alias pacseach='sudo pacman -Q'         	#Search for package(s)
#yay
alias yaysua='sudo yay -Sua'            	#updates only AUR packages
alias yayrem='sudo yay -R'              	#remove package(s)
alias yaysearch='sudo yay -Q'           	#search for package(s)
#paru
alias parusua='sudo paru -Sua'          	#updates only AUR packages
alias parurem='sudo paru -R'            	#remove package(s)
alias parusearch='sudo paru -Q'         	#search for package(s)

##Debian
#apt & apt-get
alias up='sudo apt-get update'			#downloads updates
alias upg='sudo apt-get upgrade'		#applies updates to system
alias it='sudo apt install'			#install package(s)
alias rem='sudo apt remove'			#remove package(s)
alias atrm='sudo apt autoremove'		#autoremove no longer needed package(s)

##navigation shortcuts
alias ..='cd ..'				#go up one directory
alias .2='cd../..'				#go up two directories
alias .3='cd../../..'				#go up three directories

#Surfshark-VPN Aliases
alias vpnup "sudo surfshark-vpn attack"         #quick connect to nearest server
alias vpnmulti "sudo surfshark-vpn multi"       #connects to multi-hop server
alias vpndown "sudo surfshark-vpn down"         #disconnects vpn
alias vpnstat "sudo surfshark-vpn status"       #show vpn status
alias vpnver "sudo surfshark-vpn version"       #show surfshark-vpn version

##"cat" to "bat" swap
alias cat='bat'                         	#use bat and not cat

##'ls' to 'exa' swap
alias la='exa -al --color=always'		#ls listing all in list format
alias la='ls -a --color=always'			#ls listing all
alias ll='ls -l --color=always'			#ls list format

#General Aliases
alias c='clear'					#clear screen
alias h='history'				#show command history
alias nft='neofetch'                            #neofetch
alias rft='neofetch | lolcat'                   #rgb neofetch

##General System Tools
alias mv='mv -i'				#interactive move of file
alias rm='rm -i'				#interactive removing of file
alias cp='cp -i'				#interactive copy of file
alias df='df -h'				#show disk space in human-readable format
alias free='free -m'				#show memory utilization in MB

#Power Commands
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot now'

##Text Editor & Config File Aliases
#vim aliases:
alias v='vim'
alias vbash='vim ~/.bashrc'
alias vfish='vim ~/.config/fish/config.fish'
alias vv='vim ~/.vimrc'
#alias vnv='vim ~/.config/nvim/init.vim'
#alias vzsh='vim ~/.zshrc'
#nvim aliases:
#alias vim='nvim'
#alias nvbash='nvim ~/.bashrc'
#alias nvfish='nvim ~/.config/fish/config.fish'
#alias nvv='nvim ~/.vimrc'
#alias nvnv='nvim ~/.config/nvim/init.vim'
#alias nvzsh='nvim ~/.zshrc'

##some quality jokes
alias cow "fortune | cowsay" 			#give randomly generated fortune with cow
alias cowstoned "fortune | cowsay -f bong"	#give randomly generated fortune with cow smoking a bong
alias rgbaqua "asciiquarium | lolcat"		#rainbow aquarium
alias aqua "asciiquarium"			#aqauarium
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
### PROMPT
# This is commented out if using starship prompt
# PS1='[\u@\h \W]\$ '

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


