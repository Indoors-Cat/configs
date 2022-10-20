----- Neovim Configuration: -----

---- Setting local variables:
local g     = vim.g
local o     = vim.o
local opt   = vim.opt
local A     = vim.api

---- Better Editing UI:
-- Number of lines to use for the command-line:
o.cmdheigtht = 1
-- Number of lines to use for the command-line window:
o.cmdwinheight = 6
-- Highlight the text line of the cursor:
o.cursorline = false
-- Tell equalalways when to be applied: ('ver', 'hor', or 'both'
o.eadirection = 'both'
-- Setting new splits to be equal upon opening:
o.equalalways = true
-- Show characters to display different types of tabs:
o.list = true
-- Enable Line Numbers:
o.number = true
-- Space between line numbers & left border of window:
o.numberwidth = 1
-- Make line numbers relative to cursor location:
o.relativenumber = false
-- When & how to draw the signcolumn ('auto', 'yes', or 'no')
o.signcolumn = 'auto'

---- Better Editing Options:
-- Copy indent from current line when starting a new line:
o.autoindent = true
-- If file is changed outside of nvim while open in nvim, automatically read the file again:
o.autoread = true
-- Enable automatic C program indenting:
o.cindent = true
-- Make Neovim & Host clipboard play nicely with one another:
o.clipboard = 'unnamedplus'
-- Use spaces to create a 'tab':
o.expandtab = true
-- Case insensitive searching UNLESS /C or capital is in search:
o.ignorecase = true
-- Enable mouse support: (Can do by mode, or all with 'a')
opt.mouse = 'a'
-- Number of spaces to use for (auto)indent steps:
o.shiftwidth = 4
-- Number of spaces that <Tab> counts for while editing:
o.softtabstop = -1 --If negative, shiftwidth value is used
-- Override the ignorecase option if containing upper case characters:
o.smartcase = true
-- 
o.smarttab = true
-- Number of spcaes that a <Tab> counts for:
o.tabstop = 4
-- Max width of text that is being inserted:
o.textwidth = 100
-- Wrap lines longer than width of the window:
o.wrap = true

---- Buffer & Tab Options:
-- What happens when a buffer is no longer visible: ('hide', 'unload', 'delete', or 'wipe')
o.bufhidden = 'hide'
-- Show buffer list:
o.buflisted = true
-- Raise a dialog asking to save unsaved changes to buffer when leaving:
o.confirm = true
--
o.splitbelow = true
--
o.splitright = true

---- Undo & Backup Options:
-- Make a backup before overwriting a file:
o.backup = false
-- Use a swapfile for the buffer:
o.swapfile = false
-- Automatically save undo history to an undo file when writing a buffer to a file:
o.undofile = true
-- Make a backup before overwriting a file, then delete once successfully written:
o.writebackup = false

---- Misc:
-- Upate Time Setings:
o.timeoutlen = 500
o.updatetime = 200
-- Commandline History Size:
o.history = 50

--------------------
--- Keybindings: ---
--------------------
----- Key:
	-- map('mode', 'new keybinding', 'what we are remapping')
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end
--- Setting leader key to Space:
g.mapleader = ' '
g.maplocalleader = ' '

---- Buffers:
--- Moving through buffers:
map('n', '<leader>bn', '<CMD>bnext<CR>')
map('n', '<leader>bp', '<CMD>bprev<CR>')

---- Movements:
--- Mimic Bash Movements:
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

---- Splits:
--- Manipulating through Splits with CTRL + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
--- Manipulating Split Orientation:
map('n', '<leader>th', '<C-w>t<C-w>K') --Change Vertical to Horizontal
map('n', '<leader>tv', '<C-w>t<C-w>H') --Change Horizontal to Vertical

---- Tabs:
--- Manipulating tabs:
map('n', '<leader>to', '<CMD>tabnew<CR>')
map('n', '<leader>tn', '<CMD>tabnext<CR>')
map('n', '<leader>tp', '<CMD>tabprev<CR>')
map('n', '<leader>tc', '<CMD>tabclose<CR>')
--- Moving through tabs with <leader> + {1,2,3,4,5,6}
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')

---- Misc:
--- Faster way to escape:
map('i', 'jk', '<ESC>')
map('v', 'jk', '<ESC>')

--- Creating tradition tabs:
map('i', '<C-t>', '<C-v><Tab>')

--- Load Recent Sessions:
map('n', '<leader>sl', '<CMD>SessionLoad<CR>')

-------------------------
----- Plugins: -----
-------------------------
-- Move plugins to ~/.config/nvim/lua/plugins.lua
require('plugins')

---- Plugin Keybindings:
---Telescope:
map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>pp', "<CMD>lua require'telescope.builtin'.planets{}<CR>")
map('n', '<leader>bl', '<CMD>Telescope buffers<CR>')
map('n', '<leader>cl', '<CMD>Telescope commands<CR>')
map('n', '<leader>ch', '<CMD>Telescope command_history<CR>')
map('n', '<leader>ht', '<CMD>Telescope help_tags<CR>')
map('n', '<leader>cs', '<CMD>Telescope colorscheme<CR>')
map('n', '<leader>sf', '<CMD>Telescope current_buffer_fuzzy_find<CR>')

---Nvim-Tree
map('n', '<leader>tt', '<CMD>NvimTreeToggle<CR>')
map('n', '<leader>tr', '<CMD>NvimTreeRefresh<CR>')

---Which-Key:
map('n', '<leader>wk', "<CMD>WhichKey <leader><CR>")
