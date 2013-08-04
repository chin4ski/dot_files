## Setup:
git config --global user.name "chin4ski"
git config --global user.email "chinaskii82@gmail.com"
git config --global credential.helper 'cache --timeout=36000'

## Push commits to github:
git remote add origin https://github.com/chin4ski/dot_files.git
git push origin master

## Pull new commits from github to local repo for all submodules (to be run from project root):
git submodule foreach git pull origin master

## Add a submodule:
--> use add_submodules.sh

## Remove a submodule:
--> use remove_submodule.sh

## To switch from an already added original submodule to a own forked version of it
#1/ Fork the submodule on github
#2/ Replace the submodule URL in file .gitmodules
#3/ From main project roon, run:
git submodule sync

## To commit in forked submodule
# 1/ Commit/push your submodule's changes:
cd submodule_repo
git add <stuff>
git commit -m "comment"
git push
# 2/ Tell your main project to track the updated version.
#From the main project root dir:
git add .vim/bundle/submodule
git commit -m "updated my submodule"
git push

## For forked repos:
# Pull new commits from the original repo you forked the submodule from, and merge modif with your forked repo:
# Fetches any new changes from the original repository  & Merges any changes fetched into your working files
git fetch upstream && git merge upstream/master

## If a submodule is dirty, you can undo all changes by:
cd .vim/bundle/submodule
git checkout .

## If you have HEAD detached for a submodule
cd .vim/bundle/submodule
git checkout master


