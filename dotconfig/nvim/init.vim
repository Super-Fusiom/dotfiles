let mapleader=" "
" System Clipboard
" AutoCMD
" center screen
autocmd InsertEnter * norm zz
" Trailing remove whitespace
autocmd BufWritePre * %s/\s\+$//e


" Spell check
map <leader>s :setlocal spell! spellang=en_nz<CR>



" Basic settings
set mouse=a
syntax on
set ignorecase
set smartcase
set encoding=utf-8
set number relativenumber
set termguicolors
" Tab spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set cursorline
set cursorcolumn
" Autocomplete
set wildmode=longest,list,full
" Fix splitting
set splitbelow splitright
" Vim-airline


