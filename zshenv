#------------------------------------------------------------
# zprof
#------------------------------------------------------------
# zmodload zsh/zprof && zprof


#------------------------------------------------------------
# Path
#------------------------------------------------------------
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH=/usr/local/share:$PATH


#------------------------------------------------------------
# pyenv
#------------------------------------------------------------
if type "pyenv" > /dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi


#------------------------------------------------------------
# neovim
#------------------------------------------------------------
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
