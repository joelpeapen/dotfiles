source $ZDOTDIR/plugin/fzf-tab/fzf-tab.zsh
source $ZDOTDIR/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugin/zsh-history-substring-search/zsh-history-substring-search.zsh

# ---- settings  ----
source $ZDOTDIR/plugins/fzf.zsh
source $ZDOTDIR/plugins/syntax.zsh

# autosuggest
bindkey '^ ' autosuggest-accept

# history substring search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh)"

eval "$(navi widget zsh)"
eval "$(starship init zsh)"
