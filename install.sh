#!/usr/bin/env bash

#V0.1.2

#####Variables:
dir=$(pwd)

######Shell Functions:
#####Distro Agnostic:
####Shells:
###Bash:
function bashcfg {
    cp /home/$USER/.bashrc /home/$USER/.bashrc.bak &&
        cp "$dir"/.bashrc /home/$USER/.bashrc &&
        mkdir -p /home/$USER/.bashrc &&
        cp -r "$dir"/.config/bash /home/$USER/.config &&
        mv /home/$USER/.bash_history home/$USER/.config/bash_history
    return
}

###ZSH: (Dependencies=git)
function zshcfg {
    cp /home/$USER/.zshrc /home/$USER/.zshrc.bak ;
        cp "$dir"/.zshrc /home/$USER/.zshrc &&
        mkdir -p /home/$USER/.config/zsh &&
        cp -r "$dir"/.config/zsh /home/$USER/.config/
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
#Arch: (Dependencies=git)
function zshspacepac {
    cd /home/$USER/Downloads &&
        #Spaceship Prompt:
        git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1 &&
        cd spaceship-prompt-git &&
        makepkg -si &&
        cd .. &&
        #Powerline Fonts:
        git clone https://github.com/powerline/fonts.git --depth=1 &&
        cd fonts &&
        ./install.sh &&
        cd .. &&
        rm -rf fonts/
    return
}

#Debian/Ubuntu: (Dependencies=curl)
function zshspaceapt {
    sudo apt-get install curl fonts-powerline -y &&
        curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
    return
}

#RHEL/Fedora: (Dependencies=curl)
function zshspacednf {
    sudo dnf install curl powerline-fonts -y &&
        curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
    return
}

###Fish
function fishcfg {
    cp /home/$USER/.config/fish/config.fish /home/$USER/config.fish.bak ;
        mkdir -p /home/$USER/.config/fish &&
        cp -r "$dir"/.config/fish/config.fish /home/$USER/.config/fish/config.fish
    return
}

####Terminals:
###Alacritty:
function alaccfg {
    cp -r "$dir"/.config/alacritty /home/$USER/.config/
    return
}

###Kitty:
function kittycfg {
    cp -r "$dir"/.config/kitty /home/$USER/.config
    return
}

####Editors:
###Vim: (Dependencies=curl)
function vimcfg {
    cp /home/$USER/.vimrc /home/$USER/.vimrc.bak ;
        cp .vimrc /home/$USER/.vimrc &&
        #Installing Vim-Plug:
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    return
}

###Neovim: (Dependencies=curl)
function nvimcfg {
    cp /home/$USER/.config/nvim/init.vim /home/$USER/.config/nvim/init.vim.bak ;
        mkdir -p /home/$USER/.config/nvim &&
        cp -r "$dir"/.config/nvim /home/$USER/.config &&
        #Installing Vim-Plug:
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    return
}

###Doom-Emacs: (Dependencies=git)
function doomemacs {
    git clone --depth=1 https://github.com/hlissner/doom-emacs ~/.emacs.d &&
        ~/.emacs.d/bin/doom install
    return
}

#####Distro Specific:
####Arch:
###Sync Repos:
function archsync {
    sudo pacman -Sy
    return
}

###Arch Update System:
function archupdate {
    sudo pacman -Syu --needed
    return
}

###Server Installation: (Future)
#function pacserverinstall {
    #sudo pacman -S sudo vim git curl
    #return
#}

###Minimal Installation:
function pacmininstall {
    sudo pacman -S sudo xfce4-terminal vim firefox git curl wget htop
    return
}

###Full Installation:
function pacfullinstall {
   sudo pacman -S sudo alacritty kitty firefox zsh vim neovim emacs exa bat git curl wget ripgrep htop
   return
}

###AUR Helpers:
##Aura (Has Haskell Dependencies): (Dependencies=git)
function aurainstall {
    sudo pacman -S base-devel git --needed &&
        cd /home/$USER/Downloads &&
        git clone https://aur.archlinux.org/aura-bin.git &&
        cd aura-bin &&
        makepkg -si
    return
}

##Paru (Has Rust Dependencies): (Dependencies=git)
function paruinstall {
    sudo pacman -S base-devel git --needed &&
        cd /home/$USER/Downloads &&
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si
    return
}

##Yay (Has GO Dependencies): (Dependencies=git)
function yayinstall {
    sudo pacman -S base-devel git --needed &&
        cd /home/$USER/Downloads &&
        git clone https://aur.archlinux.org/yay.git &&
        cd yay &&
        makepkg -si
    return
}

###Desktop Environements/Window Managers:
##Display Servers:
#Xorg:
function xorginstall {
    sudo pacman -S xorg
    return
}

#Wayland:
function waylandinstall {
    sudo pacman -S wayland
    return
}

##Desktop Environements:
#XFCE4:
function xfceinstall {
    sudo pacman -S xorg wayland xfce4
    return
}

#KDE Plasma:
function kdeinstall {
    sudo pacman -S xorg wayland plasma sddm &&
        sudo systemctl enable sddm &&
        sudo systemctl start sddm
    return
}

##Window Managers:
#Qtile:
function qtileinstall {
    sudo pacman -S qtile
    return
}

#i3-Gaps:
function i3gapsinstall {
    sudo pacman -S i3gaps
    return
}

####Debian/Debian-Based: (Future)

#####Installation:
echo "What distro are we installing onto?"
echo "Arch, or Debian?"
read distro

####Arch/Arch-Based Distros:
if [ $distro = "Arch" ]; then
    echo "Full or Minimal Installation?"
    read install

    if [ $install = "Minimal" ]; then
        archupdate
        pacmininstall
        bashcfg

        echo "Would you like an AUR helper?"
        read aurhelp

        if [ $aurhelp = "yes" ]; then
        echo "What AUR Helper would you like?"
        echo "aura(Haskell), paru(Rust), or yay(GO)?"
        read aurhelper

            if [ $aurhelper = "aura" ]; then
                aurainstall
            elif [ $aurhelper = "paru" ]; then
                paruinstall
            elif [ $aurhelper = "yay" ]; then
                yayinstall
            else
                echo "Error in submission! Exiting now!"
            fi
        elif [ $aurhelp = "no" ]; then
           echo "No aur helper selected. Proceeding to next step"
        else
            echo "Error in submission! Exiting now!"
        fi

    elif [ $install = "Full" ]; then
        archupdate
        pacfullinstall
        bashcfg
        zshcfg
        zshplugincfg
        zshspacepac
        alaccfg
        kittycfg
        vimcfg
        nvimcfg
        doomemacs

        echo "What AUR Helper would you like?"
        echo "aura(Haskell), paru(Rust), or yay(GO)?"
        read helper
        if [ $helper = "aura" ]; then
           aurainstall
        elif [ $helper = "paru" ]; then
            paruinstall
        elif [ $helper = "yay" ]; then
            yayinstall
        else
            echo "Error in submission! Exiting now!"
        fi

        echo "What Desktop Environment/Window Manager would you like?"
        read dewm
        if [ $dewm = "xfce4" ]; then
            xfceinstall
        elif [ $dewm = "plasma" ]; then
            kdeinstall
        elif [ $dewm = "qtile" ]; then
            qtileinstall

            echo "What display server would you like?"
            read dispserver

            if [ $dispserver = "xorg" ]; then
                xorginstall
            elif [ $dispserver = "wayland" ]; then
                waylandinstall
            else
                echo "Error in submission! Exiting now!"
            fi
        elif [ $dewm = "i3-gaps" ]; then
            i3install

            echo "What display server would you like?"
            read dispserver

            if [ $dispserver = "xorg" ]; then
                xorginstall
            elif [ $dispserver = "wayland" ]; then
                waylandinstall
            else
                echo "Error in submission! Exiting now!"
            fi
        else
            echo "Error in submission! Exiting now!"
        fi
    else
        echo "Error in submission! Exiting now!"
    fi
fi
