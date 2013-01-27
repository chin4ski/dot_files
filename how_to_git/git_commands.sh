# Setup:
git config --global user.name "chin4ski"
git config --global user.email "chinaskii82@gmail.com"
git config --global credential.helper 'cache --timeout=36000'

# Push commits to github:
git remote add origin https://github.com/chin4ski/dot_files.git
git push origin master

# Update all submodules (from project root):
git submodule foreach git pull origin master

# Add a submodule:
git submodule add https://github.com/PATH/SUBMODULE_NAME.git PATH_TO_SUBMODULE_ON_DISK

# Remove a submodule:
git config -f .git/config --remove-section submodule.SUBMODULE_NAME
git config -f .gitmodules --remove-section submodule.SUBMODULE_NAME
git rm --cached PATH_TO_SUBMODULE
