# alias
alias cd='pushd > /dev/null'
alias cdh='cd ~'
alias ch='cd ~'
alias d='dirs -v'
alias gd='dirs -v; echo -n "number: "; read newdir; pushd > /dev/null +"$newdir"'
alias ls='ls -CFx'
alias l='ls -l'
alias ll='ls -lha'
alias la='ls -al'
alias diff='colordiff'
alias tm='tmux'
alias tma='tmux attach'
alias tmd='tmux detach'
# tmuxのコピーモードのバッファをクリップボードにコピーするためのもの
TMUX_BUFFER_OUT_FILE="${HOME}/.tmux_buffer_out.txt"
alias bl='tmux saveb -b 0 ${TMUX_BUFFER_OUT_FILE} && echo >> ${TMUX_BUFFER_OUT_FILE}'
alias br='cat ${TMUX_BUFFER_OUT_FILE}'

# java
export JAVA_HOME=

# 補完
##bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
## git-completion
## https://github.com/git/git/tree/master/contrib/completion
source ~/.git-completion.bash
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# prompt
C_RED="\[\e[31m\]"
C_GREEN="\[\e[32m\]"
C_BLUE="\[\e[34m\]"
C_CYAN="\[\e[36m\]"
C_RESET="\[\e[0m\]"
PS1="${C_BLUE}[\H \w]${C_RESET} ${C_GREEN}\$(__git_ps1)${C_RESET}\n$"

# Go 環境設定
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export PATH=$PATH:$GOROOT/bin
    export GOPATH=/Users/$USER/gopath
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Users/rtakasuke/.nodebrew/current/bin
