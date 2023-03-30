# zshrc is run in interactive shells
# Use this to change how the interactive prompt works

# In zprofile we set editor to vim, so this resets the zle back to emacs mode.
bindkey -e

eval "$(direnv hook zsh)"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nick/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nick/lib/google-cloud-sdk/completion.zsh.inc'; fi

# Replace vi with nvim, but leave vim alone
alias vi=nvim
alias ll='ls -lAh'

# History bullshit
# Store verbose history format, shared between shells, and
# write after each command finishes
setopt EXTENDED_HISTORY INC_APPEND_HISTORY_TIME
# Suppress commands from history with leading space;
# don't store history in history
setopt HIST_IGNORE_SPACE HIST_NO_STORE

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/Users/nick/.asdf/shims:$PATH"
export PATH="$HOME/Repositories/meta-dotfiles/build/bin:$PATH"
