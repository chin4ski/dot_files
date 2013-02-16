#!/bin/bash

# Example: remove_submodule.sh ~/Documents/linux/dot_files .vim/bundle/powerline

echo "Going to remove submodule '$2' from '$1'"
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN

# 1/ Go to the base repository dir
CMD_EXEC="cd $1"
echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo


# 2/ Remove submodule
CMD_EXEC="git config -f .git/config --remove-section submodule.$2 \
  && git config -f .gitmodules --remove-section submodule.$2 \
  && git rm --cached $2"

echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo


## All submodules:

#git config -f .git/config --remove-section submodule..vim/bundle/vcscommand
#git config -f .gitmodules --remove-section submodule..vim/bundle/vcscommand
#git rm --cached .vim/bundle/vcscommand

#git config -f .git/config --remove-section submodule..vim/bundle/a.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/a.vim
#git rm --cached .vim/bundle/a.vim

#git config -f .git/config --remove-section submodule..vim/bundle/aftersyntaxc.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/aftersyntaxc.vim
#git rm --cached .vim/bundle/aftersyntaxc.vim

#git config -f .git/config --remove-section submodule..vim/bundle/asyncfinder.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/asyncfinder.vim
#git rm --cached .vim/bundle/asyncfinder.vim

#git config -f .git/config --remove-section submodule..vim/bundle/bandit.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/bandit.vim
#git rm --cached .vim/bundle/bandit.vim

#git config -f .git/config --remove-section submodule..vim/bundle/ctrlp.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/ctrlp.vim
#git rm --cached .vim/bundle/ctrlp.vim

#git config -f .git/config --remove-section submodule..vim/bundle/current-func-info.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/current-func-info.vim
#git rm --cached .vim/bundle/current-func-info.vim

#git config -f .git/config --remove-section submodule..vim/bundle/grep.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/grep.vim
#git rm --cached .vim/bundle/grep.vim

#git config -f .git/config --remove-section submodule..vim/bundle/gtags.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/gtags.vim
#git rm --cached .vim/bundle/gtags.vim

#git config -f .git/config --remove-section submodule..vim/bundle/gundo.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/gundo.vim
#git rm --cached .vim/bundle/gundo.vim

#git config -f .git/config --remove-section submodule..vim/bundle/localbundle.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/localbundle.vim
#git rm --cached .vim/bundle/localbundle.vim

#git config -f .git/config --remove-section submodule..vim/bundle/sessionman.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/sessionman.vim
#git rm --cached .vim/bundle/sessionman.vim

#git config -f .git/config --remove-section submodule..vim/bundle/textobj-word-column.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/textobj-word-column.vim
#git rm --cached .vim/bundle/textobj-word-column.vim 

#git config -f .git/config --remove-section submodule..vim/bundle/xml.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/xml.vim
#git rm --cached .vim/bundle/xml.vim

#git config -f .git/config --remove-section submodule..vim/bundle/xterm-color-table.vim
#git config -f .gitmodules --remove-section submodule..vim/bundle/xterm-color-table.vim
#git rm --cached .vim/bundle/xterm-color-table.vim

#git config -f .git/config --remove-section submodule..vim/bundle/neocomplcache-snippets-complete
#git config -f .gitmodules --remove-section submodule..vim/bundle/neocomplcache-snippets-complete
#git rm --cached .vim/bundle/neocomplcache-snippets-complete

