# nav
alias -g ..="cd .."
alias -g ...="cd ../.."
alias -g ....="cd ../../.."
alias -g .....="cd ../../../.."

# files
alias md="mkdir -p"
alias ls='ls --color=auto'
# alias l='ls'
# alias la='ls -ah'
# alias ll="ls -lh"
# alias lla='ls -lah'
alias exa='exa --color=always --group-directories-first'
alias l='exa'
alias la='exa -a'
alias ll="exa -l"
alias lla="exa -la"
alias lr="exa -R"
alias open="xdg-open"
alias pwd="pwd | sed 's/ /\\ /'"
alias bat="bat --color=always --style=numbers --theme gruvbox-dark"
alias clearhist="rm ~/.zsh_history"

# programs
alias btop="bpytop"
alias cat="bat"
alias code='code --proxy-server="192.168.13.2:3128"'
alias connect="kitty +kitten ssh"
alias echo="echo -e"
alias fd="fd -H"
alias firefox="/opt/firefox/firefox"
alias grep="grep -i --color=auto"
alias icat="kitty +kitten icat"
alias less="less -R"
alias nvim="nvim --listen /tmp/mykitty"
alias python="python3.10"
alias sed="sed -E"
alias vim="nvim"

# session
alias quit="gnome-session-quit"
alias :q="exit"

# git
alias fcho="git for-each-ref --format='%(refname:short)' refs/heads |fzf|xargs git checkout"
alias kdiff="git difftool --no-symlinks --dir-diff"
alias gcommit="git commit -v "
alias gq="git amend"

# config editing
alias tmuxconfig="$EDITOR $HOME/.tmux.conf"
alias gitconfig="$EDITOR $HOME/.gitconfig"
alias myfuncs="$EDITOR $ZDOTDIR/myfuncs.zsh"

alias temps="watch -n 1 sensors"
