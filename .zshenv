if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh

export PATH="$HOME/.asdf/shims:$PATH"
