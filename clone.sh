#!/bin/sh

# Check to see if environment variables exist. If they don't,
# use standard locations
: "${DOCS:?$HOME/Documents}"
: "${GIT:?$DOCS/git}"

repos=(astro lnr plotspec plottools readfile stattools)

# Are you sure?
echo
read -r -p "Cloning ${#repos[@]} repositories to $GIT. Continue? [y/N] " \
    answer
echo
# default answer
if [[ $answer =~ "" ]]; then
    answer=no
fi
# make answer lower case
answer=${answer,,}
# So, did you want to do this?
case $answer in
    n|no ) echo Exiting.; exit;;
esac

for repo in ${repos[@]}
do
    echo $repo
    dir=$GIT/$repo
    http=https://github.com/cristobal-sifon/${repo}.git
    if [ -d "$dir" ]; then
        echo "Folder $dir exists. Not cloning."
    else
        git clone $http
    fi
done


