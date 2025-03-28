# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\w\a\]$PS1" ;;
    *) ;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -s nocaseglob
shopt -s expand_aliases # aliases everywhere

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# --- aliases ---

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# files
alias l='ls'
alias la='ls -a'
alias ll="ls -l"
alias lr="ls -R"
alias lla="ls -la"
alias md="mkdir -p"
alias ls='ls --color=auto --hyperlink=auto --group-directories-first'
alias pwd="pwd | sed 's/ /\\ /'"

# programs
alias sed="sed -E"
alias echo="echo -e"
alias less="less -R"
alias wget="wget -c"
alias open="xdg-open"
alias nano="nano -ESljmibq"
alias grep="grep -i --color=auto"
alias sdiff='sdiff -tr --color=always'
alias diff='/usr/bin/diff -trp --color=always'

alias gcc="gcc -std=c18"
alias g++="g++ -std=c++17"

alias H='| head'
alias T='| tail'
alias G='| grep'
alias L="| moar"
alias LL="2>&1 | less"
alias CA="2>&1 | cat -A"
alias NE="2> /dev/null"
alias NUL="&>/dev/null"

# git
alias gq="git amend"
alias gcommit="git commit -v "
alias kdiff="git difftool --no-symlinks --dir-diff"
alias fcho="git for-each-ref --format='%(refname:short)' refs/heads |fzf|xargs git checkout"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PLATFORM="$(uname)"
export TERMINAL="$(ps -p $PPID -o comm=)"
export OS_RELEASE="$(grep "^NAME" /etc/os-release | sed -E 's/^.*"(.*)"$/\1/')"

export EDITOR="nvim"
export BROWSER="librewolf --private-window"
