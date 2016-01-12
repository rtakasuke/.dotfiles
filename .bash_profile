# ~/.bashrcの内容を読み込む
if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi

# Encode
export LANG=ja_JP.utf8
export LC_ALL=ja_JP.UTF-8

# Path
export PATH=$PATH:/usr/local/mysql/bin
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH=/usr/local/share:$PATH
export PATH=~/git/bin:$PATH

##
# Your previous /Users/rtakasuke/.bash_profile file was backed up as /Users/rtakasuke/.bash_profile.macports-saved_2013-01-14_at_12:44:13
##

# MacPorts Installer addition on 2013-01-14_at_12:44:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
