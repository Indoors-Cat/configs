#!/usr/bin/env bash

#V0.1.0

######Variables:
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
        mv /home/$USER/.bash_history /home/$USER/.config/bash/bash_history
    return
}

###ZSH:
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
#Arch:
function zshspacepac {
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1 &&
        cd spaceship-prompt-git &&
        makepkg -si &&
        #Powerline Fonts:
        git clone https://github.com/powerline/fonts.git --depth=1 &&
        cd fonts &&
        ./install.sh &&
        cd .. &&
        rm -rf fonts/
    return
}

#Debian/Ubuntu:
function zshspaceapt {
    sudo apt-get install curl fonts-powerline -y &&
        curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
    return
}

#RHEL/Fedora:
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
    cp -r "$dir"/.config/kitty /home/$USER/.config/kitty
}

####Editors:
###Vim:
function vimcfg {
    cp /home/$USER/.vimrc /home/$USER/.vimrc.bak ;
        cp .vimrc /home/$USER/.vimrc &&
        #Installing Vim-Plug:
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    return
}

###Neovim:
function nvimcfg {
    cp /home/$USER/.config/nvim/init.vim /home/$USER/.config/nvim/init.vim.bak ;
        mkdir -p /home/$USER/.config/nvim &&
        cp -r "$dir"/.config/nvim /home/$USER/.config &&
        #Installing Vim-Plug:
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    return
}

###Doom-Emacs:
function doomemacs {
    git clone --depth=1 https://github.com/hlissner/doom-emacs ~/.emacs.d &&
        ~/.emacs.d/bin/doom install
    return
}

#####Distro Specific:
####Arch/Arch-Based:
##Sync Repos:
function archsync {
    sudo pacman -Sy
    return
}

##Arch Update:
function archupdate {
    sudo pacman -Syu
    return
}

##Server Install: (Future)

##Minimal Install:
function pacmininstall {
    sudo pacman -S kitty vim firefox git curl wget
    return
}

##Full Installation:
function pacfullinstall {
    sudo pacman -S alacritty kitty firefox fish zsh vim neovim emacs exa bat git curl wget ripgrep
    return
}

###Aur Helpers:
##Aura: (Has Haskell Dependencies)
function aurainstall {
    sudo pacman -S base-devel git --needed &&
        cd /home/$USER/Downloads &&
        git clone https://aur.archlinux.org/aura-bin.git &&
        cd aura-bin &&
        makepkg -si
    return
}

##Paru: (Has Rust Dependencies)
function paruinstall {
    sudo pacman -S base-devel git --needed &&
        cd /home/$USER/Downloads &&
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si
    return
}

##Yay: (Has GO Dependencies)
function yayinstall {
    sudo pacman -S base-devel git --needed &&
        cd /home/$USER/Downloads &&
        git clone https://aur.archlinux.org/yay.git &&
        cd yay &&
        makepkg -si
    return
}

####Debian/Debian-Based: (Future Version)

#####Installation:
echo "What distro are we installing onto?"
echo "Arch, or Debian?"
read distro

####Arch/Arch-Based Distros:
if [ $distro = "Arch" ]; then
    echo "Full or Minimal Installation?"
    read answer

    if [ $answer = "Full" ]; then
        archupdate
        pacfullinstall
        paruinstall
        bashcfg
        zshcfg
        zshplugincfg
        zshspacepac
        fishcfg
        alaccfg
        kittycfg
        vimcfg
        nvimcfg
        doomemacs
    elif [ $answer = "Minimal" ]; then
        archupdate
        pacmininstall
        bashcfg
    else
        echo "Error!"
    fi
fi

echo "Script has now completed"
echo "Exiting now"
exit 0
