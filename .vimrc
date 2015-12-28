set nocompatible          " We're running Vim, not Vi!
set encoding=utf-8

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
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'orenhe/pylint.vim'
Bundle 'avakhov/vim-yaml'
Bundle 'kien/ctrlp.vim'
Bundle 'YankRing.vim'
Bundle 'AutoComplPop'
Bundle 'satanas/rename.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'elzr/vim-json'
Bundle 'mustache/vim-mustache-handlebars'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" General
set cursorline
set number
set numberwidth=5
set colorcolumn=120
set spell
set history=100
set showmatch  " Show matching brackets.
set incsearch  " Incremental searches
set ignorecase  " Ignore case in searches
set smartcase  " Ignore case except when you type upper case letters
set hlsearch  " Highlight searches
set mat=5  " Bracket blinking.
set list
set listchars=tab:→-,trail:·
set scrolljump=5  " Lines to scroll when cursor leaves screen
set scrolloff=3  " when scrolling, keep cursor 3 lines away from screen border
set noswapfile  " disable swap - all buffers will be opened in memory
set mouse=a  " enable mouse scrolling in OSX

" Formatting
set autoindent
set expandtab
set nowrap  " Line wrapping off
set modeline
set ls=2  " Always show status bar
set ts=4  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=4  " Tabs under smart indent
set softtabstop=4
set pastetoggle=<F12>  " pastetoggle (sane indentation on pastes)

" Clipboard
set clipboard=unnamed

syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:airline_theme='luna'
"let g:airline_theme='powerlineish'

let g:vim_json_syntax_conceal = 0

autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 "foldmethod=indent foldlevel=99
autocmd FileType ruby setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=indent
autocmd FileType javascript setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=syntax
autocmd FileType css setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=syntax
autocmd FileType php setlocal ts=4 softtabstop=4 "foldmethod=syntax
autocmd FileType cpp setlocal ts=4 softtabstop=4 "foldmethod=syntax
autocmd FileType hpp setlocal ts=4 softtabstop=4 "foldmethod=syntax
autocmd FileType scala setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=indent
autocmd FileType html setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=indent
autocmd FileType json setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=indent
autocmd FileType coffee setlocal ts=2 shiftwidth=2 softtabstop=2 "foldmethod=indent
"autocmd FileType python compiler pylint

filetype plugin indent on " Enable filetype-specific indenting and plugins

" Shorcuts for tabs
:nmap <C-tab> :tabnext
:nmap <C-S-tab> :tabprevious
:nmap <C-t> :tabnew .<CR>
:nmap <C-o> :CtrlP<CR>
map <F3> :NERDTreeToggle<CR>
