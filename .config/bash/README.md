# Dependencies for Bournce Again(Bash) Shell

## Arch Linux:
### Arch Repositories:
<!-- Unordered List -->
* bat
* duf
* dust
* exa
* liquidctl
* neovim
* procs
* ripgrep
* vim
* zsh

<!-- Bash Script Block -->
```bash
sudo pacman -S bat duf dust exa liquidctl neovim procs ripgrep vim zsh
```

### Arch User Repository:
<!-- Unordered List -->
* surfshark-vpn
* timeshift (Optionally could use timeshift-bin)

<!-- Bash Script Block -->
```bash
sudo paru -S surfshark-vpn timeshift
```

### Other:
#### git:
<!-- Unordered List -->
* doom emacs(git)
<!-- Bash Script Block -->
```bash
git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

#### makepkg:
<!-- Unordered List -->
* paru(makepkg)
    * Use /paru-bin for precompiled binary
<!-- Bash Script Block -->
```bash
git clone https://aur.archlinux.org/paru.git 
cd paru && makepkg -si
```
* yay(makepkg)
    * Use /yay-bin for precompiled binary
<!-- Bash Script Block -->
```bash
git clone https://aur.archlinux.org/yay.git 
cd yay && makepkg -si
```

## Debian/Ubuntu:
### Standard Repositories:
<!-- Unordered List -->
* bat
* exa
* liquidctl
* neofetch
* neovim(This version is 0.4.4-1 which does NOT use Lua)
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
#### Git:
<!-- Unordered List -->
* doom emacs
<!-- Bash Script Block -->
```bash
git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```
#### Misc:
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


**Fedora: (Future)
