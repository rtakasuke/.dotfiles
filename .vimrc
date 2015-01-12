"------------------------------------------
" includes
"------------------------------------------
source ~/dotfiles/.vimrc.neobundle  " プラグイン全部
source ~/dotfiles/.vimrc.statusline " ステータスライン

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif


"------------------------------------------
" ファイル操作・エンコード
"------------------------------------------
scriptencoding utf-8 " .vimrc自体のエンコーディング
set autoread         " 他で書き換えられたら自動で再読み込み
set noswapfile       " スワップファイル作らない

" 保存するとき
set confirm
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" 開くとき
set hidden           " 保存されていないファイルがあっても別ファイルを開ける
set fileformats=unix,dos,mac
set fileencodings=utf-8,iso-2022-jp,utf-16,ucs-2-internal,ucs-2,cp932,shift-jis,euc-jp,japan

" ファイルタイプ判定
filetype on
filetype indent on
filetype plugin indent on

" ファイル閉じてもundoできる
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

" ファイル閉じても同じ位置から編集再開
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

" :Ev / :Rv : .vimrcの編集と反映
command! Ev edit   $MYVIMRC
command! Rv source $MYVIMRC

" 存在しないディレクトリにファイルを保存しようとした時にmkdir
augroup vimrc-auto-mkdir  " \{\{\{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " \{\{\{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " \}\}\}
augroup END  " \}\}\}


"------------------------------------------
" 表示
"------------------------------------------
colorscheme desert
syntax on
set term=xterm-256color
set t_Co=256
set number
set ruler
set scrolloff=8      " 上下端に視界を確保
set sidescrolloff=8  " 左右端に視界を確保
set ambiwidth=double " 一部の全角記号の表示ズレ対策

" カーソル行(列)をハイライト
set cursorline
set cursorcolumn
hi  CursorLine   term=reverse cterm=none ctermbg=237
hi  CursorColumn term=reverse cterm=none ctermbg=237

" 対応括弧のハイライト
set showmatch
set matchpairs& matchpairs+=<:>
set matchtime=3
hi  MatchParen cterm=bold ctermbg=8

" タブ・スペース視覚化
set   list
set   listchars=tab:>-,trail:-,extends:>,precedes:<
hi    ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

" vimdiff
hi DiffAdd    ctermbg=65   ctermfg=black
hi DiffChange ctermbg=101  ctermfg=black
hi DiffDelete ctermbg=96   ctermfg=black
hi DiffText   ctermbg=248  ctermfg=black

" ポップアップの色
hi Pmenu      ctermbg=gray ctermfg=black
hi PmenuSel   ctermbg=red  ctermfg=black
hi PmenuSbar  ctermbg=darkgray
hi PmenuThumb ctermbg=lightgray


"------------------------------------------
" 検索
"------------------------------------------
set wildmenu    " コマンドライン補完を拡張
set incsearch   " インクリメンタルサーチ
set ignorecase  " 大文字小文字を区別しない
set smartcase   " 検索文字列に大文字が含まれていると大文字小文字区別
set wrapscan    " 最後まで検索したら先頭に戻る。
set hlsearch    " 検索ハイライト

"Escを２回押下で検索ハイライトを解除
nnoremap <Esc><Esc> :nohlsearch<CR>

"ワードサーチ時にいきなり次に飛ばないように
nnoremap * *N
nnoremap # #N


"------------------------------------------
" カーソル移動・スクロール・fold(折り畳み)
"------------------------------------------

" 見た目上の行単位で移動(折り返していたら別の行的な動き)
nnoremap <silent> j gj
nnoremap <silent> k gk

" 行頭・行末移動
nnoremap 1 ^
nnoremap 9 $
nnoremap <Space>h  ^
nnoremap <Space>l  $
inoremap <C-e> <End>
inoremap <C-a> <Home>

" vv : Visualモードに移行して行末まで選択
vnoremap v $h

" カーソルが行頭や行末で止まらないように
set whichwrap=b,s,h,l,<,>,[,]

"矩形選択で行末より後ろも選択できる
set virtualedit=block

" <TAB> : 対応ペアにジャンプ
nnoremap <TAB> %
vnoremap <TAB> %

" タブ
"  tt  : 新規
"  tc  : 閉じる
"  C-n : 次のタブ
"  C-p : 前のタブ
nnoremap <silent> tt :<C-u>tabe<CR>
nnoremap <silent> tc :<C-u>tabclose<CR>
nnoremap <C-p>    gT
nnoremap <C-n>    gt

" ウィンドウ移動 (ctrl + hjkl←↓↑→))
map <C-h>     <ESC><C-W>h<CR>
map <C-l>     <ESC><C-W>l<CR>
map <C-k>     <ESC><C-W>k<CR>
map <C-j>     <ESC><C-W>j<CR>
map <C-Left>  <ESC><C-W>h<CR>
map <C-Right> <ESC><C-W>l<CR>
map <C-Up>    <ESC><C-W>k<CR>
map <C-Down>  <ESC><C-W>j<CR>

" ウィンドウサイズ変更(Shift + hjkl←↓↑→)
nnoremap <S-h>     <C-w><<CR>
nnoremap <S-l>     <C-w><CR>
nnoremap <S-k>     <C-w>-<CR>
nnoremap <S-j>     <C-w>+<CR>
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" コマンドラインモードでmacっぽくカーソル移動
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <C-b>
cnoremap <C-e> <C-e>
cnoremap <C-u> <C-e><C-u>


" fold
"  h / l : とじる / ひらく
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'h'
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'


" INSERTモード時にカーソルキーが使えなくなった問題への対処
" http://vim-jp.org/vimdoc-ja/term.html#vt100-cursor-keys
set nocompatible   " vi互換をOFF
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>


"------------------------------------------
" 編集
"------------------------------------------

" インデント
set autoindent
set smartindent
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
set shiftround
"  for perl
inoremap # X#

" jj : Insertモードを抜ける
inoremap jj <Esc>

" Y : 行末までヤンク
map Y y$

" 空行を挿入
"  10<Space>o : 10行挿入
nnoremap <Space>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" gp : PASTEモードに移行。NORMALモードに戻るとPASTEモードも解除
nnoremap gp :<C-u>set paste<Return>i
autocmd  InsertLeave * set nopaste

" gs : らくらく置換
nnoremap gs :<C-u>%s//g<Left><Left>
vnoremap gs :s//g<Left><Left>

