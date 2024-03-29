# zprofile is run in login shells before zshrc
# Use this for exporting environment variables and modifying the PATH

# This WILL affect non-interactive shells, like those spawned by GitKraken for hooks
# Use .zshrc for configuration of interactive shells.

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/lib/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/lib/google-cloud-sdk/path.zsh.inc"; fi

typeset -U path
path=(~/bin $path)

. $(brew --prefix asdf)/libexec/asdf.sh

# Rust-lang
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Perl
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Add ngrok authtoken to env. This is useful for docker containers running ngrok.
if [[ -f $HOME/.ngrok2/ngrok.yml ]]; then
  export NGROK_AUTHTOKEN=$(grep authtoken $HOME/.ngrok2/ngrok.yml | cut -d ' ' -f 2)
fi
