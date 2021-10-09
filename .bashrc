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
export PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;134m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\\$\[$(tput sgr0)\]"

HISTFILE=~/.config/bash/bash_history
HISTSIZE=10000
SAVEHIST=20000
shopt -s autocd

###Realine(Used for colorized completion of filenames):
source ~/.config/bash/inputrc

###Aliases:
source ~/.config/bash/bash_aliases

###Shell Color Script:
colorscript -e 37

###PROMPT:
#eval "$(starship init bash)"

###FUNCTIONS:
##Extract:(syntax is "extract <file>")
#Yes, I am aware that there is technically an extra end parenthesis 16 lines down. If deleted bash complains so I suppose it's needed.
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *.zst) c=(unzstd);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

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
