# Encode
export LANG=ja_JP.utf8
export LC_ALL=ja_JP.UTF-8

## alias
alias dev='ssh rtakasuke.com'
alias cdd='cd ~'
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
PS1="\`
if [ \$? = 0 ]; then 
    echo \[\e[36m\]; 
else 
    echo \[\e[31m\]; 
fi
\`[\u@\H \w]\[\e[0m\]\n$"
