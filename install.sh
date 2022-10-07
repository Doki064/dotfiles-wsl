#!/bin/sh

### This script symlinks the dotfiles into place in the home directory.

RED="\033[0;31m"
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

if [ -n "$SUDO_COMMAND" ]; then
    echo $RED "Error: please do not run this script with sudo" $NOCOLOR
    exit 1
fi

cd "$(pwd)"

# Install personal zsh config
if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi

for f in $(find zsh/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.zsh/.$(basename $f)"

    if [ -L "$HOME/.zsh/.$(basename $f)" ] && [ -e "$HOME/.zsh/.$(basename $f)" ]; then
        echo $GREEN "Installed successfully" $NOCOLOR
    else
        echo $RED "Error: $f failed to install" $NOCOLOR
    fi
done

ln -svfn "$(readlink -f ./zshenv)" "$HOME/.zshenv"
if [ -L "$HOME/.zshenv" ] && [ -e "$HOME/.zshenv" ]; then
    echo $GREEN "Installed successfully" $NOCOLOR
else
    echo $RED "Error: $(pwd)/zshenv failed to install" $NOCOLOR
fi

ln -svfn "$(readlink -f ./p10k.zsh)" "$HOME/.p10k.zsh"
if [ -L "$HOME/.p10k.zsh" ] && [ -e "$HOME/.p10k.zsh" ]; then
    echo $GREEN "Installed successfully" $NOCOLOR
else
    echo $RED "Error: $(pwd)/p10k.zsh failed to install" $NOCOLOR
fi

# Install gnupg config
if [ ! -d "$HOME/.gnupg" ]; then
    mkdir "$HOME/.gnupg"
fi

for f in $(find gnupg/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.gnupg/$(basename $f)"

    if [ -L "$HOME/.gnupg/$(basename $f)" ] && [ -e "$HOME/.gnupg/$(basename $f)" ]; then
        echo $GREEN "Installed successfully" $NOCOLOR
    else
        echo $RED "Error: $f failed to install" $NOCOLOR
    fi
done

chown -R "$USER:$(id -gn)" ~/.gnupg
find ~/.gnupg -type f -exec chmod 600 {} \;  # Set 600 for files
find ~/.gnupg -type d -exec chmod 700 {} \;  # Set 700 for directories

# Install ssh config
if [ ! -d "$HOME/.ssh" ]; then
    mkdir "$HOME/.ssh"
fi

for f in $(find ssh/* -type f); do
    ln -svfn "$(readlink -f $f)" "$HOME/.ssh/$(basename $f)"

    if [ -L "$HOME/.ssh/$(basename $f)" ] && [ -e "$HOME/.ssh/$(basename $f)" ]; then
        echo $GREEN "Installed successfully" $NOCOLOR
    else
        echo $RED "Error: $f failed to install" $NOCOLOR
    fi
done

chown -R "$USER:$(id -gn)" ~/.ssh
find ~/.ssh -type f -exec chmod 600 {} \;  # Set 600 for files
find ~/.ssh -type d -exec chmod 700 {} \;  # Set 700 for directories

# Install git config
ln -svfn "$(readlink -f ./gitconfig)" "$HOME/.gitconfig"
if [ -L "$HOME/.gitconfig" ] && [ -e "$HOME/.gitconfig" ]; then
    echo $GREEN "Installed successfully" $NOCOLOR
else
    echo $RED "Error: $(pwd)/gitconfig failed to install" $NOCOLOR
fi

ln -svfn "$(readlink -f ./gitignore)" "$HOME/.gitignore"
if [ -L "$HOME/.gitignore" ] && [ -e "$HOME/.gitignore" ]; then
    echo $GREEN "Installed successfully" $NOCOLOR
else
    echo $RED "Error: $(pwd)/gitignore failed to install" $NOCOLOR
fi

ln -svfn "$(readlink -f ./gitattributes)" "$HOME/.gitattributes"
if [ -L "$HOME/.gitattributes" ] && [ -e "$HOME/.gitattributes" ]; then
    echo $GREEN "Installed successfully" $NOCOLOR
else
    echo $RED "Error: $(pwd)/gitattributes failed to install" $NOCOLOR
fi
