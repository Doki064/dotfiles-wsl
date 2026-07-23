#!/bin/sh

### This script symlinks the dotfiles into place in the home directory.

RED="\033[0;31m"
GREEN="\033[0;32m"
NOCOLOR="\033[0m"

if [ -n "$SUDO_COMMAND" ]; then
    echo $RED "Error: please do not run this script with sudo" $NOCOLOR
    exit 1
fi

cd "$(dirname "$0")"

# link <repo-file> <target>: symlink target to the repo file
link() {
    ln -svfn "$(readlink -f "$1")" "$2"

    if [ -L "$2" ] && [ -e "$2" ]; then
        echo $GREEN "Installed successfully" $NOCOLOR
    else
        echo $RED "Error: $1 failed to install" $NOCOLOR
    fi
}

# link_dir <repo-dir> <target-dir> [dot]: link every file in a repo dir;
# pass "dot" to prefix each target basename with a dot
link_dir() {
    mkdir -p "$2"
    for f in "$1"/*; do
        [ -f "$f" ] || continue
        link "$f" "$2/${3:+.}$(basename "$f")"
    done
}

# Install personal zsh config
link_dir zsh "$HOME/.zsh" dot
link zshenv "$HOME/.zshenv"
link p10k.zsh "$HOME/.p10k.zsh"

# Install gnupg config
link_dir gnupg "$HOME/.gnupg"
chown -R "$USER:$(id -gn)" "$HOME/.gnupg"
find "$HOME/.gnupg" -type f -exec chmod 600 {} \;  # Set 600 for files
find "$HOME/.gnupg" -type d -exec chmod 700 {} \;  # Set 700 for directories

# Install ssh config
link_dir ssh "$HOME/.ssh"
chown -R "$USER:$(id -gn)" "$HOME/.ssh"
find "$HOME/.ssh" -type f -exec chmod 600 {} \;  # Set 600 for files
find "$HOME/.ssh" -type d -exec chmod 700 {} \;  # Set 700 for directories

# Install git config
link gitconfig "$HOME/.gitconfig"
link gitignore "$HOME/.gitignore"
link gitattributes "$HOME/.gitattributes"

# Install global Claude Code rules (enterprise-context-no-leak.md stays
# private in ~/.claude/rules and is never tracked here)
link_dir claude/rules "$HOME/.claude/rules"

# Install mise config (tool versions)
link_dir config/mise "$HOME/.config/mise"
