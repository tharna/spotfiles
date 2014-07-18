"source ~/.vim/php-doc.vim
"imap <C-o> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i

"{{{ Vundle
set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/Gundo'
Plugin 'mattn/zencoding-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'int3/vim-extradite'
Plugin 'AndrewRadev/switch.vim'
Plugin 'groenewege/vim-less'
"Plugin 'mattn/webapi-vim'
"Plugin 'mattn/gist-vim'
Plugin 'joonty/vdebug.git'
"Plugin 'StanAngeloff/php.vim'
"Plugin 'Lokaltog/vim-easymotion'
filetype plugin indent on

"}}}

" {{{ .filetype handling

au BufRead,BufNewFile *.phps		set filetype=php
au BufRead,BufNewFile *.phtml		set filetype=php
au BufRead,BufNewFile *.module		set filetype=php
au BufRead,BufNewFile *.inc 		set filetype=php
au BufRead,BufNewFile *.test 		set filetype=php
au BufRead,BufNewFile *.install 	set filetype=php
au BufRead,BufNewFile *.profile 	set filetype=php

au BufRead,BufNewFile ~/devlog/*    set filetype=project
au BufRead,BufNewFile *.pro         set filetype=project
au BufRead,BufNewFile todo.txt      set filetype=project
au BufRead,BufNewFile *.mkd 		set filetype=mkd
" }}}

" {{{  Settings  

syntax on
set pastetoggle=§
" Use filetype plugins, e.g. for PHP
filetype plugin on

" Show nice info in ruler
set ruler
set laststatus=2

" Set standard setting for PEAR coding standards
set tabstop=2
set shiftwidth=2

" Auto expand tabs to spaces
set expandtab

" Auto indent after a {
set autoindent
set smartindent


" Show line numbers by default
set number
set relativenumber

" Enable folding by fold markers
set foldmethod=marker 

" Autoclose folds, when moving out of them
set foldclose=all

" Use incremental searching
set incsearch

" Do not highlight search results
" set nohlsearch

"set scrolljump=5
set scrolloff=5

" Repair wired terminal/vim settings
set backspace=start,eol,indent

set wrap 

   if &term =~ "xterm"
     if has("terminfo")
       set t_Co=8
       set t_Sf=<Esc>[3%p1%dm
       set t_Sb=<Esc>[4%p1%dm
     else
       set t_Co=8
       set t_Sf=<Esc>[3%dm
       set t_Sb=<Esc>[4%dm
     endif
   endif
" }}}

cabbr checkjs !js ~/bin/runjslint.js "`cat %`" \| lynx --force-html /dev/fd/5 -dump 5<&0 \| less

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

let mapleader = ","

nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :NERDTree<CR>

"map <C-t> :tabnew 

function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DS call s:DiffWithSaved()

function! s:ShowTodos()
"    vnew | r # 
    exe "grep TODO %" 
endfunction
com! ST call s:ShowTodos()

map <leader>w :vimgrep TODO %<CR> :copen <CR>
nnoremap <silent> <leader>p :YRShow<CR>
nnoremap <leader>x $a =done<esc>
set t_Co=256
set bg=dark

hi Comment ctermfg=243

if $TERM=='screen'
   exe "set title titlestring=vim:%f"
   exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

map gf :tabe <cfile><CR>

let php_sql_query=1
let php_htmlInStrings=1
let g:yankring_history_dir = "~/.vim"
set makeprg=php\ -l\ %

set nobackup
set noswapfile
set encoding=utf-8
cmap w!! w !sudo tee % >/dev/null
nnoremap <F7> :GundoToggle<CR>

colorscheme ansikka
"autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=red

let g:ctrlp_map = '<c-t>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': [],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
\ }


nnoremap + <C-a>
nnoremap - <C-x>

au InsertLeave * set nopaste

"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
nnoremap <leader>cd :lcd %:p:h<Enter>

set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%{fugitive#statusline()}
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=red

nnoremap <leader>dca :!drush cc all<CR>
nnoremap <leader>dcm :!drush cc menu<CR>
nnoremap <leader>dct :!drush cc theme<CR>
nnoremap <leader>dcc :!drush cc css+js<CR>
nnoremap <leader>dul :!drush uli<CR>
nnoremap <leader>dvr :!sudo service varnish restart<CR>
nnoremap <leader>dvp :!sudo service php5-fpm restart<CR>
nnoremap <leader>t :tabe 

let g:Powerline_symbols = 'fancy'
"let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

nnoremap j gj
nnoremap k gk

"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

nnoremap <Leader>gd :Gdiff<Enter>
nnoremap <Leader>gD :GitDiff --cached<Enter>
nnoremap <Leader>gs :Gstatus<Enter>
nnoremap <Leader>gl :GitLog<Enter>
nnoremap <Leader>ga :GitAdd<Enter>
nnoremap <Leader>gA :GitAdd <cfile><Enter>
nnoremap <Leader>gc :GitCommit<Enter>
nnoremap <Leader>gp :GitPullRebase<Enter>

let g:switch_definitions =
    \ [
    \   ['asdf', 'qwerty']
    \ ]
let g:switch_definitions =
        \ [
        \   ['0', '1',] 
        \ ]


nnoremap <leader><space> :Switch<cr>
set mouse=r
set ttymouse=xterm2
set switchbuf=usetab
nnoremap <Leader>ma :set mouse=a<Enter>
nnoremap <Leader>mr :set mouse=r<Enter>

"set clipboard=unnamedplus
