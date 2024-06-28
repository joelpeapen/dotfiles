setopt auto_menu
setopt glob_dots
setopt always_to_end
unsetopt flowcontrol
unsetopt menu_complete
setopt complete_in_word

autoload zmv
zmodload zsh/complist
autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' menu no # for old menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

zstyle ':completion:*' group-name ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' completer _expand_alias _complete _approximate _extensions _ignored
zstyle ':completion:*:*:-command-:*:*' group-order builtins alias functions commands

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:messages' format ' %F{purple} %d %f'
zstyle ':completion:*:warnings' format ' %F{red}no matches found %f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':fzf-tab:*' ignore 3
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-space:toggle-preview'
zstyle ':fzf-tab:complete:*' fzf-preview ' '

zstyle ':fzf-tab:complete:man:*' fzf-preview 'man $word'
zstyle ':fzf-tab:complete:(cd|ls):*' fzf-preview 'eza -l --icons --no-user --no-time --color=always $realpath'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts'\
    hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

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
