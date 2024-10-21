source $ZDOTDIR/plugin/fzf-tab/fzf-tab.zsh
source $ZDOTDIR/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugin/zsh-history-substring-search/zsh-history-substring-search.zsh

source $ZDOTDIR/addon/fzf.zsh
source $ZDOTDIR/addon/syntax.zsh

# autosuggest
bindkey '^ ' autosuggest-accept

export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh)"

eval "$(navi widget zsh)"
eval "$(starship init zsh)"
