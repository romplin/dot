# ~/.bashrc: Executed by bash for non-login shells.

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# --- History Control ---
# Don't save duplicate lines or lines starting with a space.
export HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it.
shopt -s histappend
# Set history length.
export HISTSIZE=1000
export HISTFILESIZE=2000

# Update window size after each command.
shopt -s checkwinsize

# --- macOS Color Support ---
# Enable colors for commands like ls.
export CLICOLOR=1
# Set the color scheme (e.g., blue directories).
export LSCOLORS=ExFxBxDxCxegedabagacad

# --- Aliases ---
# --- Prompt Configuration ---
export PS1='\[\033[32m\]\u\[\033[00m\]@\[\033[33m\]\h\[\033[00m\]:\[\033[35m\]\w\[\033[00m\]\$ '
# Handy ls aliases
alias ls='ls -G' # -G is the flag for color on macOS
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Colorize grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Custom Git alias
alias gitready='git add . && git commit -m "ready" && git push'

# macOS-compatible "alert" alias for long-running commands.
# Usage: sleep 10; alert
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'

# --- PATH Management ---
# Helper function to add a directory to PATH only if it's not already there.
add_to_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Clear PATH of duplicates from previous sessions before rebuilding.
# This ensures a clean slate every time the file is sourced.
PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: '!a[$0]++{if (NR>1) printf ORS; printf $0}')

# System and language paths
add_to_path "/usr/local/go/bin"
add_to_path "$HOME/go/bin"
add_to_path "$HOME/.cargo/env"
add_to_path "$HOME/.docker/bin"

# Python paths (added by pipx)
add_to_path "$HOME/Library/Python/3.12/bin"
add_to_path "$HOME/.local/bin"

# Foundry path
add_to_path "$HOME/.foundry/bin"

# Terraform completion
if [ -f /usr/bin/terraform ]; then
    complete -C /usr/bin/terraform terraform
fi

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Clean up the helper function so it doesn't linger in the shell.
unset -f add_to_path

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
