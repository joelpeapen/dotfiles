#start tmux automatically
if [ -z "$TMUX" ]
then
    tmux attach -t 0 || tmux new -s 0
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# bindkey -v

# Use modern completion system
autoload -Uz compinit
autoload zmv
compinit

# platform
platform=$(uname)

# Colors
export TERM='tmux-256color'

#true color
# if (has("nvim"))
#     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
# endif
# if (has("termguicolors"))
#     set termguicolors
# endif

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_SPACE

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

#autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8d8678,bg=#1e2022"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# completion accept
bindkey '^ ' autosuggest-accept
 

#------aliases--------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l='ls'
alias la='ls -ah'
alias ll="ls -lh"
alias lla='ls -lah'
alias clearhist='rm ~/.zsh_history'
alias python="python3.10"
alias grep="grep -i -r"

# session
alias quit="gnome-session-quit"
alias :q="exit"
# git
alias fcho="git for-each-ref --format='%(refname:short)' refs/heads |fzf|xargs git checkout"
alias gcommit="git commit -v "

# config editing
alias zshconfig="nvim ~/.zshrc"
alias vimconfig='nvim ~/.vimrc'
alias tmuxconfig="nvim ~/.tmux.conf"
alias gitconfig="nvim ~/.gitconfig"
alias myfuncs='nvim ~/.zsh/.my_funcs.zsh'

#alias sed="sed -E "

alias temps='watch -n 1 sensors'

#----OMYZSH------------------------------------------------------------------
# Path to your oh-my-zsh installation.
###export ZSH="/home/joel/.zsh/.oh-my-zsh"

#ZSH_THEME="powerlevel10k/powerlevel10k"

#ZSH_DISABLE_COMPFIX="true"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

###source $ZSH/oh-my-zsh.sh

#zsh plugins
plugins=(git colored-man-pages catimg)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#---------------------------------------------------------------------------

#---Custom files------------------------------------------------------------
source ~/.zsh/.my_funcs.zsh
#source /home/kids/.config/broot/launcher/bash/br
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
