#####The configuration file for the Bourne Again(Bash) Shell:
####Dependencies are listed in ~/.config/bash/README.md

###The Shell Prompt:
##Built-in:
export PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;134m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\\$\[$(tput sgr0)\]"
##Starship Prompt:
#eval "$(starship init bash)"
#export STARSHIP_CONFIG=home/$USER/.config/starship/starship.toml

###Shell Editor:
export EDITOR="vim"                             #Set SHELL Editor to use Vim
#export EDITOR="nvim"                           #Set SHELL Editor to use Neovim
#export VISUAL="emacsclient -c -a emacs"         #Set SHELL Visual Editor to GUI Emacs

###Set Manpager: (Only uncomment a single option)
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"  #Set Manpager as 'bat'
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'    #Set Manpager as 'vim'
# export MANPAGER="nvim -c 'set ft=man' -"           #Set Manpager of 'nvim'

###Shell History File Options:
export HISTCONTROL=ignoreboth:erasedups         #Ignore duplicate entries in history file
HISTFILE=~/.config/bash/hisfile                 #Setting custom history file path (Usually in $HOME)
HISTTIMEFORMAT="$F $T"                          #Setting timestamps for history file
HISTSIZE=10000                                  #Setting number of commands to save in history file
SAVEHIST=20000                                  #Max size of history file
PROMPT_COMMAND='history -a'                     #Add commands to history file immediately

###Shopt Options:
shopt -s autocd                                 #Enables changing to named directory without 'cd'
shopt -s cdspell                                #Enables mild autocorrection & spellcheck
shopt -s cmdhist                                #Save multi-line commands as single line
shopt -s dotglob                                #Includes '.' filenames in expansion
shopt -s expand_aliases                         #Expand $USER aliases to show full command
shopt -s histappend                             #This will append the history file instead of overwrite it

###Path:
export PATH="$HOME/Documents/scripts:$PATH"     #Setting location for scripts folder

###General/Misc:
##Aliases:
source ~/.config/bash/bash_aliases              #Setting location for aliases file
##Realine(Used for colorized completion of filenames):
source ~/.config/bash/inputrc                   #Setting location for inputrc file
#set -o vi                                      #Enable Vi mode
##Neofetch on Start:
#neofetch
#neofetch --ascii_distro Arch_old
##Shell Color Script:(There are a number of these, but I typically use www.gitlab.com/dwt1/shell-color-scipts)
#colorscript -e 37

###Kitty Terminal Shell Integration:
#if test -n "$KITTY_INSTALLATION_DIR"; then
#    export KITTY_SHELL_INTEGRATION="enabled"
#    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
#fi

###Function:
##Extract:(syntax is "extract <file>")
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1 && cd $(echo $1 | sed 's/.tar.bz2//')    ;;
           *.tar.gz)    tar xvzf $1 && cd $(echo $1 | sed 's/.tar.gz//')    ;;
           *.bz2)       bunzip2 $1 && cd $(echo $1 | sed 's/.bz2//')    ;;
           *.rar)       unrar x $1 && cd $(echo $1 | sed 's/.rar//')    ;;
           *.gz)        gunzip $1 && cd $(echo $1 | sed 's/.gz//')    ;;
           *.tar)       tar xvf $1 && cd $(echo $1 | sed 's/.tar//')    ;;
           *.tbz2)      tar xvjf $1 && cd $(echo $1 | sed 's/.tbz2//')    ;;
           *.tgz)       tar xvzf $1 && cd $(echo $1 | sed 's/.tgz//')    ;;
           *.zip)       unzip $1 && cd $(echo $1 | sed 's/.zip//')    ;;
           *.Z)         uncompress $1 && cd $(echo $1 | sed 's/.Z//')    ;;
           *.7z)        7z x $1 && cd $(echo $1 | sed 's/.7z//')    ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

##Change List:(Change directory and list contents)
cl() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; exa -al --icons
    else
        echo "bash: cl: $dir: Directory not found"
    fi
}

