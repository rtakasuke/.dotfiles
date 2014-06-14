"vi互換をOFF
set nocompatible


"Encode
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,utf-16,ucs-2-internal,ucs-2,cp932,shift-jis,euc-jp,japan
scriptencoding utf-8
set encoding=utf-8


"ファイルフォーマット
set fileformat=unix
set fileformats=unix,dos,mac

"保存
set confirm


"Color
colorscheme desert
set term=xterm-256color
set t_Co=256
hi VisualNOS cterm=bold,underline ctermfg=247


"Display
set number
set ruler
set showmatch
set showcmd
syntax on


"backspace key
set backspace=indent,eol,start
set backspace=2


"mouse
set mouse=a

"ペーストモード切り替えをキーバインド
set pastetoggle=<F11>

"タブ・ウィンドウの移動をキーバインド
" select tab (shift + ctrl + hjkl)
map <C-S-h> <ESC>:tabp<CR>
map <C-S-l> <ESC>:tabn<CR>
" select window (ctrl + hjkl)
map <C-h>   <ESC><C-W>h<CR>
map <C-l>   <ESC><C-W>l<CR>
map <C-k>   <ESC><C-W>k<CR>
map <C-j>   <ESC><C-W>j<CR>


"Indent
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
" Indent for perl
inoremap # X#
filetype on
filetype indent on
filetype plugin on


"Search
set wildmenu
set incsearch
set ignorecase
set smartcase
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR>
nmap * *N
nmap # #N


"PLUGIN yanktmp.vim(違うスクリーンでコピペができるよ)
map <silent> sy :call YanktmpYanc()<CR>
map <silent> sp :call YanctmpPaste_p<CR>


"Folding
" 行頭で h を押すと折畳を閉じる
" 折畳上で l を押すと折畳を開く
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる
" 折畳上で l を押すと選択範囲に含まれる折畳を開く
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'h'
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'


"コマンドモードでスペースキーをページダウンに (less風)
nnoremap <Space> <PageDown>


"ホップアップの色
hi Pmenu      ctermbg=gray ctermfg=black
hi PmenuSel   ctermbg=red  ctermfg=black
hi PmenuSbar  ctermbg=darkgray
hi PmenuThumb ctermbg=lightgray


"Status line
set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{&ff}]%=%c,%l%llp%%
set laststatus=2


"IMEの状態でステータスラインの色をかえる
if v:version >= 700
    augroup InsertHook
    autocmd!
    autocmd InsertEnter * highlight StatusLine ctermfg=6 ctermbg=7
    autocmd InsertLeave * highlight StatusLine ctermfg=4 ctermbg=7
    augroup END
endif


"視覚化
" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
" タブを視覚化
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<


"--------------------------------------------------------
"PLUGIN lightline.vim
"ステータスバーをかっこよくする。
"--------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"--------------------------------------------------------
" NeoBundle ここから
"--------------------------------------------------------
set nocompatible "vi 互換をoff
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

"--プラグイン名ここから--

NeoBundle 'AutoComplPop'
NeoBundle 'quickrun.vim'
NeoBundle 'yanktmp.vim'
NeoBundle 'unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'cocopon/colorswatch.vim'
NeoBundle 'tpope/vim-fugitive'

"--プラグイン名ここまで--

filetype plugin indent on     " required!
filetype indent on
