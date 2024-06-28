#--------------------Configs, sync package lists--------------------
function get-installed-packages {
    ls $HOME/.local/user/{dev,program} | tee > $HOME/Documents/LINUX_SOFTWARE/binaries
    pip list | tail -n +3 | sort | uniq | tee > $HOME/Documents/LINUX_SOFTWARE/pip
    apt list --installed | sed 's/\/.*//' | sort | uniq | tee > $HOME/Documents/LINUX_SOFTWARE/apt
}

function sync-dots {
    cd $DOTDIR

    cp $HOME/.bashrc $DOTDIR/config/bashrc
    cp $HOME/.tmux.conf $DOTDIR/config/tmux.conf
    cp $XDG_CONFIG_HOME/starship.toml $DOTDIR/config/
    cp $XDG_CONFIG_HOME/kitty/(diff|kitty).conf $DOTDIR/config/kitty/

    cp $ZSHRC $DOTDIR/config/zsh/zshrc
    cp $ZDOTDIR/*.zsh $DOTDIR/config/zsh/
    cp $HOME/.zshenv $DOTDIR/config/zsh/zshenv
    cp $ZDOTDIR/plugins/* $DOTDIR/config/zsh/plugins/

    cp $XDG_CONFIG_HOME/nano/nanorc $DOTDIR/config/nano/
    cp -r $XDG_CONFIG_HOME/nvim/ $DOTDIR/config/
    cp -r $XDG_CONFIG_HOME/lf/ $DOTDIR/config/
    cp $XDG_CONFIG_HOME/zathura/zathurarc $DOTDIR/config/zathura/

    cp $HOME/.local/user/program/spotlight/* $DOTDIR/bin/

    cp $HOME/.gitconfig $DOTDIR/config/git/gitconfig
    cp $XDG_CONFIG_HOME/fd/ignore $DOTDIR/config/fd/ignore
    cp $XDG_CONFIG_HOME/bat/config $DOTDIR/config/bat/config
    cp $XDG_CONFIG_HOME/kmonad/config.kdb $DOTDIR/config/kmonad/
    cp $XDG_CONFIG_HOME/ripgrep/ripconf $DOTDIR/config/ripgrep/ripconf

    git status
}

#----------------------------UTIL----------------------------

function is_in_path {
    command -v $1 &> /dev/null
}

# bulk rename
function bulkmv {
    old="$(mktemp)"
    new="$(mktemp)"
    [[ $1 ]] && f="$(ls -a)" || f="$(ls)"
    printf '%b\n' "$f" > "$old" > "$new"
    $EDITOR "$new"
    [[ "$(wc -l < "$new")" -ne "$(wc -l < "$old")" ]] && exit
    paste "$old" "$new" | while IFS= read -r names; do
        src="$(printf '%s' "$names" | cut -f1)"
        dst="$(printf '%s' "$names" | cut -f2)"
        [[ "$src" = "$dst" ]] || [[ -e "$dst" ]] && continue
        mv -- "$src" "$dst"
    done
    rm -- "$old" "$new"
}

# f(filetype search replace)
function sub {
    if [[ $1 == "-l" ]]; then
        for f in *.$2; do
            mv $f ${f/$3/$4}
        done
    else
        mv $1 ${1/$2/$3}
    fi
}

# mv to modified time
function mvd {
    for a in *.$1; do
        time=$(stat --format=%w "$a" | sed 's/:/-/g' | sed 's/ /_/')
        mv "$a" ""${time%.*}"."${a##*.}""
    done
}

function stats {
    for a in *; do
        s=$(stat "$a" | tail -n4 | sed 's/\.\w+ \+\w+//g')
        pcol 34 4 1 "$a\n"
        pcol "$s\n"
    done
}

function compile {
    case ${1##*.} in
        c) gcc -g -Wall -std=c18 "$@" -o "${1%.*}" -lm;;
        cpp) g++ -g -Wall -std=c++17 "$@" -o "${1%.*}";;
    esac
}

function man {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[4;32m' \
    LESS_TERMCAP_so=$'\e[01;07;01m' \
    command man "$@"
}

# f(color color|style|background)
function pcol {
    case $# in
        1) printf $'\e[0;0m%b\e[0m' "$@";;
        2) printf $'\e[0;%im%b\e[0m' "$1" "${@:2:$#-1}";;
        3) printf $'\e[%i;%im%b\e[0m' "$2" "$1" "${@:3:$#-1}";;
        4) printf $'\e[%i;%i;%im%b\e[0m' "$1" "$3" "$2" "${@:4:$#-1}";;
    esac
}

function .. {
    level=$1
    [[ -z $level ]] && { level=1; }
    for i in $(seq 1 $level); do cd ../; done
}

function stopwatch {
    date1=`date +%s`;
    while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"
        sleep 1
    done
}

#----------------------------Logs----------------------------

# get ssh logs with date and time
function ssh-log {
    grep -a Accepted /var/log/auth.log |\
        sed -r -e 's/^(.*)\s.*from\s([0-9]*.*)\sport.*$/\1 \2/'
}

# get ip addrs with counts
function ssh-ips {
    grep -a Accepted /var/log/auth.log |\
        sed -r -e 's/.*from ([0-9]+.*) port ([0-9]+) .*/\1/'| sort | uniq -c | sort
}

# get invalid ips, usernames
function ssh-invalid {
    grep -a Invalid /var/log/auth.log |\
        sed -r -e 's/^(.*)\s.*\suser\s(.*)from\s([0-9]*.*)\sport.*$/\1 \3 \2/'
}

# get sudo commands
function sudo-log {
    ##non-systemd logs
    #grep -a sudo /var/log/auth.log | grep COMMAND |\
    #sed -r -e 's/^(.*)\s.*(sudo).*COMMAND=\/.*bin\/(.*$)/\1 \2 \3/'

    #systemd
    sudo journalctl /usr/bin/sudo | grep COMMAND |\
        sed -r -e 's/(^.*).* (sudo).*COMMAND=.*\/s?bin\/(.*$)/\1 \2 \3/'
}

function crypt-log {
    sudo journalctl /usr/lib/systemd/systemd-cryptsetup |\
        grep Failed | sed -r -e 's/(^.*).*: (Failed.*$)/\1 \2/'
}

# check for recent intel atomic failures from syslog
function atomic {
    cat /var/log/syslog | rg Atomic
}

#----------------------------Searching----------------------------

# live grep
function fzf-search {
    c="rg --no-heading"
    a="$(fzf --ansi --disabled --prompt 'search> ' \
       --bind "change:reload:sleep 0.1; $c {q} || true" \
       --delimiter : \
       --preview 'bat --color=always {1} --highlight-line {2}' \
       --preview-window 'up,50%,border-bottom,+{2}+3/3,~3' \
    )" || true
    if [[ -n $a ]]; then
        IFS=':' read -r file line char _ <<< "$a"
        cd "$(dirname "$(realpath "$file")")"
        "$EDITOR" "$file" +"$line" -c "norm ${char}lh"
    fi
    zle reset-prompt
}

function agstring {
    local preview_cmd
    cmd="echo {} | sed 's/:.*//' | xargs -I% highlight -O ansi -l % 2> /dev/null"
    if [[ "$1" != "" ]]; then
        ag "$1" | fzf --preview="$preview_cmd"
    else
        pcol 31 1 "Enter a search string"
    fi
    return 0
}

# get number of non-empty lines from a folder and a file type
function codelines {
    local files=$(grep -c -v --recursive "^$" "$1"/**/*."$2")
    echo $files
    pcol 34 1 "total: $(echo $files | sed 's/.*://' | paste -sd+ | bc)"
}

#----------------------------Git----------------------------
function in-git {
    git rev-parse --is-inside-work-tree > /dev/null
}

# fuzzy search for modified files
function gcom {
    # check if git repo
    in-git || return 1

    local files

    # get added and modified filenames
    files=($(git status --short | grep "^A\|\sM" | cut -c 4-))
    if [[ -z "$files" ]]; then
        echo "nothing to commit, working directory clean"
    else

    # select file to commit through fzf and preview window with diff
    files=$(git status --short | grep "^A\|\sM" | cut -c 4- | \
        fzf --preview='git diff HEAD --color=always {}')
            git commit -v "$files"
    fi
}

function gitpuller {
    for f in *; do
        if [ -d $f -a ! -h $f ]; then
            cd -- "$f"
            git pull
            cd ..
        fi
    done
}

function gclone { git clone git@github.com:$1 }

#----------------------------Media----------------------------

function yt {
    while getopts "pa" o; do
        case $o in
            p) yt-dlp -f "mp4" "$2" -o "%(playlist_index)s - %(title)s.%(ext)s";;
            a) yt-dlp -f 'ba' -x --audio-format mp3 "$2" -o "%(playlist_index)s - %(title)s.%(ext)s";;
        esac
    done
    [[ "$OPTIND" -eq 1 ]] && yt-dlp -f "mp4" -o "%(title)s.%(ext)s" $1
}

# f(file, to, how)
function convert-image {
    if [[ -n $3 ]]; then
        if [[ $3 == 'i' ]]; then
            convert $1 "${1%.*}.${2}"
        elif [[ $3 == 'f' ]]; then
            ffmpeg -loglevel panic -i $1 "${1%.*}.${2}"
        fi
        [[ $? == 0 ]] && pcol 32 1 "$1 --> $2\n"
    else
        echo "f(file to how)"
    fi
}

# f(file, to)
function mconvert {
    case ${1##*.} in
        mp3|m4a|aac|flac|ogg|wav) ffmpeg -loglevel warning -i $1 "${1%.*}".$2;;
        mp4|mkv|mov|ogv|webm) ffmpeg -loglevel warning -i $1 -preset medium -c:a copy "${1%.*}".$2;;
    esac
    [[ $? == 0 ]] && pcol 32 1 "$1 --> $2\n"
}

# f(file, from, till, [format])
function mslice {
    ss=$(( ${2%:*} * 60 + ${2#*:} ))
    to=$(( ${3%:*} * 60 + ${3#*:} ))
    [[ $4 ]] && ext=$4 || ext=${1##*.}
    ffmpeg -loglevel warning -i $1 -ss $ss -to $to "${1%.*}"_slice.$ext
    [[ $? == 0 ]] && pcol 32 1 "Extracted $2 - $3 ($1)\n"
}

# f(from, type)
function mconcat {
    pcol 34 1 "make list of all ${1}s in dir? "; read yn
    if [[ $yn == 'y' ]]; then
        true > list.txt
        for file in *.$1; do
            echo "file '$file'" >> list.txt
        done
        list=list.txt
    else
        list=$(fd -t f -e "txt" | fzf)
    fi
    ffmpeg -f concat -safe 0 -i "$list" -c copy concat.$2
    [[ $? == 0 ]] && pcol 32 1 "success"
}

# f(img, audio)
function audio-overlay {
    ffmpeg -loop 1 -i $1 -i $2\
        -c:v libx264 -tune stillimage\
        -c:a aac -b:a 192k -pix_fmt yuv420p\
        -shortest "${1%.*}"_audio.mp4
    [[ $? == 0 ]] && pcol 32 1 "success"
}

function ocr {
    pcol 34 1 "> OCR on $1\n"
    ocrmypdf "$1" "${1%.*}_OCR.pdf"
    if [[ $? == 0 ]]; then
        pcol 32 1 "> $1 OCR successful\n"
        mv $1 $HOME/Documents
        pcol 34 1 "> original files moved to Documents\n"
    fi
}

# f(from, to, how)
function screenshots {
    if [[ "$3" ]]; then
        echo "$3"; i="$3"
    elif is_in_path gum; then
        i=$(gum choose high low)
    else
        pcol 34 1 "Use high or low [i/f]? "
        read -r i
    fi
    for f in *.$1; do
        case $i in
            high|i) convert-image $f $2 i;;
            low|f) convert-image $f $2 f;;
        esac
    done
    sub -l $2 "Screenshot from "
    sub -l $2 " " "_"
    mv *.$1 /tmp/
    pcol 34 1 "old files moved to /tmp"
}

#----------------------------zsh----------------------------

function mcd { mkdir -p "$1" && cd "$1" }

function files {
    setsid nautilus file:$PWD &>/dev/null
    zle reset-prompt
}

function zo {
    op=" -l --color=always --icons --no-user --no-time"
    dir=$(zoxide query -l | fzf --preview "eza $op {} | bat" --height=~50%)
    [[ -d "$dir" ]] && cd "$dir"
    zle reset-prompt
}

function kdiff { kdiff }

function theme {
    colors=$(< $ZDOTDIR/themes)
    t=$(printf "%b\n" "$colors" | fzf --preview="" --height=~50%)
    if [[ "$t" ]]; then
        kitten themes --config-file-name ~/.config/kitty/themes.conf "$t"
    fi
    zle reset-prompt
}

function darkmode {
    kitten themes --config-file-name ~/.config/kitty/themes.conf "Gruvbox Material Dark Hard"
    sed -i 's/=light"/=dark"/' $XDG_CONFIG_HOME/nvim/lua/user/colors.lua
    sed -E -i "s/240/250/" $ZDOTDIR/plugins.zsh
}

function lightmode {
    kitten themes --config-file-name ~/.config/kitty/themes.conf "Leaf Light"
    sed -i 's/=dark"/=light"/' $XDG_CONFIG_HOME/nvim/lua/user/colors.lua
    sed -E -i "s/250/240/" $ZDOTDIR/plugins.zsh
}

function restart { source $ZSHRC && rehash }

zle -N zo zo
zle -N files files
zle -N kdiff kdiff
zle -N theme theme
zle -N bulkmv bulkmv
zle -N restart restart
zle -N fzf-search fzf-search

bindkey ',z' zo
bindkey ',e' files
bindkey ',4' kdiff
bindkey ',0' theme
bindkey ',b' bulkmv
bindkey ',r' restart
bindkey '\er' fzf-search
