export EDITOR=nvim
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

setopt notify             # background プロセスの状態変化を即時通知
setopt no_beep            # ビープ音停止
setopt print_eight_bit    # 8bit 文字を有効化
setopt ignoreeof          # ^d によるログアウト抑止
setopt no_flow_control    # ^s, ^q によるのロック＆解除を抑止

# キーバインド
bindkey -d
bindkey -e
bindkey "^U" backward-kill-line

# alias
alias cd='pushd > /dev/null'
alias ch='cd ~'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='dirs -v'
alias gd='dirs -v; echo -n "number: "; read newdir; pushd > /dev/null +"$newdir"'
alias cdh='cd ~'
alias ls='ls -CFGx'
alias l='ls -lG'
alias ll='ls -lhaG'
alias la='ls -alG'
alias vim='nvim'
alias vimdiff='nvim -d'
alias diff='colordiff'
alias hist='history'
alias dk='docker'

autoload -Uz colors;  colors       # 色を使う
autoload -U compinit; compinit -u  # コマンド補完
autoload history-search-end        # 履歴検索時のカーソルを末尾に置く

setopt auto_cd            # ディレクトリ名のみで移動
setopt auto_list          # 補完候補を一覧表示
setopt auto_menu          # tab連打
setopt auto_param_slash   # ディレクトリ名の補完で末尾に '/' を付与
setopt complete_in_word   # 単語の途中での Tab 補完
setopt correct            # コマンドのスペル訂正を提案
setopt extended_glob      # glob 展開
setopt globdots           # ドットファイルも候補に入る
setopt list_types         # ls -F
setopt list_packed        # リストをできるだけ詰める
setopt magic_equal_subst  # '=' より先も補完
setopt mark_dirs          # ファイル名展開でディレクトリ末尾に '/' を付与
setopt print_exit_value   # 戻り値が 0 以外の場合終了コードを表示
setopt pushd_ignore_dups  # ディレクトリスタックに重複する物は古い方を削除
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別せずに補完

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git                      # git だけ有効化
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow} +%f"  # %c
zstyle ':vcs_info:git:*' unstagedstr "%F{green} *%f" # %u
zstyle ':vcs_info:*' formats " %F{green}(%b%u%c%F{green})%f"
zstyle ':vcs_info:*' actionformats " %F{green}(%b%u%c%F{green}|%f%F{red}%a%f%F{green})%f"
local cline=$'\n'
local p_dir="%F{blue}[%m:%~]%f "
local p_git='${vcs_info_msg_0_}'
local p_mark="%B%(?,%F{green},%F{red})>%f%b"
PROMPT="$p_dir $p_git$cline$p_mark "

# history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_expand         # 補完時に履歴を自動的に展開
setopt bang_hist           # '!'を使った履歴展開を行う
setopt hist_no_store       # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks  # 余分なスペースを削除
setopt hist_save_no_dups   # 入力したコマンドが直前のものと同一なら古いコマンドのほうを削除する
setopt share_history       # 他のシェルのヒストリをリアルタイムで共有する

# 単語の一部として扱われる文字
# デフォルトから '/' だけ除外
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
