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

*Plugins for ZSH:
    ** zsh-syntax-highlighting:
        *** git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
        *** source in your .zshrc
    **** example: source ~/.config/zsh/zsh-syntax-highlighting/zshsyntax-highlighting.zsh

    ** zsh-auto-suggestions:
        *** git clone https://github.com/zsh-users/zsh-autosuggestions
        *** source in your .zshrc
    **** example: source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

    ** zsh-auto-notify:
        *** git clone https://github.com/MichaelAquilina/zsh-auto-notify.git
        *** source in your .zshrc
    **** example: source ~/.config/zsh/zsh-auto-notify/zsh-auto-notify.zsh

    ** zsh-history-substring-search:
        *** git clone https://github.com/zsh-users/zsh-history-substring-search.git
        *** source in your .zshrc
    **** example: source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

    ** zsh-you-should-use:
        *** git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
        *** source in your .zshrc
    **** example: source ~/.config/zsh/zsh-you-should-use/zsh-you-should-use.zsh

    ** Spaceship Prompt: (Has dependency on powerline fonts)
        *** Arch:
            **** git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
            **** cd spaceship-prompt-git
            **** makepkg -si
            **** add these lines to your .zshrc:
            autoload -U promptinit; promptinit
            prompt spaceship

        ***Debina/Ubuntu:
            **** git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git
            **** source in your .zshrc
        ***** example: source ~/.config/zsh/spaceship-prompt/spaceship.zsh
 
    ** Powerline fonts: (Required for Spaceship Prompt)
        *** git clone https://github.com/powerline/fonts.git --depth=1
        *** cd fonts && ./install.sh
        *** cd ..
        *** rm -rf fonts
