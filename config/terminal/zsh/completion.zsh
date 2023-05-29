unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# Completion
autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit # bash completion
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload zmv

zstyle ':completion:*:*:*:*:*' menu select
unset CASE_SENSITIVE HYPHEN_INSENSITIVE
# case insensitive (all), partial-word and substring completion
if [[ "$CASE_SENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
    if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
    else
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
    fi
fi

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
#
# # disable named-directories autocompletion
# zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
#
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
    clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
    gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
    ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
    operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
    usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show
#
# if [[ ${COMPLETION_WAITING_DOTS:-false} != false ]]; then
#   expand-or-complete-with-dots() {
#     # use $COMPLETION_WAITING_DOTS either as toggle or as the sequence to show
#     [[ $COMPLETION_WAITING_DOTS = true ]] && COMPLETION_WAITING_DOTS="%F{red}…%f"
#     # turn off line wrapping and print prompt-expanded "dot" sequence
#     printf '\e[?7l%zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}s\e[?7h' "${(%)COMPLETION_WAITING_DOTS}"
#     zle expand-or-complete
#     zle redisplay
#   }
#   zle -N expand-or-complete-with-dots
#   # Set the function as the default tab completion widget
#   bindkey -M emacs "^I" expand-or-complete-with-dots
#   bindkey -M viins "^I" expand-or-complete-with-dots
#   bindkey -M vicmd "^I" expand-or-complete-with-dots
# fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# vim bindings for completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
