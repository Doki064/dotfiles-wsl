# Connect to display
export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"

export GPG_TTY=$TTY

# Set zsh dotfile directory
export ZDOTDIR=$HOME/.zsh
source $ZDOTDIR/.zshenv
