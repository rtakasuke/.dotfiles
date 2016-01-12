export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export EDITOR=vim
bindkey -e
setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt correct_all

## 補完
setopt list_packed
setopt list_types
setopt auto_list
setopt auto_menu
setopt auto_param_slash
setopt magic_equal_subst

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
