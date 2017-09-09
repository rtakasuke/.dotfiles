# Path
export PATH=$PATH:/usr/local/mysql/bin
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH=/usr/local/share:$PATH
export PATH=~/git/bin:$PATH

# .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# らくらくオプション移動
stty stop undef
