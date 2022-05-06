#!/usr/bin/env bash

#V0.5.6

#####Shell Functions:

####Distro Agnostic:

###Shells:
##Bash:
function bashcfg {
    cp /home/$USER/.bashrc /home/$USER/.bashrc.bak &&
        cp .bashrc /home/$USER/.bashrc &&
        mkdir -p /home/$USER/.config/bash &&
        cp -r .config/bash /home/$USER/.config/ &&
        mv /home/$USER/.bash_history /home/$USER/.config/bash/bash_history
    return
}

##ZSH:
function zshcfg {
    cp /home/$USER/.zshrc /home/$USER/.zshrc.bak &&
        cp .zshrc /home/$USER/.zshrc &&
        mkdir -p /home/$USER/.config/zsh &&
        cp -r .config/zsh/ /home/$USER/.config/
    return
}

function zshplugincfg {
    cd /home/$USER/.config/zsh &&
        #zsh-syntax-highlighting:
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git &&
        #zsh-autosuggestions:
        git clone https://github.com/zsh-users/zsh-autosuggestions.git
    return
}

##Spaceship Prompt with Powerline fonts for ZSH:
#Debian/Ubuntu:
function zshspaceapt {
   sudo apt-get install curl fonts-powerline -y &&
       curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
   return
}

#Arch Linux:
function zshspacepac {
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1 &&
        cd spaceship-prompt-git &&
        makepkg -si &&
        #Powerline Fonts:'
        git clone https://github.com/powerline/fonts.git --depth=1 &&
        cd fonts &&
        ./install.sh &&
        cd .. &&
        rm -rf fonts/
    return
}

#RHEL/Fedora:
function zshspacednf {
    sudo dnf install curl powerline-fonts -y &&
       curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
    return
}

##Fish:
function fishcfg {
    cp /home/$USER/.config/fish/config.fish /home/$USER/config.fish.bak &&
        mkdir -p /home/$USER/.config/fish &&
        cp .config/fish/config.fish /home/$USER/.config/fish/config.fish
    return
}

###Terminals:
##Alacritty:
function alaccfg {
    mkdir -p /home/$USER/.config/alacritty
        cp -r /home/$USER/.config/alacritty /home/$USER/.config/
    return
}

##Kitty:
function kittycfg {
    mkdir -p /home/$USER/.config/kitty
        cp -r /home/$USER/.config/kitty /home/$USER/.config/
    return
}

###Editors:
##Vim:
function vimcfg {
    cp /home/$USER/.vimrc /home/$USER/.vimrc.bak &&
        cp .vimrc /home/$USER/.vimrc &&
        #Installing VimPlug:
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    return
}

##Neovim:
function nvimcfg {
    cp /home/$USER/.config/nvim/init.vim /home/$USER/.config/nvim/init.vim.bak &&
        mkdir -p /home/$USER/.config/nvim &&
        cp -r .config/nvim /home/$USER/.config/ &&
        #Installing VimPlug:
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    return
}

##Doom Emacs: (For full install only)
function doomemacs {
   git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d &&
       ~/.emacs.d/bin/doom install
   return
}

####Distro Specific:
###Arch-Based:
##Sync Repositories:
function archsync {
    sudo pacman -Sy
    return
}

##Arch Update:
function archupdate {
    sudo pacman -Syu
    return
}

##Minimal Installation: (Arch Repositories Only)
function pacmininstall {
    sudo pacman -S kitty vim firefox git curl wget
    return
}

##Full Installation: (Arch Repositories Only)
function pacfullinstall {
    sudo pacman -S alacritty kitty firefox zsh vim neovim exa bat git curl wget emacs ripgrep find
    return
}

##AUR Helpers:
#Paru: (Has Rust Dependencies)
function paruinstall {
    sudo pacman -S --needed base-devel git &&
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si
}

#Yay: (Has GO Dependencies)
function yayinstall {
    sudo pacman -S --needed base-devel git &&
        git clone https://aur.archlinux.org/yay.git &&
        cd yay &&
        makepkg -si
    return
}

#Aura: (Has Haskell Dependencies)
function aurainstall {
    sudo pacman -S --needed base-devel git &&
        git clone https://aur.archlinux.org/aura-bin.git &&
        cd aura-bin &&
        makepkg -si
    return
}

###Debian-Based:
##Sync Repositories:
function debsync {
    sudo apt-get update
    return
}

##Debian Update:
function debupdate {
    sudo apt-get upgrade -y
    return
}

##Minimal Installation:
function aptmininstall {
    sudo apt-get install kitty vim firefox-esr git curl wget -y
    return
}

##Full Installation:
function aptfullinstall {
    sudo apt-get install kitty vim firefox-esr zsh neovim git curl wget exa emacs -y
    return
}

##Install Pacstall:
function instpacstall {
    sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
    return
}

##Pacstall Packages:
function pacstallinstall {
    pacstall -I alacritty brave-browser-deb
    return
}

##Nala Installation:
function nalainstall {
    echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list &&
        wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null &&
        sudo apt-get update &&
        sudo apt-get install nala -y
    return
}

###RHEL-Based:
##Fedora Update:
function dnfupdate {
    sudo dnf update -y
    return
}

function dnfmininstall {
    sudo dnf install kitty vim firefox git curl wget -y
    return
}

function dnffullinstall {
    sudo dnf install vim neovim kitty alacritty firefox git curl wget emacs ripgrep -y
    return
}

####Installation:
echo "What distro are we installing onto?"
echo "Arch, Debian, or Fedora?"
read distro

###Arch/Arch-Based Distros:
if [ $distro = "Arch"  ]; then
    echo "Full or Minimal installation?"
    read answer

    if [ $answer = "Full" ]; then
        archupdate
        pacfullinstall
        paruinstall
        bashcfg
        zshcfg
        zshplugincfg
        zshspacepac
        alaccfg
        kittycfg
        vimcfg
        nvimcfg
    elif [ $answer = "Minimal" ]; then
        archupdate
        pacmininstall
        bashcfg
        kittycfg
    else
        echo "Error in submission"
        echo "Exiting Installation Now"
        return
    fi
fi

###Debian/Debian-Based Distros:
if [ $distro = "Debian" ]; then
    echo "Full or Minimal Installation?"
    read answer

    if [ $answer = "Full" ]; then
        debupdate
        aptfullinstall
        instpacstall
        pacstallinstall
        bashcfg
        zshcfg
        zshplugincfg
        zshspaceapt
        alaccfg
        kittycfg
        vimcfg
        nvimcfg
    elif [ $answer = "Minimal" ]; then
        debupdate
        bashcfg
        vimcfg
        kittycfg
    else
        echo "Error in submission"
        echo "Exiting Installation Now"
        return
    fi
fi

##Fedora/RHEL-Based Distros:
if [ $distro = "Fedora" ]; then
    echo "Option is currently Unavailable"
    echo "Option is still under development"

else
    echo "Error in submission"
    echo "Exiting Installation Now"
    return
fi

echo "Script has now exited"
exit 0
