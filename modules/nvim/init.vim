" =======================================================
" ~/.config/nvim/init.vim
" =======================================================

call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'mattn/vim-lsp-icons'
Plug 'ryanolsonx/vim-lsp-typescript'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/denite-git'
Plug 'Shougo/deoplete-terminal'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/deol.nvim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/syntastic'
Plug 'cocopon/iceberg.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'mattn/vim-sl'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'simeji/winresizer'
Plug 'luochen1990/rainbow'
Plug 'mechatroner/rainbow_csv'
Plug 'hashivim/vim-terraform'
Plug 'slim-template/vim-slim'
Plug 'ConradIrwin/vim-bracketed-paste' " set paste

" check: chrome拡張がインストールできない
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" check: defxの表示がくずれる
" Plug 'kristijanhusak/defx-icons'
" Plug 'kristijanhusak/defx-git'
" Plug 'mhinz/vim-startify'
" check: defxにもインデントラインが出る
" Plug 'Yggdroot/indentLine'
" Plug 'bronson/vim-trailing-whitespace'

call plug#end()

" =======================================================
" Global Settings
" =======================================================

scriptencoding=utf-8

syntax enable

colorscheme iceberg

set encoding=utf-8
set fileencoding=utf-8
set helplang=ja
set clipboard+=unnamed
set backspace=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set nobackup
set noswapfile
set ruler
set termguicolors
set pumblend=25
set showmatch
set matchtime=4
set wrapscan
set hlsearch
set showcmd
set title
set number relativenumber
set cursorline
set cursorcolumn
set nofoldenable
set expandtab
set showtabline=2
set splitbelow
set splitright
set incsearch
set ignorecase
set synmaxcol=256
set smartcase
set background=dark
set updatetime=250
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set wildchar=<TAB>
set wildmenu
set wildmode=longest:full,full
set nocompatible

let mapleader="\<Space>"
let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:rainbow_active=1
let g:deoplete#enable_at_startup=1
let g:terraform_fmt_on_save=1
let g:netrw_liststyle=3
let g:fzf_layout= { 'down': '~40%' }
let g:deol#shell_history_path= '~/.zsh_history'
let g:gitgutter_highlight_lines=0

" =======================================================
" Functions
" =======================================================

function! FzfBLinesCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    call fzf#vim#blines({'options': '-q ' . currWord})
  else
    execute ':BLines'
  endif
endfunction

" =======================================================
" Key Mappings
" =======================================================

cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>
" https://dev.classmethod.jp/tool/trouble-shoot-ctrlv-in-vim/
map ^[OA ^[ka
map ^[OB ^[ja
map ^[OC ^[la
map ^[OD ^[ha
nnoremap <C-l> :LspDefinition<CR>
nnoremap <C-s> :LspStatus<CR>
nnoremap <C-h> :LspHover<CR>
nnoremap <C-c> :LspCodeAcion<CR>
nnoremap <S-g> :Gstatus<CR>
nnoremap <S-d> :Gdiff<CR>
nnoremap <silent><Esc><Esc> :nohlsearch<CR>
nnoremap <Leader>sl :call sl#animate()<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>f :Denite file/rec<CR>
nnoremap <Leader>l :Denite line<CR>
nnoremap <Leader>h :Denite defx/history<CR>
nnoremap <Leader>g :Denite grep<CR>
nnoremap <Leader>b :Denite buffer<CR>
nnoremap <Leader>m :Denite menu<CR>
nnoremap <Leader>o :Denite outline<CR>
nnoremap <Leader>u :Denite source<CR>
" https://wonderwall.hatenablog.com/entry/2017/10/07/220000
nnoremap <silent>,f :Files<CR>
nnoremap <silent>,g :GFiles<CR>
nnoremap <silent>,x :GFiles?<CR>
nnoremap <silent>,b :Buffers<CR>
nnoremap <silent>,l :BLines<CR>
nnoremap <silent>,h :History<CR>
nnoremap <silent>,m :Mark<CR>
nnoremap <silent>,ag :Ag<CR>
nnoremap <silent>,d :Defx<CR>
nnoremap <silent>,n :NERDTreeToggle<CR>
" https://medium.com/@bookun/vim-advent-calendar-2019-12-20-63a12396211f
nnoremap <silent>df :Deol -split=floating<CR>
nnoremap <silent>dv :Deol -split=vertical<CR>
nnoremap <silent>ds :Deol -split=horizontal<CR>
nnoremap <silent>bg (deol_bg)

let s:denite_win_width_percent = 0.6
let s:denite_win_height_percent = 0.5
let s:denite_default_options = {
    \ 'split': 'horizontal',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '$ ',
    \ 'start_filter': v:true
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)

call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])
call denite#custom#kind('file', 'default_action', 'split')
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command', ['scantree.py', '--path', ':directory'])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
call denite#custom#action('file', 'test',
      \ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
      \ {context -> denite#do_action(
      \  CONTEXT, 'OPEN', CONTEXT['TARGETS'])})

let s:menus = {}
let s:menus.zsh = {
      \ 'description': 'Edit your import zsh configuration'
      \ }
let s:menus.zsh.file_candidates = [
      \ ['zshrc', '~/.config/zsh/.zshrc'],
      \ ['zshenv', '~/.zshenv'],
      \ ]
let s:menus.my_commands = {
      \ 'description': 'Example commands'
      \ }
let s:menus.my_commands.command_candidates = [
      \ ['Split the window', 'vnew'],
      \ ['Open zsh menu', 'Denite menu:zsh'],
      \ ['Format code', 'FormatCode', 'go,python'],
      \ ]
call denite#custom#var('menu', 'menus', s:menus)

call defx#custom#column('mark', {
    \ 'readonly_icon': '✗',
    \ 'selected_icon': '✓',
    \ })
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:icon:filename:type:size:time',
      \ 'show_ignored_files': v:true,
      \ })
call deoplete#custom#var('terminal', 'require_same_tab', v:false)

" =======================================================
" auto commands
" =======================================================

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=ro
augroup END

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Defx | endif
autocmd BufRead,BufNewFile *.slim setfiletype slim
autocmd BufRead,BufNewFile *.tsx,*jsx set filetype=typescript,tsx

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> v defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> i defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> ee defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> b defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" =======================================================
" Lsp Settings
" =======================================================


if executable('solargraph')
  augroup LspRuby
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'solargraph',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
          \ 'initialization_options': {"diagnostics": "true"},
          \ 'whitelist': ['ruby'],
          \ })
  augroup END
endif

if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'vim-language-server',
          \ 'cmd': {server_info->['vim-language-server', '--stdio']},
          \ 'whitelist': ['vim'],
          \ 'initialization_options': {
          \   'iskeyword': '@,48-57,_,192-255,-#',
          \   'vimruntime': expand($VIMRUNTIME),
          \   'suggest': { 'fromVimruntime': v:true },
          \ }})
  augroup END
endif

if executable('typescript-language-server')
  augroup LspTypescript
    autocmd!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
          \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
          \ 'whitelist': ['typescript', 'typescript.tsx'],
          \ })
  augroup END
endif

if executable('intelephense')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->['node', expand('~/.anyenv/envs/nodenv/versions/13.2.0/lib/node_modules/intelephense/lib/intelephense.js'), '--stdio']},
        \ 'initialization_options': {"storagePath": "/tmp/intelephense"},
        \ 'whitelist': ['php'],
        \ 'workspace_config': { 'intelephense': {
        \   'files.associations': ['*.php'],
        \ }},
        \ })
endif

if executable('css-languageserver')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

if executable('java') && filereadable(expand('$HOME/.lsp/groovy-language-server/build/libs/groovy-language-server.jar'))
  autocmd User lsp_setup call lsp#register_server({
        \'name': 'groovy-language-server',
        \'cmd': {server_info->[
        \  'java',
        \  '-jar',
        \  expand('$HOME/.lsp/groovy-language-server/build/libs/groovy-language-server.jar')
        \]},
        \'whitelist': ['groovy']
        \})
endif
