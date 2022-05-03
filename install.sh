#!/usr/bin/env bash

#V0.5.3

####Shell Functions:

###Distro Agnostic:

##Shells:
#Bash Shell:
function bashcfg {
    cp /home/$USER/.bashrc /home/$USER/.bashrc.bak &&
        cp .bashrc /home/$USER/.bashrc &&
        cp -r .config/bash /home/$USER/.config/ &&
        mv /home/$USER/.bash_history /home/$USER/.config/bash/bash_history
    return
}

#ZSH Shell:
function zshcfg {
    cp /home/$USER/.zshrc /home/$USER/.zshrc.bak &&
        cp .zshrc /home/$USER/.zshrc &&
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

###Spaceship Prompt with Powerline fonts for ZSH:
##Debian/Ubuntu:
function zshspaceapt {
   sudo apt-get install curl fonts-powerline -y &&
       curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
   return
}

##Arch Linux:
function zshspacepac {
    git clone https://aur.archlinux.org/spaceship-prompt-git.git -depth=1 &&
        cd spaceship-prompt-git &&
        makepkg -si &&
        #Powerline Fonts:'
        git clone https://github.com/powerline/fonts.git -depth=1 &&
        cd fonts &&
        ./install.sh &&
        cd .. &&
        rm -rf fonts/
    return
}

##RHEL/Fedora:
function zshspacednf {
    sudo dnf install curl powerline-fonts -y &&
       curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
    return
}

##Terminals:
#Alacritty:
function alaccfg {
    cp -r /home/$USER/.config/alacritty /home/$USER/.config/
    return
}

#Kitty:
function kittycfg {
    cp -r /home/$USER/.config/kitty /home/$USER/.config/
    return
}

##Editors:
#Vim:
function vimcfg {
    cp /home/$USER/.vimrc /home/$USER/.vimrc.bak &&
        cp .vimrc /home/$USER/.vimrc &&
        #Installing VimPlug:
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    return
}

#Neovim:
function nvimcfg {
    cp /home/$USER/.config/nvim/init.vim /home/$USER/.config/nvim/init.vim.bak &&
        cp -r .config/nvim /home/$USER/.config/ &&
        #Installing VimPlug:
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    return
}


####Distro Specific:
###Arch-Based:

#Repository Sync:
function archsync {
    sudo pacman -Sy
    return
}

#System Update:
function archupdate {
    sudo pacman -Syu
    return
}

#Minimal Installation (Arch-Repos Only):
function pacmininstall {
    sudo pacman -S kitty vim firefox git curl wget
    return
}

#Full Installation (Arch-Repos Only):
function pacfullinstall {
    sudo pacman -S alacritty kitty firefox zsh vim neovim exa bat git curl wget
    return
}

##AUR Helpers:
#Paru: (Has Rust Dependencies)
function paruinstall {
    sudo pacman -S --needed base-devel &&
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si
    return
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

#Repository Sync:
function debsync {
    sudo apt-get update
    return
}

#System Update:
function debupdate {
    sudo apt-get update &&
        sudo apt-get upgrade
    return
}

#Minimal Installation:
function aptmininstall {
    sudo apt-get install kitty vim firefox-esr git curl wget
    return
}

#Full Installation:
function aptfullinstall {
    sudo apt-get install vim neovim kitty firefox-esr git curl wget exa
    return
}

#Install Pacstall:
function instpacstall {
    sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
    return
}

#Install packages using Pacstall:
function pacstallinstall {
    pacstall -I alacritty emacs-git
    return
}

###RHEL Based:
function dnfupdate {
    sudo dnf upgrade
    return
}

function dnfinstall {
    sudo dnf install alacritty kitty zsh vim neovim lolcat exa bat
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
