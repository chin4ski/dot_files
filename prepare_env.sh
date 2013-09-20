#!/bin/bash

cd $(dirname $0) > /dev/null
DOT_FILES_DIR=$(pwd)
pwd
cd - > /dev/null

cd $HOME

mv -f .zshrc .zshrc.backup
mv -f .zshrc.home .zshrc.home.backup
mv -f .oh-my-zsh .oh-my-zsh.backup
mv -f .Xresources .Xresources.backup
mv -f .tmux.conf tmux.conf.backup
mv -f .vim .vim.backup
mv -f .inputrc .inputrc.backup

ln -s $DOT_FILES_DIR/.zshrc.darmand .zshrc
ln -s $DOT_FILES_DIR/.zshrc.home
ln -s $DOT_FILES_DIR/.oh-my-zsh
ln -s $DOT_FILES_DIR/.Xresources
ln -s $DOT_FILES_DIR/.tmux.conf
ln -s $DOT_FILES_DIR/.vim
ln -s $DOT_FILES_DIR/.inputrc

#ls -tral | grep " \."

echo "Done!"
