# zprofile is run in login shells before zshrc
# Use this for exporting environment variables and modifying the PATH

# This WILL affect non-interactive shells, like those spawned by GitKraken for hooks
# Use .zshrc for configuration of interactive shells.

eval "$(/opt/homebrew/bin/brew shellenv)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nick/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nick/lib/google-cloud-sdk/path.zsh.inc'; fi

typeset -U path
path=(~/bin $path)

. $(brew --prefix asdf)/libexec/asdf.sh

# Rust-lang
source "$HOME/.cargo/env"
