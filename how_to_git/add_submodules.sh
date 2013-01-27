#!/bin/bash

# Example: add_submodules.sh ~/Documents/linux/dot_files git://github.com/Lokaltog/powerline.git .vim/bundle/powerline

echo "Going to add submodule '$2' in '$1/$3'"
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN

# 0/ Go to the base repository dir
CMD_EXEC="cd $1"
echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo

# 1/ Add submodule:
CMD_EXEC="git submodule add $2 $3"
echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo

## All submodules:

#git submodule add https://github.com/gmarik/vundle.git .vim/bundle/vundle
#git submodule add https://github.com/vim-scripts/Color-Sampler-Pack.git .vim/bundle/Color-Sampler-Pack
#git submodule add https://github.com/vim-scripts/IndexedSearch.git .vim/bundle/IndexedSearch
#git submodule add https://github.com/vim-scripts/bandit.vim.git .vim/bundle/bandit
#git submodule add https://github.com/vim-scripts/a.vim.git .vim/bundle/a
#git submodule add https://github.com/vim-scripts/Enter-Indent.git .vim/bundle/Enter-Indent
#git submodule add https://github.com/vim-scripts/grep.vim.git .vim/bundle/grep
#git submodule add https://github.com/vim-scripts/gtags.vim.git .vim/bundle/gtags
#git submodule add https://github.com/vim-scripts/marvim.git .vim/bundle/marvim
#git submodule add https://github.com/vim-scripts/matchit.zip.git .vim/bundle/matchit
#git submodule add https://github.com/vim-scripts/Rename2.git .vim/bundle/Rename2
#git submodule add https://github.com/vim-scripts/sessionman.vim.git .vim/bundle/sessionman
#git submodule add https://github.com/vim-scripts/TabBar.git .vim/bundle/TabBar
#git submodule add https://github.com/vim-scripts/Vimball.git .vim/bundle/Vimball
#git submodule add https://github.com/gregsexton/MatchTag.git .vim/bundle/MatchTag
#git submodule add https://github.com/coderifous/textobj-word-column.vim.git .vim/bundle/textobj-word-column
#git submodule add https://github.com/tyru/current-func-info.vim.git .vim/bundle/current-func-info
#git submodule add https://github.com/bogado/file-line.git .vim/bundle/file-line
#git submodule add https://github.com/sjl/gundo.vim.git .vim/bundle/gundo
#git submodule add https://github.com/kien/ctrlp.vim.git .vim/bundle/ctrlp
#git submodule add https://github.com/Rykka/localbundle.vim.git .vim/bundle/localbundle
#git submodule add https://github.com/nathanaelkane/vim-indent-guides.git .vim/bundle/vim-indent-guides
#git submodule add https://github.com/Shougo/neocomplcache.git .vim/bundle/neocomplcache
#git submodule add https://github.com/Shougo/neocomplcache-snippets-complete.git .vim/bundle/neocomplcache-snippets-complete
#git submodule add https://github.com/Shougo/vimproc.git .vim/bundle/vimproc
#git submodule add https://github.com/Lokaltog/vim-powerline.git .vim/bundle/vim-powerline
#git submodule add https://github.com/tomtom/quickfixsigns_vim.git .vim/bundle/quickfixsigns_vim
#git submodule add https://github.com/duff/vim-scratch.git .vim/bundle/vim-scratch
#git submodule add https://github.com/tpope/vim-surround.git .vim/bundle/vim-surround
#git submodule add https://github.com/scrooloose/nerdcommenter.git .vim/bundle/nerdcommenter
#git submodule add https://github.com/scrooloose/nerdcommenter.git .vim/bundle/nerdcommenter
#git submodule add https://github.com/vim-scripts/CVSconflict.git .vim/bundle/CVSconflict
#git submodule add https://github.com/vim-scripts/DirDiff.vim.git .vim/bundle/DirDiff
#git submodule add https://github.com/vim-scripts/DoxygenToolkit.vim.git .vim/bundle/DoxygenToolkit
#git submodule add https://github.com/vim-scripts/errormarker.vim.git .vim/bundle/errormarker
#git submodule add https://github.com/kana/vim-exjumplist.git .vim/bundle/vim-exjumplist

#git submodule add https://github.com/chin4ski/Mark--Karkat.git .vim/bundle/Mark--Karkat

#git submodule add https://github.com/abudden/TagHighlight.git .vim/bundle/TagHighlight
#git submodule add https://github.com/mbbill/undotree.git .vim/bundle/undotree
#git submodule add git://repo.or.cz/vcscommand.git .vim/bundle/vcscommand
#git submodule add https://github.com/tpope/vim-repeat.git .vim/bundle/vim-repeat
#git submodule add https://github.com/othree/xml.vim.git .vim/bundle/xml
#git submodule add https://github.com/guns/xterm-color-table.vim.git .vim/bundle/xterm-color-table
#git submodule add https://github.com/maxbrunsfeld/vim-yankstack.git .vim/bundle/vim-yankstack
#git submodule add https://github.com/vim-scripts/aftersyntaxc.vim.git .vim/bundle/aftersyntaxc

# 2/ Register all added submodules:
CMD_EXEC="git submodule init"
echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo

# 3/ Pull sources for sudmodules:
CMD_EXEC="git submodule update"
echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo

