## bash_profile
export PATH=$PATH:/usr/local/mysql/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

## PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH=/usr/local/share:$PATH

# Encode
export LANG=ja_JP.utf8
export LC_ALL=ja_JP.UTF-8

## alias
alias ls='ls -G'
alias ll='ls -l'
alias l='ls -l'
alias rm='rm -i'
# for screen
alias sc='screen'
alias scr='screen -r'
alias scd='screen -d'

## prompt
PS1="\`
if [ \$? = 0 ]; then 
    echo \[\e[36m\]; 
else 
    echo \[\e[31m\]; 
fi
\`[\u@\H \w]\[\e[0m\]\n$"
