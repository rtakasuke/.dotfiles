#------------------------------------------------------------
# General
#------------------------------------------------------------

export EDITOR=nvim
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

setopt notify           # background プロセスの状態変化を即時通知
setopt no_beep          # ビープ音停止
setopt ignoreeof        # ^d によるログアウト抑止
setopt no_flow_control  # ^s, ^q によるのロック＆解除を抑止
unsetopt promptcr       # 末尾に改行がない出力を表示

# 単語の一部として扱われる文字。 デフォルトから `/` だけ除外
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


#------------------------------------------------------------
# zplug (Prep)
#------------------------------------------------------------

export ZPLUG_HOME=~/.zplug

if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


#------------------------------------------------------------
# Keybindings & Alias
#------------------------------------------------------------

# git リポジトリのルートに cd できる
zplug "mollifier/cd-gitroot"
alias cg='cd-gitroot'

bindkey -d
bindkey -e
bindkey "^U" backward-kill-line

alias cd='pushd > /dev/null'
alias cdh='cd ~'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias d='dirs -v; echo -n "number: "; read newdir; pushd > /dev/null +"$newdir"'
alias l='ls -lG'
alias ls='ls -CFGx'
alias ll='ls -lhaG'
alias la='ls -alG'
alias vim='nvim'
alias vimdiff='nvim -d'
alias diff='colordiff'
alias hist='history'
alias dk='docker'


#------------------------------------------------------------
# Appearance
#------------------------------------------------------------

# shell でシンタックスハイライト
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# 色強化
zplug "chrissicool/zsh-256color"

autoload -Uz colors; colors

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr     "%F{yellow} +%f"  # %c
zstyle ':vcs_info:git:*' unstagedstr   "%F{green} *%f"   # %u
zstyle ':vcs_info:git:*' formats       "%F{green}(%b%u%c%F{green})%f"
zstyle ':vcs_info:git:*' actionformats "%F{green}(%b%u%c%F{green}|%f%F{red}%a%f%F{green})%f"
case ${OSTYPE} in
  darwin*)
    # Mac OS
    local p_dir="%F{blue}[%~]%f"
    ;;
  *)
    # Other OS
    local p_dir="%F{blue}[%m:%~]%f"
    ;;
esac
local p_git='${vcs_info_msg_0_}'
local p_mark="%B%(?,%F{green},%F{red})>%f%b"
local p_br=$'\n'
PROMPT="$p_dir $p_git$p_br$p_mark "


#------------------------------------------------------------
# Completion
#------------------------------------------------------------

zplug "zsh-users/zsh-completions"

autoload -U compinit; compinit -u

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
setopt pushd_ignore_dups  # ディレクトリスタックに重複する物は古い方を削除

zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default'   menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別せずに補完


#------------------------------------------------------------
# History Search
#------------------------------------------------------------

HISTSIZE=10000
SAVEHIST=100000
autoload history-search-end  # 履歴検索時のカーソルを末尾に置く
setopt hist_expand           # 補完時に履歴を自動的に展開
setopt bang_hist             # '!'を使った履歴展開を行う
setopt hist_ignore_dups      # 重複した履歴を保持しない
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分なスペースを削除
setopt hist_save_no_dups     # 入力したコマンドが直前のものと同一なら古いコマンドのほうを削除する
setopt hist_verify           # ヒストリを呼び出してから実行する間に一旦編集可能
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt share_history         # 他のシェルのヒストリをリアルタイムで共有する

# fzf
function fzf-select-history() {
    BUFFER=$( \
        history -n -r 1 | fzf --no-info --no-sort --no-multi --query "$LBUFFER" \
        --height=40% --layout=reverse --prompt="fzf > " \
        --bind=ctrl-j:abort,ctrl-k:kill-line \
    )
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history


#------------------------------------------------------------
# zplug (Post)
#------------------------------------------------------------

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load

