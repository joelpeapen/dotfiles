export PATH=$HOME/.local/bin:$PATH

export PLATFORM="$(uname)"
export OS_RELEASE="$(grep "^NAME" /etc/os-release | sed -E 's/^.*"(.*)"$/\1/')"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export DATA="$HOME/Documents"

# ZSHCONFIG
export HISTSIZE=10000
export SAVEHIST=10000
export HIST_STAMPS="%d/%m/%y %T"
export HISTFILE="$HOME/.zsh_history"

# DOTFILES
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSHRC="$ZDOTDIR/.zshrc"
export DOTDIR="$DATA/config/dotfiles/mine"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripconf"

export TERMINAL="$(ps -p $PPID -o comm=)"
export EDITOR="nvim"

export PAGER="moar"
export MOAR="--statusbar=bold --no-linenumbers=false"

export BROWSER="librewolf --private-window"
