# alias
alias vim='nvim'
alias cd='pushd > /dev/null'
alias cdh='cd ~'
alias ch='cd ~'
alias d='dirs -v'
alias gd='dirs -v; echo -n "number: "; read newdir; pushd > /dev/null +"$newdir"'
alias ls='ls -CFGx'
alias l='ls -lG'
alias ll='ls -lhaG'
alias la='ls -alG'
alias diff='colordiff'

# 補完
##bash-completion
## https://github.com/git/git/tree/master/contrib/completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
## git-completion
## https://github.com/git/git/tree/master/contrib/completion
source ~/.git-prompt.sh
source ~/.git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# prompt
C_RED="\[\e[31m\]"
C_GREEN="\[\e[32m\]"
C_BLUE="\[\e[34m\]"
C_CYAN="\[\e[36m\]"
C_RESET="\[\e[0m\]"
PS1="${C_BLUE}[\H \w]${C_RESET} ${C_GREEN}\$(__git_ps1)${C_RESET}\n$ "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Users/rtakasuke/.nodebrew/current/bin
