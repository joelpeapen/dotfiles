source $ZDOTDIR/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243,bg=#TRANSPARENT"

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=none
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=#dc6472,bold
    ZSH_HIGHLIGHT_STYLES[alias]=fg=70,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=69,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=99,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=69,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=69,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=37
    ZSH_HIGHLIGHT_STYLES[path]=fg=250,underline
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=33
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=15,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=none,bold
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=none,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=46
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=46
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=46
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=46
    ZSH_HIGHLIGHT_STYLES[assign]=fg=37
fi
