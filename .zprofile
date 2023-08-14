# My user profile for zsh login shells.

# CD to these paths with ~varname
# This leverages the named directory hashtable.
# See man zshbuiltins (search hash) for more info
gd=/Volumes/GoogleDrive/My\ Drive
batches=~gd/Finance\ Data/Batches
repos=~/Repositories

fpath=(~/.zfunc $fpath)
#autoload repovet

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

