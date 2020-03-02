#!/bin/sh

BASE_DIR=$(cd $(dirname $0) && cd .. && pwd)

echo "### Create symlinks for dotfiles"
ln -sf $BASE_DIR/bash_profile ~/.bash_profile
ln -sf $BASE_DIR/bashrc ~/.bashrc
ln -sf $BASE_DIR/gitconfig ~/.gitconfig
ln -sf $BASE_DIR/tigrc ~/.tigrc
ln -sf $BASE_DIR/nvim ~/.config/nvim

echo "### Install dein.vim (neovim)"
DEIN_VIM_INSTALLER=$BASE_DIR/dein_vim_installer.sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $DEIN_VIM_INSTALLER
sh $DEIN_VIM_INSTALLER ~/.cache/dein
rm $DEIN_VIM_INSTALLER

echo "### Install git-prompt.sh"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh

echo "### Install git-completion.bash"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash

