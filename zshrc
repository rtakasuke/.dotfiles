export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export EDITOR=nvim
bindkey -v
setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt correct_all

## 補完
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt extended_glob
setopt hist_ignore_all_dups
setopt list_packed
setopt list_types
setopt magic_equal_subst

## alias
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

zstyle ':completion:*:default' menu select=1
