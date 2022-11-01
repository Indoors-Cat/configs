# Dependencies:

## Config.py:

### Arch: 
#### Standard Repos:
<!-- Unordered List -->
* Browsers:
    * firefox
* Editors:
    * neovim
    * vim
* File Managers:
    * thunar
    * pcmanfm
* Music/Media Players:
    * cmus
    * VLC
    * playerctl (Dependnecy for many players)
* Run Launchers:
    * Rofi (Could replace with dmenu if desired)
* Terminal Emulators:
    * Alacritty
    * Kitty
*Misc:
    * nitrogen
    * pacman-contrib
    * picom
    * psutils
    * virt-manager
    * zsh
<!-- Bash Script Block -->
```bash
sudo pacman -S firefox neovim vim thunar pcmanfm cmus vlc playerctl rofi alacritty kitty nitrogen pacman-contrib picom psutils virt-manager zsh
```
#### Arch User Repository (AUR):
<!-- Unordered List -->
* Broswers: (These could also be built from source if desired)
    * brave-bin
    * librewolf-bin
* Editors:
    * vscodium-bin (Could also use 'vscodium' & build)
* Music/Media Players:
    * spotify
* Other
    * picom-jonaburg-git
<!-- Bash Script Block -->
```bash
paru -S brave-bin librewolf-bin vscodium-bin spotify picom-jonaburg-git
```

#### Other:
<!-- Unordered List -->
* st (Build from suckless.org or in .config/st/)
<!-- Bash Script Block -->
```bash
sudo make clean install
```
* Doom Emacs (git)
<!-- Bash Script Block -->
```bash
git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

---
## Config_extras.py
### Arch:
#### Standard Repositories:
<!-- Unordered List -->
* Browsers:
    * firefox
* Editors:
    * neovim
    * vim
* File Managers:
    * thunar
    * pcmanfm
* Music/Media Players:
    * cmus
    * vlc
    * playerctl (Dependency for many players)
* Run Launchers:
    * rofi (Could replace with dmenu if desired)
* Terminal Emulators:
    * Alacritty
    * Kitty
* Misc:
    * nitrogen
    * pacman-contrib
    * picom
    * psutils
    * virt-manager
    * zsh
<!-- Bash Script Block -->
```bash
sudo pacman -S firefox neovim vim thunar pcmanfm cmus vlc playerctl rofi alacritty kitty nitrogen pacman-contrib picom psutils virt-manager zsh
```
#### Arch User Repository:
<!-- Unordered List -->
* Browsers: (Could also build these from source if desired)
    * brave-bin
    * librewolf-bin
* Music/Media Players:
    * spotify
* Other:
    * picom-jonaburg-git
    * qtile-extras-git

#### Misc:
<!-- Unordered List -->
* Build:
    * st (From suckless.org or in .config/st)
    * dmenu (From suckless.org)
    * tabbed (From suckless.org)
* git:
    * Doom Emacs (git)
    <!-- Bash Script Block -->
    ```bash
    git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
    ```

