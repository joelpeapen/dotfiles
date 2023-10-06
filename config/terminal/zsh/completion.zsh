setopt auto_menu
setopt always_to_end
unsetopt flowcontrol
unsetopt menu_complete
setopt complete_in_word

autoload zmv
zmodload zsh/complist
autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' completer _expand_alias _complete _approximate _extensions _ignored

zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format ' %F{purple} %d %f'
zstyle ':completion:*:warnings' format ' %F{red}no matches found %f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green} --- %d --- %f'
zstyle ':completion:*:*:-command-:*:*' group-order builtins alias functions commands

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# known ssh hosts
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts'\
    hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

unset CASE_SENSITIVE HYPHEN_INSENSITIVE
if [[ "$CASE_SENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
    if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
    else
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
    fi
fi

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
