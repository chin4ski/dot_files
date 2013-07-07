#!/bin/bash

if [ $1 == "-h" ]; then
  echo "Example:"
  echo "add_submodules.sh ~/Documents/linux/dot_files https://github.com/Lokaltog/powerline.git .vim/bundle/powerline"
  echo
  exit 0
fi

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

echo "Done!"
echo
echo "Remember to:"
echo "  - Add the bundle in .vimrc"
echo "  - Call :LocalBundle from vim"
echo
