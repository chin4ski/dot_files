#!/bin/bash

if [ $1 == "-h" ]; then
  echo "Example:"
  echo "remove_submodule.sh ~/Documents/linux/repos/dot_files .vim/bundle/powerline"
  echo
  exit 0
fi


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

# 3/ Remove dir
CMD_EXEC="rm -rf $2"

echo $CMD_EXEC
echo "Press <Ctrl-C> to stop, another key to continue ..."
read $CMD_IN
eval $CMD_EXEC
echo
