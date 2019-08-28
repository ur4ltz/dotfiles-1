"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')
let s:toml_dir = expand('~/.config/vim')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = s:toml_dir . '/dein.toml'
  "let s:lazy_toml = s:toml_dir '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set noswapfile
set encoding=utf-8
set fileencoding=utf-8
set showmatch
set wrapscan
set hlsearch
set showcmd
set title
set number relativenumber
set cursorline
set cursorcolumn
set nofoldenable
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard+=unnamed
set splitbelow
set splitright
set incsearch
set ignorecase
set smartcase
set laststatus=2
set statusline=%y
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_alto=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd FileType vue syntax sync fromstart
let g:terraform_fmt_on_save = 1
nmap / /\v
nnoremap <silent><C-y> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"let g:NERDTreeWinPos = "left"
"let NERDTreeShowLineNumbers=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
