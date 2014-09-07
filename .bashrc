## bash_profile
export PATH=$PATH:/usr/local/mysql/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

## PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH=/usr/local/share:$PATH
export PATH=~/git/bin:$PATH

# Encode
export LANG=ja_JP.utf8
export LC_ALL=ja_JP.UTF-8

## alias
alias ls='ls -G'
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

## 補完
#bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
# git-completion
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

## prompt
PS1="\`
if [ \$? = 0 ]; then 
    echo \[\e[36m\]; 
else 
    echo \[\e[31m\]; 
fi
\`[\u@\H \w]\[\e[0m\]\n$"
