# source $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--preview 'bat --line-range=:500 {}'"
export FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name '\''*.tags'\'' -printf '\''%P\n'\'

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# ----------SETTINGS--------------

# completion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8d8678,bg=#TRANSPARENT"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

typeset -gA ZSH_HIGHLIGHT_STYLES

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=none
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=160,bold
    ZSH_HIGHLIGHT_STYLES[alias]=fg=070,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=063,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=056,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=063,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=063,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
    if [[ $THEME_MODE == "dark" ]]; then
        ZSH_HIGHLIGHT_STYLES[path]=fg=250,underline
    else
        ZSH_HIGHLIGHT_STYLES[path]=fg=235,underline
    fi
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=015,underline
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=172,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=none,bold
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=none,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=076
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=076
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=190
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=190
    ZSH_HIGHLIGHT_STYLES[assign]=fg=037
fi

bindkey '^ ' autosuggest-accept
