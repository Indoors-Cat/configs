" __  __                 _                        ____             __ _
"|  \/  |_   _    __   _(_)_ __ ___  _ __ ___    / ___|___  _ __  / _(_) __ _
"| |\/| | | | |   \ \ / / | '_ ` _ \| '__/ __|  | |   / _ \| '_ \| |_| |/ _` |
"| |  | | |_| |    \ V /| | | | | | | | | (__   | |__| (_) | | | |  _| | (_| |
"|_|  |_|\__, |___(_)_/ |_|_| |_| |_|_|  \___|___\____\___/|_| |_|_| |_|\__, |
"        |___/_____|                        |_____|                     |___/
"
"""
set nocompatible              " be iMproved, required
filetype off                  " required
"set shell=/bin/bash
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug for Managing Plugins
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a Directory for Plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" {{Themes}}
    "Plug 'drewtempelmeyer/palenight.vim'            		" palenight theme
    "Plug 'sonph/onehalf', { 'rtp': 'vim' }          		" onehalf(dark/light) theme
    "Plug 'dracula/vim', {'as': 'dracula'}           		" dracula theme
    "Plug 'Rigellute/rigel'                          		" lightline.vim plugin
    
    
" {{Utilities}}
    "Plug 'itchyny/lightline.vim'                    		" statusline plugin
    "Plug 'frazrepo/vim-rainbow'                     		" changes the colors of parenthesis & brackets to help differentiate

    " Initialize plugin system
call plug#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vim-plug for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme palenight
set nobackup						        " Disables auto backups
set noswapfile						        " Disables swap
set t_Co=256						        " Set if terminal supports 256 colors
set number 			                                " Display line numbers
set clipboard=unnamedplug				        " Enables copy/paste between vim and other programs
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap ESC to 'jk'
:imap jk <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => StatusLine 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" The lightline.vim theme 
"let g:rigel_lightline = 1
"let g:lightline = { 'colorscheme': 'rigel'}

"set laststatus=2                                    		" for lightline plugin
"set noshowmode                                      		" hide statusbar while using lightline.vim
" Always show statusline set laststatus=2 
" Uncomment to prevent non-normal modes showing in powerline and below powerline. 
" set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, and Indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab							" Use spaces insteaf of tabs
set smarttab							" 
set shiftwidth=4						" One tab == four spaces
set tabstop=4 							" One tab == four spaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr
