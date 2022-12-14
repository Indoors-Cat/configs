#This is a configuration file for the bash shell
#There are a number of shell-color-script packages. The one I use is from www.gitlab.com/dwt1/shell-color-scripts
# __  __           ____            _         ____             __ _
#|  \/  |_   _    | __ )  __ _ ___| |__     / ___|___  _ __  / _(_) __ _
#| |\/| | | | |   |  _ \ / _` / __| '_ \   | |   / _ \| '_ \| |_| |/ _` |
#| |  | | |_| |   | |_) | (_| \__ \ | | |  | |__| (_) | | | |  _| | (_| |
#|_|  |_|\__, |___|____/ \__,_|___/_| |_|___\____\___/|_| |_|_| |_|\__, |
#        |___/_____|                   |_____|                     |___/
#
###EXPORTS:
export HISTCONTROL=ignoredups:erasedups 	        #no dublicate entries
export EDITOR="vim"				                    #$EDITOR use vim in terminal

###Set history file location, and size:
HISTFILE=~/.config/bash/bash_history
HISTSIZE=10000
SAVEHIST=20000

shopt -s autocd

###Realine(Used for colorized completion of filenames):
source ~/.config/bash/inputrc

###Setting location for alias file:
source ~/.config/bash/bash_aliases

###PROMPT:
##Starship Prompt:
#eval "$(starship init bash)"

##Custom Bash Prompt:
export PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;134m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\\$\[$(tput sgr0)\]"

###Shell Color Script:
#colorscript -e 37

#Neofetch At Startup:
#neofetch
#neofetch --ascii_distro Arch_old   #Displays old Arch logo
#neofetch --ascii_distro LFS         #Displays tux

###FUNCTIONS:
##Change List:(Change directory and list contents)
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; exa -a --icons
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}
