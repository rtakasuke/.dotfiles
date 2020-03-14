alias cd='pushd > /dev/null'
alias cdh='cd ~'
alias ch='cd ~'
alias d='dirs -v'
alias gd='dirs -v; echo -n "number: "; read newdir; pushd > /dev/null +"$newdir"'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -CFGx'
alias l='ls -lG'
alias ll='ls -lhaG'
alias la='ls -alG'
alias vim='nvim'
alias vimdiff='nvim -d'
alias diff='colordiff'
alias dk='docker'

export EDITOR=nvim
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

bindkey -e  # emacs キーバインド. vim 使いでもこれは必須

autoload history-search-end

setopt auto_cd  # ディレクトリ名のみで移動
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt auto_pushd
setopt complete_in_word
setopt correct
setopt correct_all
setopt extended_glob  # glob 展開
setopt hist_ignore_all_dups
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt mark_dirs
setopt no_beep
setopt notify  # background プロセスの状態変化を即時通知
setopt print_eight_bit  # 8bit 文字を有効化
setopt print_exit_value  # 終了ステータスが 0 以外のときにステータスを表示

zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別せずに補完

# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}+%f"  # %c
zstyle ':vcs_info:git:*' unstagedstr "%F{green}*%f" # %u
zstyle ':vcs_info:*' formats " %F{green}(%b %u%c%F{green})%f"
zstyle ':vcs_info:*' actionformats " %F{green}(%b %u%c%F{green}|%f%F{red}%a%f%F{green})%f"
PROMPT="%F{blue}[%m:%~]%f "
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT="$PROMPT
$ "
