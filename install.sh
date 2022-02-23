#!/usr/bin/env bash

#V0.5.0

#####Shell Functions:
####Distro Agnostic:
##Shells:
#Bash Shell:
function bashcfg {
    cp /home/$USER/.bashrc /home/$USER/.bashrc.bak &&
        cp .bashrc /home/$USER/.bashrc &&
        cp -r .config/bash/ /home/$USER/.config/ &&
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
        git clone https://github.com/zsh-users/zsh-autosuggestions
    return
}

##Editors:
#Vim:
function vimcfg {
    cp /home/$USER/.vimrc /home/$USER/.vimrc.bak &&
        cp .vimrc /home/$USER/.vimrc
    return
}

#Nvim:
function nvimcfg {
    cp /home/$USER/.config/nvim/init.vim /home/$USER/.config/nvim/init.vim.bak &&
        cp -r .config/nvim /home/$USER/.config/
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

###Arch-Based:
function archupdate {
    sudo pacman -Syu
    return
}

function pacfullinstall {
    sudo pacman -S alacritty kitty zsh vim neovim lolcat exa bat git
    return
}

function pacmininstall {
    sudo pacman -S alacritty vim curl wget git
    return
}

function paruinstall {
    sudo pacman -S --needed base-devel &&
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si
    return
}

function aurpkginstall {
    paru -S *insert packages here*
    return
}

function zshspace {
    #Spaceship Prompt with Powerline fonts:
    git clone https://aur.archlinux.org/spaceship-prompt-git.git -depth=1 &&
        cd spaceship-prompt-git &&
        makepkg -si &&
        git clone https://github.com/powerline/fonts.git -depth=1 &&
        cd fonts &&
        install.sh &&
        cd .. &&
        rm -r fonts/
    return
}

###Debian-Based:
function debupdate {
    sudo apt-get update && sudo apt-get upgrade
    return
}

function aptfullinstall {
    sudo apt-get install neofetch lolcat kitty vim curl wget qalc exa bat
    return
}

function aptmininstall {
    sudo apt-get install kitty vim curl wget git
}

function instpacstall {
    sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)" &&
        pacstall -I alacritty bat emacs-git neovim-git
    return
}

###RHEL-Based:
function fedupdate {
    sudo dnf upgrade
    return
}

function dnfinstall {
    sudo dnf install alacritty kitty zsh vim neovim lolcat exa bat
    return
}

#####Installation:
echo "What distro are we installing onto?"
read distro

###Arch/Arch-Based Distros:
if [ $distro = "Arch" ]; then
    echo "Full or Minimal installation?"
    read answer

    if [ $answer = "full" ]; then
        bashcfg
        zshcfg
        vimcfg
        nvimcfg
        alaccfg
        kittycfg
        archupdate
        pacfullinstall
        paruinstall
        aurpkginstall
        zshplugincfg
        zshspace
    elif [ $answer = "minimal" ]; then
        bashcfg
        vimcfg
        alaccfg
        archupdate
        pacmininstall
    else
        echo "Error in submission"
        return
    fi

###Debian/Debian-Based Distros:
elif [ $distro = "Debian" ]; then
    echo "Full or Minimal installation?"
    read answer

    if [ $answer = "full" ]; then
        bashcfg
        zshcfg
        vimcfg
        nvimcfg
        alaccfg
        kittycfg
        debupdate
        aptinstall
        installpacstall
    elif [ $answer = "minimal" ]; then
        bashcfg
        vimcfg
        kittycfg
        debupdate
    else
        echo "Error in submission"
        return
    fi

###Fedora/RHEL-Based Distros:
elif [ $distro = "Fedora" ]; then
    echo "Full or Minimal Installation?"
    read answer

    if [ $answer = "full" ]; then
        bashcfg
        zshcfg
        vimcfg
        nvimcfg
        alaccfg
        kittycfg
        dnfupdate
        dnfintsall
    elif [ $answer = "minimal" ]; then
        bashcfg
        vimcfg
        kittycfg
        dnfupdate
    fi
else
    echo "Unsupported Distro. Exiting installation now."
    return
fi

exit 0
echo "Script has now exited"
