# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

### run "p10k configure" for configuration wizard

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/brandon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git 
#    zsh-autosuggestions
#    zsh-syntax-highlighting
#
#    )
#
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###ALIASES
##Package Manager Aliasaes
#Pacman
#alias pac='sudo pacman -Syu'                   #Updates system
#alias pacit='sudo pacman -S'                   #Install package(s)
#alias pacr='sudo pacman -R'                    #Remove package(s)
#alias pacrall='sudo pacman -Rcns'              #Remove package(s) and all dependencies
#alias pacsearch='sudo pacman -Q'               #Seach for package
#Yay
#alias yaysua='yay -Sua'                        #Updates only AUR packages
#alias yayrem='yay -R'                          #Remove package(s)
#alias yaysearch='yay -Q'                       #Search for AUR package
#Paru
#alias parusua='paru -Sua'                      #Updates only AUR packages
#alias parurem='paru -R'                        #Remove package(s)
#alias parusearch='paru -Q'                     #Search for AUR packages

##Debian
#apt & apt-get
#alias up='sudo apt-get update'                 #Downloads updates
#alias upg='sudo apt-get upgrade'               #Applies updates to system
#alias it='sudo apt install'                    #Install package(s)
#alias rem='sudo apt remove'                    #Remove package(s)
#alias atrm='sudo apt autoremove'               #Autoremove no longer needed package(s)

##BSD
#alias bsdup='sudo freebsd-update fetch'        #Download system updates
#alias bsdupg='sudo freebsd-update install'     #Install updates to system
#alias upg='sudo pkg upgrade'                   #Download and apply updates for package(s)
#alias pkgit='sudo pkg install'                 #Install package(s)
#alias pkgrem='sudo pkg remove'                 #Remove package(s)
#alias atrm='sudo pkg autoremove'               #Autoremove orphaned dependencies
#alias pkglock='sudo pkg lock'                  #Lock package(s) from being removed or edited
#alias pkgulock='sudo pkg unlock'               #Unlock package(s)
#alias audit='sudo pkg audit'                   #Audit package(s) for vulnerabilities and bugs
#alias auditall='sudo pkg audit -F'             #Audit all packages for vulnerabilities and bugs
#alias chshb='chsh -s /usr/local/bin/bash'      #Changes user shell to 'bash' shell (reboot required)
#alias chshf='chsh -s /usr/local/bin/fish'      #Changes user shell to 'fish' shell (reboot required)
#alias chshz='chsh -s /usr/local/bin/zsh'       #Changes user shell to 'zsh' shell (reboot required)
#
##Navigation Shortcuts
#alias ..='cd ..'                               #Go up a directory
#alias .2='cd ../..'                            #Go up 2 directories
#alias .3='cd ../../..'                         #Go up 3 directories

##Surfshark-VPN Aliases
#alias vpnup='sudo surfshark-vpn attack'        #Quick connect to nearest server
#alias vpnmulti='sudo surfshark-vpn multi'      #Connects to multi-hop server
#alias vpndown='sudo surfshark-vpn down'        #Disconnects vpn
#alias vpnstat='sudo surfshark-vpn status'      #Show vpn status
#alias vpnver='sudo surfshark-vpn version'      #Show surfshark-vpn version

##Liquidctl Aliases (Commander Pro)
#alias liqlist='sudo liquidctl list'                     #List all liquidctl devices
#alias liqstart='sudo liquidctl initialize'              #Initialize all liquidctl devices
#alias liqstat='sudo liquidctl status'                   #Get status of liquidctl devices
#alias fan1start='sudo liquidctl set fan1 speed 60'      #Set fan1 speed to 60%
#alias fan2start='sudo liquidctl set fan2 speed 60'      #Set fan2 speed to 60%
#alias fan3start='sudo liquidctl set fan3 speed 60'      #Set fan3 speed to 60%

#General Aliases
#alias c='clear'                                 #Clear screen
#alias h='history'                               #Show command history
#alias nft='neofetch'                            #Show system information
#alias rft='neofetch | lolcat'                   #Show system information using lolcat

##"cat" to "bat" swap
#alias cat='bat'                                 #Use bat and not cat

##'ls' to 'exa' swap
#alias ls='exa -al'                              #List all in list format
#alias la='exa -a'                               #list all
#alias ll='exa -l'                               #List format
#alias lt='exa -aT'                              #List all in tree format

#General System Tools
#alias cp='cp -i'                                #Interactive copy function
#alias mv='mv -i'                                #Interactive move function
#alias rm='rm -i'                                #Interactive remove funtion
#alias df='df -h'                                #Shows disk usage listed in 'human-readable format'
#alias free='free -m'                            #Show memory usage in MB

##Power Commands
#Linux Power Commands
#alias shutdown='sudo shutdown now'              #Shutdown system now
#alias reboot='sudo reboot now'                  #Reboot system now
#BSD Power Commands
#alias shutdown='sudo poweroff'                  #Shutdown system
#alias reboot='sudo init 6'                      #Reboot system now

##Text Editor & Config File Aliases
#vim aliases:
#alias v='vim'                                   #Shortcut for vim command
#alias vbash='vim ~/.bashrc'                     #Open bash config in vim
#alias vfish='vim ~/.config/fish/config.fish'    #Open fish config in vim
#alias vv='vim ~/.vimrc'                         #Open vim config in vim
#alias vnv='vim ~/.config/nvim/init.vim'         #Open neovim config in vim
#alias vz='vim ~/.zshrc'                         #Open zsh config in vim
#nvim aliases:
#alias vim='nvim'                                #Shortcut for nvim command
#alias nvbash='nvim ~/.bashrc'                   #Open bash config in neovim
#alias nvfish='nvim ~/.config/fish/config.fish'  #Open fish config in neovim
#alias nvv='nvim ~/.vimrc'                       #Open vim config in neovim
#alias nvnv='nvim ~/.config/nvim/init.vim'       #Open neovim config in neovim
#alias nvzsh='nvim ~/.zshrc'                     #Open zsh config in neovim

#some quality jokes
#alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
#alias aqua='asciiquarium'                       #ascii aquarium
#alias rgbaqua='asciiquarium | lolcat'           #rainbow ascii aquarium


###Starship prompt
#eval "$(starship init zsh)"                     #Enable starship prompt for zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
