"------------------------------------------
" includes
"------------------------------------------
source ~/.dotfiles/.vimrc.neobundle       " Neobundle & PluginSettings
source ~/.dotfiles/.vimrc.statusline      " ステータスライン


"------------------------------------------
" 基本設定
"------------------------------------------
scriptencoding utf-8 " .vimrc自体のエンコーディング
set autoread         " 他で書き換えられたら自動で再読み込み
set noswapfile       " スワップファイル作らない
"set mouse=a          " マウス対応

" 保存するとき
set confirm
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" 開くとき
set fileformats=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,utf-16,ucs-2-internal,ucs-2,cp932,shift-jis,euc-jp,japan

" ファイルタイプ判定
filetype on
filetype indent on
filetype plugin indent on

" :Ev/:Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" INSERTモード時にカーソルキーが使えなくなった問題への対処
" http://vim-jp.org/vimdoc-ja/term.html#vt100-cursor-keys
set nocompatible   " vi互換をOFF
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>


"------------------------------------------
" 表示・インデント
"------------------------------------------
syntax on
colorscheme desert
set term=xterm-256color
set t_Co=256
set number
set ruler
set scrolloff=2      " カーソルの上下に最低限表示する行数
set ambiwidth=double " 一部の全角記号の表示ズレ対策
set showmatch        " 対応する括弧表示

" インデント
set autoindent   " 自動インデント
set smartindent  " 改行時に前行のインデントを引き継ぐ
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
" for perl
inoremap # X#

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

" タブ・スペースを視覚化
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<


"------------------------------------------
" 検索・補完・ヒストリー
"------------------------------------------
set wildmenu    " コマンドライン補完を拡張
set incsearch   " インクリメンタルサーチ
set ignorecase  " 大文字小文字を区別しない
set smartcase   " 検索文字列に大文字が含まれていると大文字小文字区別
set wrapscan    " 最後まで検索したら先頭に戻る。
set hlsearch    " 検索ハイライト

"Escを２回押下で検索ハイライトを解除
nmap <Esc><Esc> :nohlsearch<CR>

"ワードサーチ時にいきなり次に飛ばないように
nmap * *N
nmap # #N

" ポップアップの色
hi Pmenu      ctermbg=gray ctermfg=black
hi PmenuSel   ctermbg=red  ctermfg=black
hi PmenuSbar  ctermbg=darkgray
hi PmenuThumb ctermbg=lightgray

"------------------------------------------
" カーソル移動・スクロール
"------------------------------------------

" 行頭・行末移動
nmap 1 ^
nmap 9 $
inoremap <C-e> <End>
inoremap <C-a> <Home>
" カーソルが行頭や行末で止まらないように
set whichwrap=b,s,h,l,<,>,[,]

" コマンドモードでスペースキーをページダウンに (less風)
nnoremap <Space> <PageDown>

" タブ移動 (shift + ctrl + hjkl)
map <C-S-h> <ESC>:tabp<CR>
map <C-S-l> <ESC>:tabn<CR>

" ウィンドウ移動 (ctrl + hjkl)
map <C-h>   <ESC><C-W>h<CR>
map <C-l>   <ESC><C-W>l<CR>
map <C-k>   <ESC><C-W>k<CR>
map <C-j>   <ESC><C-W>j<CR>


"------------------------------------------
" 編集
"------------------------------------------

" backspace key
set backspace=indent,eol,start
set backspace=2

" paste mode
" ptでINSERT&PASTEモードに移行
" ノーマルモードに戻るとPASTEモードも解除
nnoremap gp :<C-u>set paste<Return>i
autocmd InsertLeave * set nopaste

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" fold
" 行頭で h を押すと折畳を閉じる
" 折畳上で l を押すと折畳を開く
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる
" 折畳上で l を押すと選択範囲に含まれる折畳を開く
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'h'
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" 編集履歴を再開・閉じてもアンドゥできる
" 要インストール vim_mb (over ver7.3)
if has('persistent_undo')
    set undodir=./.vimundo,~/.vimundo
        augroup vimrc-undofile
        autocmd!
        autocmd BufReadPre ~/* setlocal undofile
    augroup END
endif
