source /etc/profile

###EXPORT
export HISTCONTROL=ignoredups:erasedups 	#no dublicate entries
export EDITOR="vim"				#$EDITOR use vim in terminal

### Shell Color Script ###
colorscript -e 36

###ALIASES

##'ls' to 'exa' swap
alias la='exa -al --color=always'		#ls listing all in list format
alias la='ls -a --color=always'			#ls listing all
alias ll='ls -l --color=always'			#ls list format

##"cat" to "bat" swap
alias cat='bat'                         #use bat and not cat

##overwrite protection
alias mv='mv -i'				        #interactive move of file
alias rm='rm -i'				        #interactive removing of file
alias cp='cp -i'				        #interactive copy of file

##navigation shortcuts
alias ..='cd ..'				        #go up one directory
alias .2='cd../..'				        #go up two directories
alias .3='cd../../..'				    #go up three directories

##package managers
#pacman
alias pac='sudo pacman -Syu'			#update standard packages
alias pacit='sudo pacman -S'			#install package(s)
alias pacrem='sudo pacman -R'			#remove package(s)

#yay
alias yaysua='sudo yay -Sua'			#updates only AUR packages
alias yayrem='sudo yay -R'			    #remove package(s)

#paru
alias parusua='sudo paru -Sua'			#updates only AUR packages
alias yayrem='sudo paru -R'			    #remove package(s)

##adding flags to genearl commands
alias df='df -h'				        #adds human readable format flag
alias free='free -m'				    #shows size in MB
alias nft='neofetch'                    #neofetch
alias rft='neofetch | lolcat'           #rgb neofetch

##some quality jokes
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias aqua='asciiquarium'			    #ascii aquarium
alias rgbaqua='asciiquarium | lolcat'	#rainbow ascii aquarium


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


