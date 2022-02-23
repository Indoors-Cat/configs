#this is a configuration file for the fish shell
#Requirements/Dependencies for Arch: yay, paru, libqalculate(Arch), exa(AUR), bat(AUR), vim(Arch), neovim(Arch), emacs(Arch), curl(Arch)
#Requirements/Dependencies for Debian: qalc, exa, bat, vim, neovim, emacs, curl
#Requirements/Dependencies for Fedora: qalc, exa, bat, vim, neovim, emacs, curl
#All depend on the shell-color-scripts package. There are a number of them, but I use the one from gitlab.com/dwt1/shell-color-scripts
# __  __           _____ _     _         ____             __ _
#|  \/  |_   _    |  ___(_)___| |__     / ___|___  _ __  / _(_) __ _
#| |\/| | | | |   | |_  | / __| '_ \   | |   / _ \| '_ \| |_| |/ _` |
#| |  | | |_| |   |  _| | \__ \ | | |  | |__| (_) | | | |  _| | (_| |
#|_|  |_|\__, |___|_|   |_|___/_| |_|___\____\___/|_| |_|_| |_|\__, |
#        |___/_____|               |_____|                     |___/
#

#set fish_greeting                                  #Disables fish greeting
#set TERMINAL "alacritty"                           #Sets terminal type

### Color Script ###
#colorscript -r

#####ALIASES#####
##Arch:
  #pacman:
    #alias pac "sudo pacman -Syu"            	    #Update standard package(s)
    #alias pacit "sudo pacman -S"           	    #Unstall package(s)
    #alias pacrem "sudo pacman -R"           	    #Remove package(s)
    #alias pacremall "sudo pacman -Rncs"		    #Remove package(s) and all dependencies
    #alias pacsrch "sudo pacman -Si"                #Search for package(s) & display information {External}
    #alias pacisrch "sudo pacman -Qi"         	    #Search for package(s) & display information {Internal}
    #alias paccelanup "sudo pacman -Rns $(pacman -Qtdq)" #Cleanup orphaned packages --Do not overuse this command!
  #yay:
    #alias yaysua "sudo yay -Sua"            	    #Updates only AUR package(s)
    #alias yayrem "sudo yay -R"              	    #Remove package(s)
    #alias yaysrch='yay -Si'           	        #Search for package(s) & display information {External}
    #alias yayisrch='yay -Qi'                       #Search for package(s) & display information {Internal}
  #paru:
    #alias parusua "sudo paru -Sua"          	    #Updates only AUR package(s)
    #alias parurem "sudo paru -R"            	    #Remove package(s)
    #alias parusrch='paru -Si'                      #Search for package(s) & display information {Extenral}
    #alias paruisrch='paru -Qi'         	        #Search for package(s) & display information {Internal}

##Debian:
  #apt & apt-get
    #alias up "sudo apt-get update"			    #Downloads updates
    #alias upg "sudo apt-get upgrade"		        #Applies updates to system
    #alias it "sudo apt install"			        #Install package(s)
    #alias rem "sudo apt remove"			        #Remove package(s)
    #alias atrm "sudo apt autoremove"		        #Autoremove orphaned package(s) & dependencies

##Solus:
  #eopkg:
    #alias upg "sudo eopkg upgrade"                 #Download and apply update(s)
    #alias it "sudo eopkg install"                  #Install package(s)
    #alias rem "sudo eopkg remove"                  #Remove package(s)
    #alias atrm "sudo eopkg autoremove"             #Autoremove orphaned package(s) & dependencies
    #alias listup "sudo eopkg list-upgrades"        #List available upgrade(s) for package(s)
    #alias esearch "sudo eopkg search"              #Search for package(s)

##Fedora/RHEL:
  #dnf:
    #alias upg "sudo dnf upgrade"                   #Download and apply update(s)
    #alias dit "sudo dnf install"                   #Install package(s)
    #alias drem "sudo dnf remove"                   #Remove package(s)
    #alias atrm "sudo dnf autoremove"               #Autoremove orphaned package(s) & dependencies

##BSD:
  #pkg:
    #alias bsdup "doas freebsd-update fetch"        #Download system updates
    #alias bsdupg "doas freebsd-update install"     #Install updates to system
    #alias upg "doas pkg upgrade"                   #Download and apply updates for package(s)
    #alias pkgit "doas pkg install"                 #Install package(s)
    #alias pkgrem "doas pkg remove"                 #Remove package(s)
    #alias atrm "doas pkg autoremove"               #Autoremove orphaned package(s) & dependencies
    #alias pkglock "doas pkg lock"                  #Lock package(s) from being removed or edited
    #alias pkgulock "doas pkg unlock"               #Unlock package(s)
    #alias audit "doas pkg audit"                   #Audit package(s) for vulnerabilities and bugs
    #alias auditall "doas pkg audit -F"             #Audit all packages for vulnerabilities and bugs
    #alias chshb "chsh -s /usr/local/bin/bash"      #Changes user shell to 'bash' shell (reboot required)
    #alias chshf "chsh -s /usr/local/bin/fish"      #Changes user shell to 'fish' shell (reboot required)
    #alias chshz "chsh -s /usr/local/bin/zsh"       #Changes user shell to 'zsh' shell (reboot required)

#Navigation:
    #alias .. "cd .."				                #Go up one directory
    #alias .2 "cd ../.."				            #Go up two directories
    #alias .3 "cd ../../.."                          #Go up three directories

#Surfshark-VPN Aliases:
    #alias vpnup "sudo surfshark-vpn attack"        #Quick connect to nearest server
    #alias vpnmulti "sudo surfshark-vpn multi"      #Connects to multi-hop server
    #alias vpndown "sudo surfshark-vpn down"        #Disconnects vpn
    #alias vpnstat "sudo surfshark-vpn status"      #Show vpn status
    #alias vpnver "sudo surfshark-vpn version"      #Show surfshark-vpn version

##'liquidctl' Aliases (Corsair Commander Pro):
    #alias liqlist "sudo liquidctl list"			         #List available devices
    #alias liqstart "sudo liquidctl initialize"		     #Initialize all available device(s)
    #alias liqstart "sudo liquidctl status"			     #Show status of available device(s)
    #alias fan1start "sudo liquidctl set fan1 speed 60"	 #Set fan1 to 60% speed
    #alias fan2start "sudo liquidctl set fan2 speed 60"	 #Set fan2 to 60% speed
    #alias fan3start "sudo liquidctl set fan3 speed 60"	 #Set fan3 to 60% speed

##Timeshift (BTRFS) Aliases
    #alias timelistsnap "sudo timeshift --list-snapshots"    #List snapshots
    #alias timelistdev "sudo timeshift --list-devices"       #List devices
    #alias timecheck "sudo timeshfit --check"                #Create snapshot if scheduled
    #alias timesnap "sudo timeshift --create"                #Create snapshot
    #alias snapcomment "sudo timeshift --comments"           #Set snapshot description
    #alias timerestore "sudo timeshift --restore"            #Restore from snapshot

#General Aliases:
    #alias c "clear"				                #clear screen
    #alias h "history"				                #Show command history
    #alias nft "neofetch"                            #Neofetch
    #alias rft "neofetch | lolcat"                   #Rgb neofetch
    #alias calc "qalc"                               #Termianl-based calculator
    #alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
    #alias kittytheme "kitty +kitten themes"        #Prompt you to select theme for kitty terminal

##Command Swaps:
  #'ls' to 'exa':
    #alias ls "exa -al --icons"		                #ls listing all in list format
    #alias sl "exa -alr --icons"                     #ls listing all in reverse list format
    #alias la "exa -a --icons"		                #ls listing all
    #alias ll "exa -l --icons"		                #ls list format
    #alias lr "exa -ar --icons"                      #Show all contents recursively
  #'cat' to 'bat':
    #alias cat "bat"                                 #Use bat instead of cat

#General System Tools:
    alias cp "cp -i"				                #Confirm before overwriting existing file
    alias mv "mv -i"				                #Confirm before overwriting existing file
    alias rm "rm -i"				                #Confirm before removing file
    #alias df "df -h"				                #List drive space in human readable format
    #alias free "free -m"				            #Show sizes in MB

#Power Commands:
  #Linux:
    #alias shutdown "sudo shutdown now"		        #Shutdown system
    #alias reboot "sudo reboot"			            #Reboot system
  #BSD:
    #alias shutdown "doas poweroff"                 #Shutdown system
    #alias reboot "doas init 6"                     #Reboot system

##Text Editor & Config File Aliases:
  #VIM ALIASES:
    #alias v "vim"                                  #Shortcut for vim command
    #alias vbash "vim ~/.bashrc"                     #Open bash config in vim
    #alias vfish "vim ~/.config/fish/config.fish"    #Open fish config in vim
    #alias vv "vim ~/.vimrc"                         #Open vim config in vim
    #alias vnv "vim ~/.config/nvim/init.vim"        #Open neovim config in vim
    #alias vzsh "vim ~/.zshrc"                      #Open zsh config in vim
  #NEOVIM ALIASES:
    #alias vim "nvim"                               #Alias to replace vim with neovim
    #alias nvbash "nvim ~/.bashrc"                   #Open bash config in neovim
    #alias nvfish "nvim ~/.config/fish/config.fish"  #Open fish config in neovim
    #alias nvv "nvim ~/.vimrc"                      #Open vim config in neovim
    #alias nvnv "nvim ~/.config/nvim/init.vim"       #Open neovim config in neovim
    #alias nvzsh "nvim ~/.zshrc"                    #Open zsh config in neovim
  #DOOM-EMACS ALIASES:
    #alias doomhelp "~/.emacs.d/bin/doom help"      #Show a list of available doom commands
    #alias doomsync "~/.emacs.d/bin/doom sync"      #Sync config wiht Doom Emacs
    #alias doomupg "~/.emacs.d/bin/doom upgrade"    #Update Doom Emacs & its package(s)
    #alias doomdoctor "~/.emacs.d/bin/doom doctor"  #Diagnostic tool for Doom Emacs
    #alias doompurge "~/.emacs.d/bin/doom purge"    #Delete old, orphaned package(s)
    #alias doominfo "~/.emacs.d/bin/doom info"      #Output system info in markdown
    #alias doomver "~/.emacs.d/bin/doom version"    #Show version info for Doom & Emacs

##Git Aliases:

##Script Aliases:

##some quality jokes:
#alias cow="fortune | cowsay" 			            #Give randomly generated fortune with cow
#alias rgbaqua="asciiquarium | lolcat"		        #Rainbow aquarium
#alias aqua="asciiquarium"			                #Aqauarium
#alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

#####ABBRAVIATIONS#####
##Arch:
  #Pacman:
    #abbr pac "sudo pacman -Syu"                    #Update standard package(s)
    #abbr pacit "sudo pacman -S"                    #Install package(s)
    #abbr pacrem "sudo pacman -R"                   #Remove package(s)
    #abbr pacramall "sudo pacman -Rncs"             #Remoe package(s) & all dependencies
    #abbr pacsrch "sudo pacman -Si"                 #Search for package(s) & display information {External}
    #abbr pacisrch "sudo pacman -Qi"                #Search for package(s) & display information {Internal}
    #abbr paccleanup "sudo pacman -Rns $(pacman -Qtdq)"
  #Yay:
    #abbr yaysua "yay -Sua"                         #Update only AUR package(s)
    #abbr yayrem "yay -R"                           #Remove package(s)
    #abbr yaysrch "yay -Si"                         #Search for package(s) & display information {External}
    #abbr yayisrch "yay -Qi"                        #Search for package(s) & display information {Internal}
  #Paru:
    #abbr parusua "paru -Sua"                       #Update only AUR package(s)
    #abbr parurem "paru -R"                         #Remove package(s)
    #abbr parusrch "paru -Si"                       #Search for package(s) & display information {External}
    #abbr paruisrch "paru -Qi"                      #Search for package(s) & display information {Internal}

##Debian:
  #apt & apt-get
    #abbr up='sudo apt-get update'			        #Downloads update(s)
    #abbr upg='sudo apt-get upgrade'		        #Applies update(s) to system
    #abbr it='sudo apt install'			        #Install package(s)
    #abbr rem='sudo apt remove'			        #Remove package(s)
    #abbr atrm='sudo apt autoremove'		        #Autoremove orphaned package(s) & dependencies

##Solus:
  #eopkg
    #abbr upg='sudo eopkg upgrade'			        #Download and apply update(s)
    #abbr it='sudo eopkg install'			        #Install package(s)
    #abbr rem='sudo eopkg remove'			        #Remove package(s)
    #abbr atrm='sudo eopkg autoremove'		        #Autoremove orphaned package(s) & dependencies
    #abbr listup='sudo eopkg list-upgrades'	    #List available upgrades for package(s)
    #abbr esearch='sudo eopkg search'		        #Search for package(s)

##Fedora/RHEL:
  #dnf
    #abbr upg='sudo dnf upgrade'                    #Downloads and applys update(s)
    #abbr dit='sudo dnf install'                    #Installs specified package(s)
    #abbr drem='sudo dnf remove'                    #Removes specified package(s)
    #abbr atrm='sudo dnf autoremove'                #Autoremove orphaned package(s) & dependencies

##BSD:
  #pkg
    #abbr bsdup='doas freebsd-update fetch'     	#Download system update(s)
    #abbr bsdupg='doas freebsd-update install'  	#Install update(s) to system
    #abbr upg='doas pkg upgrade'                	#Download and apply updates for package(s)
    #abbr pkgit='doas pkg install'              	#Install package(s)
    #abbr pkgrem='doas pkg remove'              	#Remove package(s)
    #abbr atrm='doas pkg autoremove'            	#Autoremove orphaned package(s) & dependencies
    #abbr pkglock='doas pkg lock'               	#Lock package(s) from being removed or edited
    #abbr pkgulock='doas pkg unlock'            	#Unlock package(s)
    #abbr audit='doas pkg audit'                	#Audit package(s) for vulnerabilities and bugs
    #abbr chshb='chsh -s /usr/local/bin/bash'   	#Changes user shell to 'bash' shell (reboot required)
    #abbr chshf='chsh -s /usr/local/bin/fish'   	#Changes user shell to 'fish' shell (reboot required)
    #abbr chshz='chsh -s /usr/local/bin/zsh'    	#Changes user shell to 'zsh' shell (reboot required)

##Navigation:
    #abbr .. "cd .."                                #Go up one directory
    #abbr .2 "cd ../.."                             #Go up two directories
    #abbr .3 "cd ../../.."                          #Go up three directories

##Surfshark-VPN Aliases:
    #abbr vpnup "sudo surfshark-vpn"                #Connect to SurfShark-VPN service
    #abbr vpnfast "sudo surfshark-vpn attack"       #Quick connect to nearest server
    #abbr vpnmulti "sudo surfshark-vpn multi"       #Connec to multi-hop server
    #abbr vpndown "sudo surfshark-vpn down"         #Disconnect vpn
    #abbr vpnstat "sudo surfshark-vpn status"       #Show vpn status
    #abbr vpnver "sudo surfshark-vpn version"       #Show surfshark-vpn version

##'liquidctl' Aliases (Run Corsair Commander Pro):
    #abbr liqlist "sudo liquidctl list"                     #List available devices
    #abbr liqstart "sudo liquidctl initialize"              #Initialize all available device(s)
    #abbr liqstat "sudo liquidctl status"                   #Show status of available device(s)
    #abbr fan1start "sudo liquidctl set fan1 speed 60"      #Set fan1 to 60% speed
    #abbr fan2start "sudo liquidctl set fan2 speed 60"      #Set fan2 to 60% speed
    #abbr fan3start "sudo liquidctl set fan3 speed 60"      #Set fan3 to 60% speed
    #abbr fanled "sudo liquidctl set led2 color color_shift --speed medium 21BBB8 9c13f2 --start-led 1 --maximum-leds 24"
    #abbr ledstrip "sudo liquidctl set led2 color color_shift --speed medium 21BBB8 9c13f2 --start-led 1 --maximum-leds 24"

##Timeshift (BTRFS) Aliases
    #abbr timelistsnap='sudo timeshift --list-snapshots'    #List snapshots
    #abbr timelistdev='sudo timeshift --list-devices'       #List devices
    #abbr timecheck='sudo timeshfit --check'                #Create snapshot if scheduled
    #abbr timesnap='sudo timeshift --create'                #Create snapshot
    #abbr snapcomment='sudo timeshift --comments'           #Set snapshot description
    #abbr timerestore='sudo timeshift --restore'            #Restore from snapshot

##General Abbreviations:
    abbr c "clear"                                 #Clear screen
    abbr h "history"                               #Show command history
    #abbr nft "neofetch"                            #Neofetch
    #abbr rft "neofetch | lolcat"                   #RGB neofetch
    #abbr calc "qalc"                               #Terminal-based calculator
    #abbr update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
    #abbr kittytheme "kitty +kitten themes"         #Prompt you to select theme for kitty terminal

##Command Swaps:
    #'ls' to 'exa'
          #abbr ls "exa -al --icons"                #ls listing all in list format
          #abbr sl "exa -alr --icons"               #ls listing all in reverse list format
          #abbr la "exa -a --icons"                 #ls listing all
          #abbr ll "exa -l --icons"                 #ls list format
          #abbr lr "exa -ar --icons"                #Show all content recursivly
    #'cat' to 'bat'
          #abbr cat "bat"                           #Use bat instead of cat

#General System Tools:
    #abbr cp "cp -i"				                #Confirm before overwriting existing file
    #abbr mv "mv -i"				                #Confirm before overwriting existing file
    #abbr rm "rm -i"				                #Confirm before removing file
    #abbr df "df -h"				                #List drive space in human readable format
    #abbr free "free -m"				            #Show sizes in MB

#Power Commands:
  #Linux:
    abbr shutdown "sudo shutdown now"		        #Shutdown system
    abbr reboot "sudo reboot"			            #Reboot system
  #BSD:
    #abbr shutdown "doas poweroff"                  #Shutdown system
    #abbr reboot "doas init 6"                      #Reboot system

##Text Editor & Config File Aliases:
  #VIM ALIASES:
    #abbr v "vim"                                   #Shortcut for vim command
    #abbr vbash "vim ~/.bashrc"                     #Open bash config in vim
    abbr vfish "vim ~/.config/fish/config.fish"    #Open fish config in vim
    abbr vv "vim ~/.vimrc"                         #Open vim config in vim
    #abbr vnv "vim ~/.config/nvim/init.vim"         #Open neovim config in vim
    #abbr vzsh "vim ~/.zshrc"                       #Open zsh config in vim
  #NEOVIM ALIASES:
    #abbr vim "nvim"                                #Alias to replace vim with neovim
    #abbr nvbash "nvim ~/.bashrc"                   #Open bash config in neovim
    abbr nvfish "nvim ~/.config/fish/config.fish"  #Open fish config in neovim
    #abbr nvv "nvim ~/.vimrc"                       #Open vim config in neovim
    abbr nvnv "nvim ~/.config/nvim/init.vim"       #Open neovim config in neovim
    #abbr nvzsh "nvim ~/.zshrc"                     #Open zsh config in neovim
  #DOOM-EMACS ALIASES:
    #abbr doomhelp "~/.emacs.d/bin/doom help"       #Show a list of available doom commands
    #abbr doomsync "~/.emacs.d/bin/doom sync"       #Sync config wiht Doom Emacs
    #abbr doomupg "~/.emacs.d/bin/doom upgrade"     #Update Doom Emacs & its package(s)
    #abbr doomdoctor "~/.emacs.d/bin/doom doctor"   #Diagnostic tool for Doom Emacs
    #abbr doompurge "~/.emacs.d/bin/doom purge"     #Delete old, orphaned package(s)
    #abbr doominfo "~/.emacs.d/bin/doom info"       #Output system info in markdown
    #abbr doomver "~/.emacs.d/bin/doom version"     #Show version info for Doom & Emacs
