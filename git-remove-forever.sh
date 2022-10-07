#!/bin/bash
set -o errexit

# Author: David Underhill https://gist.github.com/wdalmut/1610856
# Script to permanently delete files/folders from your git repository.  To use
# it, cd to your repository's root and then run the script with a list of paths
# you want to delete
# Usage: ./git-remove-forever.sh path1 path2 path3

RED="\033[0;31m"
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

if [ $# -eq 0 ]; then
    exit 0
fi

# make sure we're at the root of git repo
if [ ! -d .git ]; then
    echo $RED "Error: must run this script from the root of a git repository" $NOCOLOR
    exit 1
fi

# remove all paths passed as arguments from the history of the repo
files=$@
git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch $files" HEAD

# remove the temporary history git-filter-branch otherwise leaves behind for a long time
rm -rf .git/refs/original/ && git reflog expire --all &&  git gc --aggressive --prune

echo $GREEN "Done! All traces of $files have been removed from the history of this repository" $NOCOLOR
