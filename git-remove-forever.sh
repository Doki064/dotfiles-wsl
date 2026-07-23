#!/bin/bash
set -o errexit

# Script to permanently delete files/folders from your git repository. To use
# it, cd to your repository's root and then run the script with a list of paths
# you want to delete
# Usage: ./git-remove-forever.sh path1 path2 path3

RED="\033[0;31m"
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

if [ $# -eq 0 ]; then
    exit 0
fi

if ! command -v git-filter-repo >/dev/null 2>&1; then
    echo -e $RED "Error: git-filter-repo is required (https://github.com/newren/git-filter-repo)" $NOCOLOR
    exit 1
fi

# make sure we're at the root of git repo
if [ ! -d .git ]; then
    echo -e $RED "Error: must run this script from the root of a git repository" $NOCOLOR
    exit 1
fi

# remove all paths passed as arguments from the history of the repo
paths=()
for p in "$@"; do
    paths+=(--path "$p")
done
# --force: filter-repo normally refuses to rewrite anything but a fresh clone;
# this script keeps the old filter-branch behavior of running in place
git filter-repo --invert-paths --force "${paths[@]}"

echo -e $GREEN "Done! All traces of $* have been removed from the history of this repository" $NOCOLOR
