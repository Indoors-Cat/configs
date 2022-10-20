*Dependencies for Bournce Again(Bash) Shell

**Arch Linux:
    ***Arch Repositories:
        bat
        duf
        dust
        exa
        liquidctl
        neofetch
        neovim
        procs
        ripgrep
        vim
        zsh

    ***AUR:
        surfshark-vpn
        timeshift

    ***Other:
        doom emacs(git)
            git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
            ~/.emacs.d/bin/doom install
        paru(makepkg)
            git clone https://aur.archlinux.org/paru.git --Use /paru-bin.git for precombiled binary
            cd paru && makepkg -si
        yay(makepkg)
            git clone https://aur.archlinux.org/yay.git --Use /yay-bin.git for precompiled binary
            cd yay & makepkg -si

**Debian/Ubuntu:
    ***Standard Repositories:
        bat
        exa
        liquidctl
        neofetch
        neovim(This is version 0.4.4-1 which does NOT use the Lua language)
        ripgrep
        timeshift
        vim
        zsh

    ***Pacstall:
        duf-deb
        dust-bin
        neovim(This is version 0.8.0)
        surfshark-gui-deb

    ***Other:
        doom emacs(git)
            git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
            ~/.emacs.d/bin/doom install
        pacstall(wget)
            sudo bash -c "$(wget -q https://git.io/JsADh -O -)"
        procs(cargo)

**Fedora: (Future)
