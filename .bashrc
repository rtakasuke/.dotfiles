## alias
alias dev='ssh rtakasuke.com'
alias ch='cd ~'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -al'
alias rm='rm -i'
alias diff='colordiff' # brew install colordiff
# for screen
alias sc='screen'
alias scr='screen -r'
alias scd='screen -d'
# for tmux
alias tm='tmux'
alias tma='tmux attach'
alias tmd='tmux detach'
# tmuxのコピーモードのバッファをクリップボードにコピーするためのもの
TMUX_BUFFER_OUT_FILE="${HOME}/.tmux_buffer_out.txt"
alias bl='tmux saveb -b 0 ${TMUX_BUFFER_OUT_FILE} && echo >> ${TMUX_BUFFER_OUT_FILE}'
alias br='cat ${TMUX_BUFFER_OUT_FILE}'

## 補完
#bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
# git-completion
# https://github.com/git/git/tree/master/contrib/completion
source ~/.git-completion.bash
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

## prompt
TIME="$(date +%H:%M:%S)"
FILE_COUNT="\$(ls -1 -a | wc -l | sed 's: ::g')"
C_GREEN="\[\e[32m\]"
C_BLUE="\[\e[34m\]"
C_CYAN="\[\e[36m\]"
C_RESET="\[\e[0m\]"
PS1="${C_BLUE}(${TIME}) \H${C_RESET} ${C_CYAN}\w >(${FILE_COUNT})${C_RESET}  ${C_GREEN}$(__git_ps1)${C_RESET}\n$"
