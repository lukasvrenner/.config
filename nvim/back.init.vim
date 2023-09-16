call plug#begin()

" Dracula Theme

" allows for easier commenting

" Improves syntax highlighting

" Auto-pairs brackets and parentheses

" Git integration

" Use release branch (recommended)
" Requires nodejs to work properly

call plug#end()

" Changes color to match dracula theme
highlight GitGutterAdd    guifg=#50fa7b ctermfg=2
highlight GitGutterChange guifg=#ffb86c ctermfg=3
highlight GitGutterDelete guifg=#ff5555 ctermfg=1

let g:indentLine_setColors = 0

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          "shows relative number instead of line number
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set formatoptions-=ro
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
" set backupdir=~/.cache/vim " Directory to store backup files.

" dvorak remap
noremap h h
noremap t j
noremap n k
noremap s l
noremap k n
noremap K N


" sets leader key, which can be used to run more shortcuts
let mapleader ='l'
" easy access to beginning and end of line
noremap - $


noremap <Enter> o<Esc>
noremap <Leader>O O<Esc>







