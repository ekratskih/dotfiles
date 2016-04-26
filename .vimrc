set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'benmills/vimux'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/L9'
Plugin 'reedes/vim-colors-pencil'
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set cursorline    " Hightlight current line
set nowrap        " Disable wrapping
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set nofoldenable
set hidden        " Disable unsaved buffer notification
syntax on

colorscheme smyck

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces
" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Hide scrollbars
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Menlo\ Regular:h12

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50
let g:airline_theme='wombat'

au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile .babelrc set filetype=json

" Toggle NERDTree
nmap ,t :NERDTreeToggle<CR>

" Format JSON
nmap ,j :%!python -m json.tool<CR>

" Show buffer explorer
nmap <C-E> \be
" Set up syntax check.
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(node_modules)'

