#!/bin/sh

### This script symlinks the dotfiles into place in the home directory.

cd "$(pwd)"

red="\033[0;31m"
green="\033[0;32m"
nocolor="\033[0m"

# Install personal zsh config
if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi

for f in $(find zsh/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.zsh/.$(basename $f)"

    if [ -L "$HOME/.zsh/.$(basename $f)" ] && [ -e "$HOME/.zsh/.$(basename $f)" ]; then
        echo $green "$HOME/.zsh/.$(basename $f) installed successfully" $nocolor
    else
        echo $red "Error: $f failed to install" $nocolor
    fi
done

ln -svfn "$(readlink -f ./zshenv)" "$HOME/.zshenv"
if [ -L "$HOME/.zshenv" ] && [ -e "$HOME/.zshenv" ]; then
    echo $green "$HOME/.zshenv installed successfully" $nocolor
else
    echo $red "Error: $(pwd)/zshenv failed to install" $nocolor
fi

ln -svfn "$(readlink -f ./p10k.zsh)" "$HOME/.p10k.zsh"
if [ -L "$HOME/.p10k.zsh" ] && [ -e "$HOME/.p10k.zsh" ]; then
    echo $green "$HOME/.p10k.zsh installed successfully" $nocolor
else
    echo $red "Error: $(pwd)/p10k.zsh failed to install" $nocolor
fi

# Install gnupg config
if [ ! -d "$HOME/.gnupg" ]; then
    mkdir "$HOME/.gnupg"
fi

for f in $(find gnupg/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.gnupg/$(basename $f)"

    if [ -L "$HOME/.gnupg/$(basename $f)" ] && [ -e "$HOME/.gnupg/$(basename $f)" ]; then
        echo $green "$HOME/.gnupg/$(basename $f) installed successfully" $nocolor
    else
        echo $red "Error: $f failed to install" $nocolor
    fi
done

chown -R "$USER:$(id -gn)" ~/.gnupg
chmod 700 ~/.gnupg
chmod 600 ~/.gnupg/*

# Install ssh config
if [ ! -d "$HOME/.ssh" ]; then
    mkdir "$HOME/.ssh"
fi

for f in $(find ssh/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.ssh/$(basename $f)"

    if [ -L "$HOME/.ssh/$(basename $f)" ] && [ -e "$HOME/.ssh/$(basename $f)" ]; then
        echo $green "$HOME/.ssh/$(basename $f) installed successfully" $nocolor
    else
        echo $red "Error: $f failed to install" $nocolor
    fi
done

chown -R "$USER:$(id -gn)" ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

# Install git config
ln -svfn "$(readlink -f ./gitconfig)" "$HOME/.gitconfig"
if [ -L "$HOME/.gitconfig" ] && [ -e "$HOME/.gitconfig" ]; then
    echo $green "$HOME/.gitconfig installed successfully" $nocolor
else
    echo $red "Error: $(pwd)/gitconfig failed to install" $nocolor
fi
