#This is a configuration file for the zsh shell
#Requirements/Dependencies: Spaceship prompt, zsh-syntax-highlighting, zsh-auto-completion
# __  __           _________  _   _     ____             __ _       
#|  \/  |_   _    |__  / ___|| | | |   / ___|___  _ __  / _(_) __ _ 
#| |\/| | | | |     / /\___ \| |_| |  | |   / _ \| '_ \| |_| |/ _` |
#| |  | | |_| |    / /_ ___) |  _  |  | |__| (_) | | | |  _| | (_| |
#|_|  |_|\__, |___/____|____/|_| |_|___\____\___/|_| |_|_| |_|\__, |
#        |___/_____|              |_____|                     |___/ 
#
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=20000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###Aliases:
source ~/.config/zsh/zsh_aliases 

###Spaceship Prompt:
#source ~/.config/zsh/zsh_spaceship

##ZSH Syntax Highlighting:
#source .config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##ZSH Auto-suggestions:
#source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

