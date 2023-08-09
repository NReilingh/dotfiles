# zshrc is run in interactive shells
# Use this to change how the interactive prompt works
# Use .zprofile if you also need to modify non-interactive environment.

export EDITOR=nvim

# This used to be a zsh thing where setting the editor would also set the
# zle keybinds, but now it seems to be a tmux thing???
# Anyway, this allows the control-a/e/n/p shortcuts (i.e. emacs mode)
# to work in zsh in tmux. I don't pretend to fully understand this.
bindkey -e

export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo:$HOME/.terminfo

eval "$(direnv hook zsh)"

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/lib/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/lib/google-cloud-sdk/completion.zsh.inc"; fi

# Replace vi with nvim, but leave vim alone
alias vi=nvim
alias ll='ls -lAGh'

# Use cdpath for Repositories
cdpath=(~/Repositories)

# Also try using autopushd
setopt autopushd

# Fix run-help
unalias run-help
autoload run-help
alias help=run-help

# History bullshit
# Store verbose history format, shared between shells, and
# write after each command finishes
setopt EXTENDED_HISTORY INC_APPEND_HISTORY_TIME
# Suppress commands from history with leading space;
# don't store history in history
setopt HIST_IGNORE_SPACE HIST_NO_STORE

# Enables mouse scroll inside of tmux for manpages and such.
export LESS=--mouse

# PATH additions that are only used interactively
export PATH="$HOME/Repositories/meta-dotfiles/build/bin:$PATH"
export PATH="$HOME/Library/Developer/Xcode/DerivedData/tesspost-elmkciapibsokrarafnjuvjxgyev/Build/Products/Debug:$PATH"

# ngrok completion
if [ -x $(which ngrok) ]; then
  source <(ngrok completion)
fi
