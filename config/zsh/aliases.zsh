# files
alias l='eza -a'
alias lr="eza -R"
alias ll="eza -la --icons"
alias md="mkdir -p"
alias pwd="pwd | sed 's/ /\\ /'"

# programs
alias du="du -h"
alias sed="sed -E"
alias echo="echo -e"
alias less="less -R"
alias wget="wget -c"
alias open="xdg-open"
alias grep="grep -i --color=auto"
alias fd="fd -LH --hyperlink=always"
alias sdiff='sdiff -tr --color=always'
alias diff='/usr/bin/diff -trp --color=always'
alias ls='ls --color=auto --hyperlink=auto --group-directories-first'
alias eza='eza -F --hyperlink --color=always --group-directories-first'

alias icat="kitten icat"
alias connect="kitten ssh"
alias code='code --proxy-server="192.168.13.2:3128"'

alias gcc="gcc -std=c18"
alias g++="g++ -std=c++18"

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="&>/dev/null"

# session
alias :q="exit"
alias quit="gnome-session-quit"

# git
alias gq="git amend"
alias gcommit="git commit -v "
alias kdiff="git difftool --no-symlinks --dir-diff"
alias fcho="git for-each-ref --format='%(refname:short)' refs/heads |fzf|xargs git checkout"

# config editing
alias zshconf="$EDITOR $ZSHRC"
alias gitconf="$EDITOR $HOME/.gitconfig"
alias tmuxconf="$EDITOR $HOME/.tmux.conf"
alias myfuncs="$EDITOR $ZDOTDIR/myfuncs.zsh"
alias nvimconf="$EDITOR $XDG_CONFIG_HOME/nvim/lua/user/settings.lua"

alias temps="watch -n1 sensors"
