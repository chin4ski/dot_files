# 0/ Add submodule using add_submodules.sh && commit it
# 1/ Fork submodule in github webpage
# 2/ Edit ".gitmodules" and change the submodule to point to the forked one
# 3/ Execute:
git submodule sync
# 4/ From the submodule dir:
git remote add upstream https://github.com/.../....git
