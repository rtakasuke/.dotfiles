#!/bin/bash

# CI 例外処理用
set -e

BASE_DIR=$(cd "$(dirname "$0")" && cd .. && pwd)

echo -e "\n### Create ~/.config directory"
CONFIG_DIR=~/.config
if [ ! -d "$CONFIG_DIR" ]
then
    mkdir "$CONFIG_DIR"
    echo "created."
else
    echo "already exit."
fi

echo -e "\n### Create symlinks for dotfiles"
ln -vsf "$BASE_DIR"/bash_profile ~/.bash_profile
ln -vsf "$BASE_DIR"/bashrc       ~/.bashrc
ln -vsf "$BASE_DIR"/gitconfig    ~/.gitconfig
ln -vsf "$BASE_DIR"/tigrc        ~/.tigrc
ln -vsf "$BASE_DIR"/zshenv       ~/.zshenv
ln -vsf "$BASE_DIR"/zshrc        ~/.zshrc
ln -vsf "$BASE_DIR"/nvim         "$CONFIG_DIR"/nvim

echo -e "\n### Install dein.vim (for neovim)"
DEIN_CACHE_DIR=~/.cache/dein
DEIN_VIM_INSTALLER=$BASE_DIR/dein_vim_installer.sh
if [ -f ${DEIN_CACHE_DIR}/repos/github.com/Shougo/dein.vim ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > "$DEIN_VIM_INSTALLER"
    sh "$DEIN_VIM_INSTALLER" "$DEIN_CACHE_DIR"
    rm "$DEIN_VIM_INSTALLER"
else
    echo "already installed."
fi

echo -e "\n[Finish]"
