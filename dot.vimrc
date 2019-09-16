if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('cespare/vim-toml')
  call dein#add('elzr/vim-json')
  call dein#add('simeji/winresizer')
  call dein#add('ejholmes/vim-forcedotcom')
  "call dein#add('plasticboy/vim-markdown')
  call dein#add('tpope/vim-markdown')
  call dein#add('shmup/vim-sql-syntax')
  call dein#add('stanangeloff/php.vim')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('mechatroner/rainbow_csv')
  call dein#add('vim-scripts/indentpython.vim')
  call dein#add('hashivim/vim-terraform')
  call dein#add('posva/vim-vue')
  call dein#add('ekalinin/dockerfile.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('chr4/nginx.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('zxqfl/tabnine-vim')
  call dein#add('hashivim/vim-terraform')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('slim-template/vim-slim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('pelodelfuego/vim-swoop')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('jwalton512/vim-blade')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('stephpy/vim-yaml')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('wavded/vim-stylus' )
  call dein#add('Yggdroot/indentLine')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set encoding=utf-8
set fileencoding=utf-8
set clipboard+=unnamed
set backspace=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set statusline=%y
set showmatch
set wrapscan
set hlsearch
set showcmd
set title
set number relativenumber
set cursorline
set cursorcolumn
set nofoldenable
set noswapfile
set expandtab
set splitbelow
set splitright
set incsearch
set ignorecase
set smartcase

let mapleader="\<Space>"
let NERDTreeShowHidden=1
"let NERDTreeShowLineNumbers=1
"let g:NERDTreeWinPos = "left"
let g:terraform_fmt_on_save = 1
let g:indent_guides_auto_colors = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_alto=1

nmap / /\v
nmap <Leader><Leader> V
nnoremap <silent><C-y> :NERDTreeToggle<CR>

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.vue setfiletype vue