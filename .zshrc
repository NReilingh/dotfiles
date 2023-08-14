alias ll="ls -lAhG"
alias ytdl="youtube-dl -f bestaudio -x --audio-format mp3"
alias shit_vantiv="sed -e 's/^\(\([^,]*,\)\{26\}\)\(.*,\)\(\([^,]*,\)\{8\}\)
$/\1\4/'"

eval "$(direnv hook zsh)"

# twilio autocomplete setup
TWILIO_AC_ZSH_SETUP_PATH=$HOME/.twilio-cli/autocomplete/zsh_setup && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH;

autoload -Uz compinit
compinit
source $HOME/.jfrog/jfrog_zsh_completion

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

export PATH="$HOME/Repositories/meta-dotfiles/build/bin:$PATH"

export GPG_TTY=$(tty)

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
