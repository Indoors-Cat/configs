# Dependencies for Z-Shell

## Arch Linux:
### Arch Repositories:
<!-- Unordered List -->
* bat
* duf 
* dust
* exa
* liquidctl
* neofetch
* neovim
* procs
* ripgrep
* vim
* zsh
<!-- Bash Script Block -->
```bash
sudo pacman -S bat duf dust exa liquidctl neofetch neovim procs ripgrep vim zsh
```
### Arch User Repository:
<!-- Unordered List -->
* surfshark-vpn
* timeshift
    * Can use timeshift-bin if desired
<!-- Bash Script Block -->
```bash
sudo paru -S surfshark-vpn timeshift
```

### Other:
<!-- Unordered List -->
* Doom Emacs(git)
<!-- Bash Script Block -->
```bash
git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```
* paru(makepkg)
    * Could use /paru-bin.git instead for prebuilt binary
<!-- Bash Script Block -->
```bash
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si
```
* yay(makepkg)
    * Could use /yay-bin.git instead for prebuilt binary
<!-- Bash Script Block -->
```bash
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```
---
## Debian/Ubuntu:
### Standard Repositories:
<!-- Unordered List -->
* bat
* exa
* liquidctl
* neofetch
* neovim(This is version 0.4.4-1 which does NOT use Lua)
* ripgrep
* timeshift
* vim
* zsh
<!-- Bash Script Block -->
```bash
sudo apt-get update
sudo apt install bat exa liquidctl neofetch neovim ripgrep timeshift vim zsh
```

### Pacstall:
<!-- Unordered List -->
* duf-deb
* dust-bin
* neovim(This is version 0.8.0)
* surfshark-gui-deb
<!-- Bash Script Block -->
```bash
pacstall -I duf-deb dust-bin neovim surfshark-gui-deb
```

### Other:
<!-- Unordered List -->
* Doom Emacs(git)
<!-- Bash Script Block -->
```bash
git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```
* pacstall(wget)
<!-- Bash Script Block -->
```bash
sudo bash -c "$(wget -q https://git.io/JsADh -O -)"
```
* procs(cargo)
<!-- Bash Script Block -->
```bash
cargo install procs
```

## Fedora: (Future)

---
## Plugins for ZSH:
### ZSH-Syntax-Highlighting:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```
#### Source in your .zshrc
Example:
<!-- Bash Script Block -->
```bash
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### ZSH-Auto-Suggestions:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions
```
#### Source in your .zshrc
Example:
<!-- Bash Script Block -->
```bash
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

### ZSH-Auto-Notify:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git
```
#### Source in your .zshrc
Example:
<!-- Bash Script Block -->
```bash
source ~/.config/zsh/zsh-auto-notify/zsh-auto-notify.zsh
```

### ZSH-History-Substring-Search:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/zsh-users/zsh-history-substring-search.git
```
#### Source in your .zshrc
Example:
<!-- Bash Script Block -->
```bash
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
```

### ZSH-You-Should-Use:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
```
#### Source in your .zshrc
Example:
<!-- Bash Script Block -->
```bash
source ~/.config/zsh/zsh-you-should-use/zsh-you-should-use.zsh
```

### Spaceship Prompt: (Requires Powerline Fonts)
---
### Arch:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
cd spaceship-prompt-git && makepkg -si
```
#### Add to your .zshrc:
Example:
<!-- Bash Script Block -->
```bash
autoload -U promptinit; promptinit 
prompt spaceship
```
### Debian/Ubuntu:
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git
```
#### Source in your .zshrc:
Example:
<!-- Bash Script Block -->
```bash
source ~/.config/zsh/spaceship-prompt/spaceship.zsh
```

### Powerline Fonts: (Required by Spaceship Prompt)
#### Clone the repository:
<!-- Bash Script Block -->
```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts/
```