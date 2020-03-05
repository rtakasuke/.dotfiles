#!/bin/bash

BASE_DIR=$(cd $(dirname $0) && cd .. && pwd)

# CIエラー処理用
set -e

echo "### Create symlinks for dotfiles"
ln -sf $BASE_DIR/bash_profile ~/.bash_profile
ln -sf $BASE_DIR/bashrc       ~/.bashrc
ln -sf $BASE_DIR/nvim         ~/.config/nvim
ln -sf $BASE_DIR/gitconfig    ~/.gitconfig
ln -sf $BASE_DIR/tigrc        ~/.tigrc

echo "### Install dein.vim (neovim)"
DEIN_CACHE_DIR=~/.cache/dein
if [ -f ${DEIN_CACHE_DIR}/repos/github.com/Shougo/dein.vim ]; then
    DEIN_VIM_INSTALLER=$BASE_DIR/dein_vim_installer.sh
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $DEIN_VIM_INSTALLER
    sh $DEIN_VIM_INSTALLER $DEIN_CACHE_DIR
    rm $DEIN_VIM_INSTALLER
else
    echo "dein.vim already installed."
fi

hoogehoge
echo -e "\n[Finish]"
