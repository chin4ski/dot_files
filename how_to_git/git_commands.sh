# Setup:
git config --global user.name "chin4ski"
git config --global user.email "chinaskii82@gmail.com"
git config --global credential.helper 'cache --timeout=36000'

# Push commits to github:
git remote add origin https://github.com/chin4ski/dot_files.git
git push origin master

# Update from github to local repo all submodules (to be run from project root):
git submodule foreach git pull origin master

# Add a submodule:
--> use add_submodules.sh

# Remove a submodule:
--> use remove_submodule.sh
git config -f .git/config --remove-section submodule.SUBMODULE_NAME
git config -f .gitmodules --remove-section submodule.SUBMODULE_NAME
git rm --cached PATH_TO_SUBMODULE

# For forked repos:
# Pull new commits from the original repo you forked the submodule from, and merge modif with your forked repo:
# Fetches any new changes from the original repository  & Merges any changes fetched into your working files
git fetch upstream && git merge upstream/master
