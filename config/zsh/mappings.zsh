bindkey -s ',q' "\n"

bindkey -s ',f' "l\n"
bindkey -s ',a' "ll\n"
bindkey -s '\eo' "lf\n"

bindkey -s ',2' "sync-dots\n"
bindkey -s ',g' "git status\n"
bindkey -s ',c' "git oneline\n"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey "\em" copy-prev-shell-word

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
