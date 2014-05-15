set encoding=utf-8
set nocompatible          " We're running Vim, not Vi!
filetype off

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'orenhe/pylint.vim'
Bundle 'avakhov/vim-yaml'
Bundle 'kien/ctrlp.vim'
"Bundle 'aklt/plantuml-syntax'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'YankRing.vim'
Bundle 'AutoComplPop'
Bundle 'satanas/rename.vim'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"set statusline=%t%m%r%h%w\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set cursorline
set number
set numberwidth=5
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:Powerline_symbols = 'fancy'

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
set incsearch  " Incremental searches
set ignorecase " Ignore case in searches
set smartcase " Ignore case except when you type upper case letters
set hlsearch  " Highlight searches
set mat=5  " Bracket blinking.
set list
set listchars=tab:→-,trail:·
set scrolloff=3 " when scrolling, keep cursor 3 lines away from screen border
set colorcolumn=120
"set noswapfile " disable swap - all buffers will be opened in memory
"set mouse=a " enable mouse scrolling in OSX

syntax on
filetype plugin indent on " Enable filetype-specific indenting and plugins
autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 "foldmethod=indent foldlevel=99
autocmd FileType ruby setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=indent
autocmd FileType javascript setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=syntax
autocmd FileType css setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=syntax
autocmd FileType php setlocal ts=4 softtabstop=4 "foldmethod=syntax
autocmd FileType cpp setlocal ts=4 softtabstop=4 "foldmethod=syntax
autocmd FileType hpp setlocal ts=4 softtabstop=4 "foldmethod=syntax
"autocmd FileType python compiler pylint

" Shorcuts for tabs
:nmap <C-tab> :tabnext
:nmap <C-S-tab> :tabprevious
:nmap <C-t> :tabnew .<CR>
:nmap <C-o> :CtrlP<CR>
map <F3> :NERDTreeToggle<CR>
