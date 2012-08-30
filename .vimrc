set statusline=%t%m%r%h%w\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set cursorline
set number
set numberwidth=5
colorscheme vibrantink

" Formatting (some of these are for coding in C and C++)
set modeline
set ls=2  " Always show status bar
set ts=4  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=4  " Tabs under smart indent
set softtabstop=4
set autoindent
"set smarttab
set expandtab
set nowrap  " Line wrapping off
set showmatch  " Show matching brackets.
set hlsearch  " Highlight searches
set mat=5  " Bracket blinking.
set list
set listchars=tab:→-,trail:·
set nocompatible          " We're running Vim, not Vi!
syntax on
filetype plugin indent on " Enable filetype-specific indenting and plugins
autocmd FileType ruby setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4

" Shorcuts for tabs
:nmap <C-tab> :tabnext
:nmap <C-S-tab> :tabprevious
:nmap <C-t> :tabnew

