# zprofile is run in login shells before zshrc
# Use this for exporting environment variables and modifying the PATH

export EDITOR=nvim

eval "$(/opt/homebrew/bin/brew shellenv)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nick/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nick/lib/google-cloud-sdk/path.zsh.inc'; fi

typeset -U path
path=(~/bin $path)

export PATH="/Users/nick/.asdf/shims:$PATH"

# Rust-lang
source "$HOME/.cargo/env"
