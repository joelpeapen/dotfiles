# files
alias l='eza'
alias la='eza -a'
alias lr="eza -R"
alias ll="eza -l --icons"
alias lla="eza -la --icons"
alias md="mkdir -p"
alias pwd="pwd | sed 's/ /\\ /'"
alias clearhist="rm ~/.zsh_history"

# programs
alias vim="nvim"
alias du="du -h"
alias fd="fd -LH"
alias sed="sed -E"
alias echo="echo -e"
alias less="less -R"
alias wget="wget -c"
alias open="xdg-open"
alias nano="nano -ESljmibq"
alias grep="grep -i --color=auto"
alias sdiff='sdiff -tr --color=always'
alias diff='/usr/bin/diff -trp --color=always'
alias ls='ls --color=auto --hyperlink=auto --group-directories-first'
alias eza='eza -F --hyperlink --color=always --group-directories-first'

alias icat="kitten icat"
alias python="python3.10"
alias connect="kitten ssh"
alias code='code --proxy-server="192.168.13.2:3128"'

alias gcc="gcc -std=c18"
alias g++="g++ -std=c++17"

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="&>/dev/null"

alias -g D='&>/dev/null &; disown %$(ps -p $! -o comm=)'

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
