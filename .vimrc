syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set nocompatible          " We're running Vim, not Vi!
set encoding=utf-8

" General
set cursorline
set number
set numberwidth=5
set colorcolumn=120
set spell
set history=100
set showmatch  " Show matching brackets.
set ignorecase  " Ignore case in searches
set smartcase  " Ignore case except when you type upper case letters

set mat=5  " Bracket blinking.
set list
set listchars=tab:→-,trail:·
set scrolljump=5  " Lines to scroll when cursor leaves screen
set scrolloff=3  " when scrolling, keep cursor 3 lines away from screen border
set noswapfile                  " Disable swap - all buffers will be opened in memory
set mouse=a                     " Enable mouse scrolling in OSX

set hlsearch                    " Highlight search results
set incsearch                   " Incremental searches (search as you type)

" Formatting
set autoindent                  " Respect indentation when starting a new line.
set expandtab                   " Expand tabs to spaces. Essential in Python.
set tabstop=4                   " Number of spaces tab is counted for.
set shiftwidth=4                " Number of spaces to use for autoindent.
set backspace=2                 " Fix backspace behavior on most terminals.

set nowrap                      " Line wrapping off
set nomodeline                  " We want modeline off (for security reasons)
set modelines=0

set softtabstop=4
set pastetoggle=<F12>  " pastetoggle (sane indentation on pastes)

" UI/Interface
set foldmethod=indent           " Indentation-based folding.
set laststatus=2                " Always show status bar
set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.

" Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Map arrow keys nothing so I can get used to hjkl-style movement.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Clipboard
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.

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
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
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
" Bundle 'JamshedVesuna/vim-markdown-preview'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_theme_bg='dark'

let g:vim_json_syntax_conceal = 0
" let vim_markdown_preview_toggle=2
" let vim_markdown_preview_github=1


autocmd FileType python setlocal ts=4 shiftwidth=4 softtabstop=4 "foldmethod=indent foldlevel=99
autocmd FileType ruby setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType php setlocal ts=4 softtabstop=4
autocmd FileType cpp setlocal ts=4 softtabstop=4
autocmd FileType hpp setlocal ts=4 softtabstop=4
autocmd FileType scala setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType coffee setlocal ts=2 shiftwidth=2 softtabstop=2
autocmd FileType html.handlebars setlocal ts=2 shiftwidth=2 softtabstop=2
"autocmd FileType python compiler pylint

" Shorcuts for tabs
:nmap <C-tab> :tabnext
:nmap <C-S-tab> :tabprevious
:nmap <C-t> :tabnew .<CR>
:nmap <C-o> :CtrlP<CR>
map <F3> :NERDTreeToggle<CR>
