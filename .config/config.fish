#This is a configuration file for the fish shell
# __  __           _____ _     _         ____             __ _
#|  \/  |_   _    |  ___(_)___| |__     / ___|___  _ __  / _(_) __ _
#| |\/| | | | |   | |_  | / __| '_ \   | |   / _ \| '_ \| |_| |/ _` |
#| |  | | |_| |   |  _| | \__ \ | | |  | |__| (_) | | | |  _| | (_| |
#|_|  |_|\__, |___|_|   |_|___/_| |_|___\____\___/|_| |_|_| |_|\__, |
#        |___/_____|               |_____|                     |___/
#

set fish_greeting                                   #disables fish greeting
set TERMINAL "alacritty"                            #Sets terminal type

### Color Script ###
colorscript random

##ALIASES
##Arch
#pacman
#alias pac "sudo pacman -Syu"            	#update standard packages
#alias pacit "sudo pacman -S"           	#install package(s)
#alias pacrem "sudo pacman -R"           	#remove package(s)
#alias pacremall "sudo pacman -Rncs"		#remove package(s) and all dependencies
#alias pacseach "sudo pacman -Q"         	#Search for package(s)
#yay
#alias yaysua "sudo yay -Sua"            	#updates only AUR packages
#alias yayrem "sudo yay -R"              	#remove package(s)
#alias yaysearch "sudo yay -Q"           	#search for package(s)
#paru
#alias parusua "sudo paru -Sua"          	#updates only AUR packages
#alias parurem "sudo paru -R"            	#remove package(s)
#alias parusearch "sudo paru -Q"         	#search for package(s)

##Debian
#apt & apt-get
#alias up "sudo apt-get update"			#downloads updates
#alias upg "sudo apt-get upgrade"		#applies updates to system
#alias it "sudo apt install"			#install package(s)
#alias rem "sudo apt remove"			#remove package(s)
#alias atrm "sudo apt autoremove"		#autoremove no longer needed package(s)

##BSD
#alias upg "sudo pkg upgrade"                   
#alias pkgit "sudo pkg install"
#alias pkgrem "sudo pkg remove"
#alias atrm "sudo pkg autoremove"

#Navigation
alias .. "cd .."				    #go up one directory
alias .2 "cd ../.."				    #go up two directories
alias .3 "cd ../../.."                              #go up three directories

#Surfshark-VPN Aliases
#alias vpnup "sudo surfshark-vpn attack"            #quick connect to nearest server
#alias vpnmulti "sudo surfshark-vpn multi"          #connects to multi-hop server
#alias vpndown "sudo surfshark-vpn down"            #disconnects vpn
#alias vpnstat "sudo surfshark-vpn status"          #show vpn status
#alias vpnver "sudo surfshark-vpn version"          #show surfshark-vpn version

#'cat' to 'bat' swap
#alias cat "bat"                                    #changes cat to bat

#'ls' to 'exa' swap
#alias ls "exa -al --color=always"		    #show all contents in directory except "." & ".." in long format
#alias la "exa -a --color=always"		    #show all contents in directory except "." & ".."
#alias ll "exa -l --color=always"                   #show contents in long format
#alias lt "exa -aT --color=always"                  #show all contents in tree format

#General Aliases
alias c "clear"					    #clear screen
alias h "history"				    #show command history
#alias nft "neofetch"                               #neofetch
#alias rft "neofetch | lolcat"                      #rgb neofetch

#General System Tools
alias cp "cp -i"				    #confirm before overwriting existing file
alias mv "mv -i"				    #confirm before overwriting existing file
alias rm "rm -i"				    #confirm before removing file
alias df "df -h"				    #list drive space in human readable format
alias free "free -m"				    #show sizes in MB

#Power Commands
#Linux
#alias shutdown "sudo shutdown now"		    #shutdown system
#alias reboot "sudo reboot"			    #reboot system
#BSD
#alias shutdown "sudo poweroff"                     #shutdown system
#alias reboot "sudo init 6"                         #reboot system
##Text Editor & Config File Aliases
#VIM ALIASES:
#alias v='vim'
#alias vbash='vim ~/.bashrc'
#alias vfish='vim ~/.config/fish/config.fish'
#alias vv='vim ~/.vimrc'
#alias vnv='vim ~/.config/nvim/init.vim'
#alias vzsh='vim ~/.zshrc'
#NEOVIM ALIASES:
#alias vim='nvim'
#alias nvbash='nvim ~/.bashrc'
#alias nvfish='nvim ~/.config/fish/config.fish'
#alias nvv='nvim ~/.vimrc'
#alias nvnv='nvim ~/.config/nvim/init.vim'
#alias nvzsh='nvim ~/.zshrc'

#humorous commands
#alias cow "fortune | cowsay" 			    #give randomly generated fortune with cow
#alias cowstoned "fortune | cowsay -f bong"	    #give randomly generated fortune with cow smoking a bong
#alias rgbaqua "asciiquarium | lolcat"		    #rainbow aquarium
#alias aqua "asciiquarium"			    #aqauarium
#alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash" 

#FUNCTIONS
#mkdircd (cd into directory after creation)
#function mkdircd
        #mkdir $argv && cd $argv
#end

