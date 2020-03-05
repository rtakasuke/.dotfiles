C_RED="\[\e[31m\]"
C_GREEN="\[\e[32m\]"
C_BLUE="\[\e[34m\]"
C_RESET="\[\e[0m\]"

# alias
alias cd='pushd > /dev/null'
alias cdh='cd ~'
alias ch='cd ~'
alias d='dirs -v'
alias gd='dirs -v; echo -n "number: "; read newdir; pushd > /dev/null +"$newdir"'
alias ls='ls -CFGx'
alias l='ls -lG'
alias ll='ls -lhaG'
alias la='ls -alG'
alias vim='nvim'
alias vimdiff='nvim -d'
alias diff='colordiff'
alias dk='docker'

# brew "bash-completion"
BASH_COMPLETION_PATH=/usr/local/etc/profile.d/bash_completion.sh
if [ -r ${BASH_COMPLETION_PATH} ]; then
    . ${BASH_COMPLETION_PATH}
fi

## brew "git"
GIT_PROMPT_PATH=/usr/local/etc/bash_completion.d/git-prompt.sh
GIT_COMPLETION_PATH=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -r ${GIT_PROMPT_PATH} -a -r ${GIT_COMPLETION_PATH} ]; then
    source ${GIT_PROMPT_PATH}
    source ${GIT_COMPLETION_PATH}
    GIT_PS1_SHOWDIRTYSTATE=true
fi

# prompt
PS1="${C_BLUE}[\w]${C_RESET} ${C_GREEN}\$(__git_ps1)${C_RESET}\n$ "


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Users/rtakasuke/.nodebrew/current/bin
