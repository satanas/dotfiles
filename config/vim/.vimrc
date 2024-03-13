syntax on                       " Enable syntax highlighting.
filetype plugin indent on       " Enable file type based indentation.

set nocompatible                " We're running Vim, not Vi!
set encoding=utf-8

" General ---------------------- {{{
set nomodeline                  " We want modeline off (for security reasons)
set modelines=0
set spell                       " Enable spell checking
set list
set listchars=tab:→-,trail:·
set noswapfile                  " Disable swap - all buffers will be opened in memory
set mouse=a                     " Enable mouse scrolling in OSX
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.

" Search ---------------------- {{{
set hlsearch                    " Highlight search results
set incsearch                   " Incremental searches (search as you type)
set ignorecase                  " Ignore case in searches
set smartcase                   " Ignore case except when you type upper case letters
set history=100                 " History of : commands and searches

" Formatting ---------------------- {{{
set autoindent                  " Respect indentation when starting a new line.
set expandtab                   " Expand tabs to spaces. Essential in Python.
set tabstop=4                   " Number of spaces tab is counted for.
set shiftwidth=4                " Number of spaces to use for autoindent.
set backspace=2                 " Fix backspace behavior on most terminals.
set nowrap                      " Line wrapping off
set softtabstop=4               " Number of spaces tab is counted during edition operations
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" UI/Interface ---------------------- {{{
set laststatus=2                " Always show status bar
set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.
set showmatch                   " Show matching brackets.
set matchtime=5                 " Bracket blinking.
set cursorline                  " Highlight the screen line of the cursor
set number                      " Print the line numbers
set numberwidth=5               " Number of columns used to show the line number
set colorcolumn=120             " Highlight column at 120 char width
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_theme_bg='dark'

" Advanced movement and navigation ---------------------- {{{
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " when scrolling, keep cursor 3 lines away from screen border

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

" Use C-o to open fuzzy finder
noremap <C-o> :CtrlP<CR>


" Plugins ---------------------- {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rails'
Plug 'avakhov/vim-yaml'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'satanas/rename.vim'
Plug 'derekwyatt/vim-scala'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'elzr/vim-json'
Plug 'mustache/vim-mustache-handlebars'
" Plug 'JamshedVesuna/vim-markdown-preview'


let g:vim_json_syntax_conceal = 0
" let vim_markdown_preview_toggle=2
" let vim_markdown_preview_github=1
call plug#end()


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
