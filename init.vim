call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jlanzarotta/bufexplorer'
Plug 'brendonrapp/smyck-vim'
Plug 'kien/ctrlp.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'neoclide/vim-jsx-improve'
Plug 'styled-components/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'cespare/vim-toml'
Plug 'ayu-theme/ayu-vim'

call plug#end()

set rnu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.pyc,*/__pycache__/*
set nowrap
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set hidden
set foldmethod=indent
set foldlevelstart=10
set foldlevel=10
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set numberwidth=3
set list listchars=tab:»·,trail:·,nbsp:·
set mouse-=a
set splitbelow
set splitright
set nohlsearch
set cursorline
let mapleader = ","
set t_Co=256

colorscheme smyck

" Open Podfile as ruby file
au BufRead,BufNewFile Podfile set filetype=ruby

" Open .babelrc as json file
au BufRead,BufNewFile .babelrc set filetype=json

" NERDTree configuratio
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50
nmap <leader>t :NERDTreeToggle<CR>

" Bufexplorer
nmap <C-E> <leader>be

" CtrlP
nmap <leader>p :CtrlP .<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_jsx_enabled_makers = ['eslint']

" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Format json
nmap <leader>j :%!python -m json.tool<CR>

" Enable flow syntax
let g:javascript_plugin_flow = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" remoe trailing spaces on save
autocmd BufWritePre *.js %s/\s\+$//e

" Open current buffer in nerdtree
map <leader>r :NERDTree %<CR>
