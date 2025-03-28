setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

# emacs bindings
bindkey -e

# Colors
set termguicolors

# configs
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/mappings.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/myfuncs.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
