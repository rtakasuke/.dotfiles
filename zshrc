export EDITOR=nvim
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

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

# 補完・ディレクトリ移動
setopt auto_cd  # ディレクトリ名のみで移動
setopt auto_list  # 補完候補を一覧表示
setopt auto_menu  # tab連打
setopt list_packed  # リストをできるだけ詰める
setopt extended_glob  # glob 展開
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別せずに補完

# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow} +%f"  # %c
zstyle ':vcs_info:git:*' unstagedstr "%F{green} *%f" # %u
zstyle ':vcs_info:*' formats " %F{green}(%b%u%c%F{green})%f"
zstyle ':vcs_info:*' actionformats " %F{green}(%b%u%c%F{green}|%f%F{red}%a%f%F{green})%f"
local cline=$'\n'
local p_dir="%F{blue}[%m:%~]%f "
local p_git='${vcs_info_msg_0_}'
local p_mark="%B%(?,%F{green},%F{red})>%f%b"
PROMPT="$cline$p_dir $p_git$cline$p_mark "

# history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups  # 同じコマンドは残さない
setopt hist_reduce_blanks  # 余分なスペースを削除

# others
autoload history-search-end
autoload -U compinit && compinit -u  # コマンド補完

setopt auto_param_slash
setopt complete_in_word
setopt correct
setopt correct_all
setopt list_types
setopt magic_equal_subst
setopt mark_dirs
setopt no_beep  # ビープ音停止
setopt notify  # background プロセスの状態変化を即時通知
setopt print_eight_bit  # 8bit 文字を有効化
setopt print_exit_value  # 終了ステータスが 0 以外のときにステータスを表示

