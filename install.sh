#!/bin/sh

### This script symlinks the dotfiles into place in the home directory.

cd "$(pwd)"

# Install config files
for f in $(find config/* -type f); do
    if [ ! -d $(dirname "$HOME/.$f") ]; then
        mkdir -p "$HOME/.$(dirname $f)"
    fi
    ln -svfn "$(readlink -f $f)" "$HOME/.$f"
done

# Install personal zsh config
if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi
for f in $(find zsh/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.zsh/.$(basename $f)"
done
ln -svfn "$(readlink -f ./zshenv)" "$HOME/.zshenv"
ln -svfn "$(readlink -f ./p10k.zsh)" "$HOME/.p10k.zsh"

# Install git config
ln -svfn "$(readlink -f ./gitconfig)" "$HOME/.gitconfig"

echo " Done!"
