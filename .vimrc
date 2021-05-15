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
set shell=/bin/bash
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug for Managing Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a Directory for Plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
    Plug 'itchyny/lightline.vim'
    Plug 'frazrepo/vim-rainbow'
" {{Themes}}
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'dracula/vim', {'as': 'dracula'}
    

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
colorscheme palenight
set nobackup						                " Disables auto backups
set noswapfile						                " Disables swap
set t_Co=256						                " Set if terminal supports 256 colors
set number 			                                " Display line numbers
set clipboard=unnamedplug				            " Enables copy/paste between vim and other programs
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap ESC to 'jk'
:imap jk <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => StatusLine 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme 
let g:lightline = {
	\ 'colorscheme': 'dracula',
 	\ } 

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
" => Colors & Theming
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
"highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
"highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
"highlight Statement        ctermfg=2    ctermbg=none    cterm=none
"highlight Directory        ctermfg=4    ctermbg=none    cterm=none
"highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
"highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
"highlight NERDTreeClosable ctermfg=2
"highlight NERDTreeOpenable ctermfg=8
"highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
"highlight Constant         ctermfg=12   ctermbg=none    cterm=none
"highlight Special          ctermfg=4    ctermbg=none    cterm=none
"highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
"highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
"highlight String           ctermfg=12   ctermbg=none    cterm=none
"highlight Number           ctermfg=1    ctermbg=none    cterm=none
"highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none 
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none 
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none 
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none 
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none 
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none 
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none 
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none 
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none 
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline 
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline 
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline 
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline 
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none 
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none 
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none 
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none 
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none 
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none 
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none 
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none 
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none 
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none 
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none 
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none 
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Mouse Scrolling 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr



