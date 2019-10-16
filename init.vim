call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jlanzarotta/bufexplorer'
Plug 'brendonrapp/smyck-vim'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'neoclide/vim-jsx-improve'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'cespare/vim-toml'
Plug 'ayu-theme/ayu-vim'
Plug 'mattn/emmet-vim'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'


" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

set rnu
set number relativenumber
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.pyc,*/__pycache__/*
set nowrap
set updatetime=100
set signcolumn=yes
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
set termguicolors
let mapleader = ","
set t_Co=256
" colorscheme smyck
" colorscheme nord
set background=light

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

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction


" Neomake
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_javascript_enabled_makers = ['eslint', StrTrim(system('npm-which eslint'))]
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_jsx_enabled_makers = ['eslint', StrTrim(system('npm-which eslint'))]

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
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_typescript_enabled_makers = $PWD .'/node_modules/.bin/eslint'
let g:neomake_python_pep8_exe = 'python3'
let g:neomake_python_enabled_makers = ['flake8']

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

let g:UltiSnipsExpandTrigger="<tab>"

let g:gruvbox_number_column="light0_hard"
let g:gruvbox_sign_column="light0_hard"
let g:gruvbox_color_column="light0_hard"
let g:gruvbox_vert_split="light0_hard"
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gruvbox_invert_indent_guides=0
let g:gruvbox_invert_tabline=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_light="hard"

" light0

colorscheme gruvbox
" colorscheme PaperColor

" highlight CursorLineNr guibg=#fbf1c7
highlight CursorLineNr guibg=#f9f5d7
" highlight CursorLineNr guibg=#282828

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

function! SilverSearch(word)
  let @s = expand(a:word)
  let l:ag_cmd = "Ag -Q " . shellescape(@s) . " ."
  call histadd("cmd", l:ag_cmd)
  set hidden
  execute l:ag_cmd
endfunction
noremap <F3> yiw:call SilverSearch(expand(@0))<CR>

set wildignore+=*.avi,*.m3u,*.mp3,*.mp4,*.mpg,*.sfv,*.wmv,*.mov
set wildignore+=*.doc,*.numbers,*.pages,*.pdf,*.ppt,*.pptx,*.docx,*.xls,*.xlsx
set wildignore+=*.dmg,*.gz,*.rar,*.tbz,*.zip
set wildignore+=*/tmp/*,*.db,.DS_Store,*.log
set wildignore+=*.bmp,*.gif,*.jpeg,*.jpg,*.png,*.tif
set wildignore+=*.so,*.sw?
set wildignore+=*.pyc
set wildignore+=*.woff
set wildignore+=*.odt,*.odp,*.ods,*.eot,*.svg,*.tff
set wildignore+=*.pem,*.crt,*.key,*keystore,*truststore,*.p12
set wildignore+=*.war,*.jar,*.zip,*.tar,*.gz


