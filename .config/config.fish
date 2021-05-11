#This is a configuration file for the fish shell
# __  __           _____ _     _         ____             __ _
#|  \/  |_   _    |  ___(_)___| |__     / ___|___  _ __  / _(_) __ _
#| |\/| | | | |   | |_  | / __| '_ \   | |   / _ \| '_ \| |_| |/ _` |
#| |  | | |_| |   |  _| | \__ \ | | |  | |__| (_) | | | |  _| | (_| |
#|_|  |_|\__, |___|_|   |_|___/_| |_|___\____\___/|_| |_|_| |_|\__, |
#        |___/_____|               |_____|                     |___/
#

set fish_greeting                               #disables fish greeting
set TERMINAL "alacritty"                        #Sets terminal type

### Color Script ###
colorscript random

##ALIASES
#Navigation
alias .. "cd .."				        #go up one directory
alias .2 "cd ../.."				        #go up two directories
alias .3 "cd ../../.."                  #go up three directories


#Package Manager Aliases
alias pac "sudo pacman -Syu"			#updates system
alias pacrem "sudo pacman -R"			#remove package(s)
alias pacsearch "sudo pacman -Q"		#seach for package
alias yaysua "yay -Sua"				    #updates only AUR packages
alias yayrem "yay -R"				    #remove package(s)
alias yaysearch "yay -Q"			    #search for AUR package
alias parusua "paru -Sua"			    #updates only AUR packages
alias parurem "paru -R"				    #remove package(s)
alias parusearch "paru -Q"			    #search for AUR packages

#General Aliases
alias c "clear"					        #clear screen
alias h "history"				        #show command history
alias nft "neofetch"                    #neofetch
alias rft "neofetch | lolcat"           #rgb neofetch

#'cat' to 'bat' swap
alias cat "bat"                         #changes cat to bat

#'ls' to 'exa' swap
alias ls "exa -al --color=always"		#show all contents in directory except "." & ".." in long format
alias la "exa -a --color=always"		#show all contents in directory except "." & ".."
alias ll "exa -l --color=always"        #show contents in long format
alias lt "exa -aT --color=always"       #show all contents in tree format

#General System Tools
alias cp "cp -i"				        #confirm before overwriting existing file
alias mv "mv -i"				        #confirm before overwriting existing file
alias rm "rm -i"				        #confirm before removing file
alias df "df -h"				        #list drive space in human readable format
alias free "free -m"				    #show sizes in MB

#Power Commands
alias shutdown "sudo shutdown now"		#shutdown system
alias reboot "sudo reboot"			    #reboot system

#Text Editor Aliases


#humorous commands
alias cow "fortune | cowsay" 			                    #give randomly generated fortune with cow
alias cowstoned "fortune | cowsay -f bong"	                #give randomly generated fortune with cow smoking a bong
alias cowsd "fortune | cowsay -f sodomized"	                #give randomly generated fortune with sodomized cow
alias rgbaqua "asciiquarium | lolcat"		                #rainbow aquarium
alias aqua "asciiquarium"			                        #aqauarium
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash" 	#do you really have to ask lol

#FUNCTIONS
#mkdircd (cd into directory after creation)
function mkdircd
        mkdir $argv && cd $argv
end

