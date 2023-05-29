#--------------------Configs, sync package lists-------------------------------------------------
function get-installed-packages() {
    apt list --installed | sed 's/\/.*//' | sort | uniq | tee $HOME/Documents/LINUX_SOFTWARE/apt_packages
    npm list | sort | uniq | tee $HOME/Documents/LINUX_SOFTWARE/npm_packages
    pip list | sort | uniq | tee $HOME/Documents/LINUX_SOFTWARE/pip_packages
    ls $HOME/.local/user | sed 's/-/ /' | tee $HOME/Documents/LINUX_SOFTWARE/binaries
}

function is_bin_in_path {
    if [[ -n $ZSH_VERSION ]]; then
        builtin whence -p "$1" &> /dev/null
    else  # bash:
        builtin type -P "$1" &> /dev/null
    fi
}

function sync-all() {
    sync-dots; syncvs; syncsub
}

function sync-dots() {
    cd $DOTDIR/config/

    cp $ZSHRC $DOTDIR/config/terminal/zsh/zshrc # zsh
    cp $HOME/.zshenv $DOTDIR/config/terminal/zsh/zshenv
    cp $ZDOTDIR/aliases.zsh $DOTDIR/config/terminal/zsh/
    cp $ZDOTDIR/plugins.zsh $DOTDIR/config/terminal/zsh/
    cp $ZDOTDIR/completion.zsh $DOTDIR/config/terminal/zsh/
    cp $ZDOTDIR/myfuncs.zsh $DOTDIR/config/terminal/zsh/

    cp $HOME/.bashrc $DOTDIR/config/terminal/bashrc # bash
    cp $HOME/.gitconfig $DOTDIR/config/util/git/gitconfig # git
    cp $HOME/.tmux.conf $DOTDIR/config/terminal/tmux.conf # tmux
    cp -r $XDG_CONFIG_HOME/lf/ $DOTDIR/config/util/ # lf
    cp $XDG_CONFIG_HOME/starship.toml $DOTDIR/config/terminal/ # starship
    cp $XDG_CONFIG_HOME/kitty/kitty.conf $DOTDIR/config/terminal/ # kitty
    cp -r $XDG_CONFIG_HOME/nvim/ $DOTDIR/config/ # nvim

    git status
}

function syncvs(){
    cp $XDG_CONFIG_HOME/Code/User/keybindings.json $HOME/Documents/academics/code/docs/addon/vsx/keybindings.json
    cp $XDG_CONFIG_HOME/Code/User/settings.json $HOME/Documents/academics/code/docs/addon/vsx/settings.json
}

function syncsub(){
    cp $XDG_CONFIG_HOME/sublime-text-3/Packages/User/*.sublime-(keymap|settings) $HOME/Documents/academics/code/docs/addon/sublime/
}

function nvimconfig() {
    cd $XDG_CONFIG_HOME/nvim
    $EDITOR $XDG_CONFIG_HOME/nvim/lua/user/init.lua
}

function zshconfig() {
  cd $ZDOTDIR && $EDITOR $ZSHRC
}

function ergo() {
    sed -i 's/xkb_variant/#xkb_variant/' $XDG_CONFIG_HOME/sway/config
    sed -i 's/xkb_options/#xkb_options/' $XDG_CONFIG_HOME/sway/config
    swaymsg reload
}

function lap() {
    sed -i 's/#xkb_variant/xkb_variant/' $XDG_CONFIG_HOME/sway/config
    sed -i 's/#xkb_options/xkb_options/' $XDG_CONFIG_HOME/sway/config
    swaymsg reload
}

#------------------UTIL----------------------------

# f(filetype search replace)
function substitute() {
    if [[ "$1" == "-l" ]]; then
        for file in *."$2"; do
            mv "$file" "$(echo "$file" | sed -E "s/$3/$4/")";
        done
    else
        mv "$1" "$(echo "$1" | sed -E "s/$2/$3/")";
    fi
}

# mv to created time
function mvd() {
    for i in *.$1; do
        new=$(stat --format=%y "$i" | sed 's/:/-/g' | sed 's/\.\w+ \+\w+//' | sed 's/ /_/')
        ext=`echo $i|awk -F "." '{print $2}'`
        mv "$i" "$new.$ext"
    done

    # ignore non-extension .s
    # for i in *.(png|jpg|mp4); do
    #     new=$(stat --format=%y "$i" | sed 's/:/-/g' | sed 's/\.\w+ \+\w+//' | sed 's/ /_/')
    #     ext=`echo $i | awk -F "/.(?=[^.]*$)/" '{print $2}'`
    #     mv "$i" "$new.$ext"
    # done
}

function stats() {
    for i in *; do
        new=$(stat --format=%y "$i" | sed 's/\.\w+ \+\w+//g')
        # printf '\e[31m%s\n\e[0m%s\n' "$i: " "$new"
        printf '\e[31m%s\n\e[0m%s\n' "$i: " "$(stat "$i" | tail -n4 | sed 's/\.\w+ \+\w+//g')"
    done
}

function c-compile() {
    gcc -std=c18 "$1" -o "${1//.c/}" -lm
}

function cpp-compile() {
    g++ -Wall -std=c++17 -o "${1//.cpp/}" "$1"
}

function man() {
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;100m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[4;93m' \
    command man "$@"
}

function lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'

#--------------------Logs-------------------------------------------------

# get ssh logs with date and time
function ssh-log() {
    grep -a Accepted /var/log/auth.log | sed -r -e 's/^(.*)\s.*from\s([0-9]*.*)\sport.*$/\1 \2/'
}

# get ip addrs with counts
function ssh-ips() {
    grep -a Accepted /var/log/auth.log  | sed -r -e 's/.*from ([0-9]+.*) port ([0-9]+) .*/\1/'| sort | uniq -c | sort
}

# get invalid ips, usernames
function ssh-invalid() {
    grep -a Invalid /var/log/auth.log | sed -r -e 's/^(.*)\s.*\suser\s(.*)from\s([0-9]*.*)\sport.*$/\1 \3 \2/'
}

# get sudo commands
function sudo-log() {
    ##non-systemd logs
    #grep -a sudo /var/log/auth.log | grep COMMAND| sed -r -e 's/^(.*)\s.*(sudo).*COMMAND=\/.*bin\/(.*$)/\1 \2 \3/'

    #systemd
    sudo journalctl /usr/bin/sudo | grep COMMAND | sed -r -e 's/(^.*).* (sudo).*COMMAND=.*\/s?bin\/(.*$)/\1 \2 \3/'
}

function crypt-log() {
    sudo journalctl /usr/lib/systemd/systemd-cryptsetup | grep Failed | sed -r -e 's/(^.*).*: (Failed.*$)/\1 \2/'
}

# check for recent intel atomic failures from syslog
function atomic() {
    cat /var/log/syslog | rg Atomic
}

#--------------------Searching------------------------------------------------

# rg -i with fzf file preview
rgf() {
    local preview_cmd
    preview_cmd="echo {} | sed 's/(.*:[0-9]+).*//' | xargs -0 preview {}"
    if [ "$1" != "" ]; then
        rg -i --line-number "$1" -g '!R' > /tmp/rgsearch
        if [ $? -eq 0 ]; then
            cat /tmp/rgsearch | \
                fzf --delimiter : --preview="$preview_cmd" \
                --preview-window=top,+{2}-20 \
                --bind="enter:execute(less +{2} {1})"
                        else
                            echo "No results found for $1"
        fi
    else
        echo "Enter a search string"
    fi
    return 0
}

agstring() {
    local preview_cmd
    cmd="echo {} | sed 's/:.*//' | xargs -I% highlight -O ansi -l % 2> /dev/null"
    if [ "$1" != "" ]; then
        ag "$1" | fzf --preview="$preview_cmd"
    else
        echo "Enter a search string"
    fi
    return 0
}

# get number of non-empty lines from a folder and a file type
code-lines() {
    local files=$(grep -c -v --recursive "^$" "$1"/**/*."$2")
    echo $files
    echo "total:" $(echo $files | sed 's/.*://' | paste -sd+ | bc)
}

#--------------------Git------------------------------------------------------
in-git () {
    git rev-parse --is-inside-work-tree > /dev/null;
}

# fuzzy search for modified files
gcom () {
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
    for f in *;  do
        if [ -d $f  -a ! -h $f ]; then
            cd -- "$f";
            git pull
            cd ..;
        fi;
    done;
};

function gclone() { git clone git@github.com:$1 }

#--------------------Websites-------------------------------------------------
function fox() {
    firefox -private-window "$1" &
}

# search string must have '+' as delimiter
function duck() {
    search_url="https://duckduckgo.com/?q=${1}&t=canonical&ia=web"
    firefox -private-window $search_url &
}

# increments in 5 seconds
function stopwatch() {
    date1=`date +%s`;
    while true; do 
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        sleep 5
    done
}

function wordle() { ssh clidle.duckdns.org -p 3000 }

#--------------------Media-------------------------------------------------

function yt() {
    if [[ "$1" == "-p" ]]; then
        yt-dlp -f "mp4" "$2" -o "%(playlist_index)s - %(title)s.%(ext)s"
    elif [[ "$1" == "-a" ]]; then
        yt-dlp -f 'ba' -x --audio-format mp3 "$2" -o "%(playlist_index)s - %(title)s.%(ext)s"
    else
        yt-dlp -f "mp4" -o "%(title)s.%(ext)s" "$1"
    fi
}

# f(from, to, method)
function convert-images() {
    if [[ $1 == $2 ]]; then
        echo "\nCannot be same file type" && exit
    elif [[ "$3" ]]; then
        echo "$3"; i="$3"
    elif ! command -v gum &> /dev/null; then
        echo "Use imageMagik Or ffmpeg [i/v]? "
        read -r i
    else
        echo "Use imageMagik Or ffmpeg? "
        i=$(gum choose imageMagik ffmpeg)
    fi

    for img in *."$1"; do
        if [[ "$i" == "imageMagik" || "$i" == "i" ]]; then
            convert "$img" "$img"."$2"
        elif [[ "$i" == "ffmpeg" || "$i" == "v" ]]; then
            ffmpeg -loglevel panic -i "$img" "$img"."$2"
        fi
        printf '\e[31m%s\e[0m%s\n' "$img --> " "$2"
    done

    if [[ -n $i ]]; then
        rm *."$1"
        substitute -l $2 "Screenshot from "
        substitute -l $2 " " "_"
        substitute -l $2 ".$1"
    fi
}

# f(file, from, to)
function convert-videos() {
    ffmpeg -loglevel warning -i "$1" -vn -c:a copy "${1%.$2}"_c.$3
    echo "$video converted to $3"
}

# concat files from list
function video-concat() {
    if [[ $1 ]]; then
        for file in *.mp4; do
            echo "file $file" >> list.txt
        done
    fi
    ffmpeg -f concat -safe 0 -i list.txt -c copy $1.mp4
    read -pr "Delete list.txt?" yn
    if [[ $yn ]]; then
        rm list.txt
    fi
}

# f(file, from, till)
function video-extract() {
    if [[ $2 ]]; then
        echo "Extracting video from $2 - $3"
        ffmpeg -ss $2 -to $3 -vn -acodec copy -i $1 ${1%.(mp4|webm)}_x.mp4
    else
        echo "Enter start: "; read -r st
        echo "Enter end: "; read -r end
        echo "Extracting video from $st - $end"
        ffmpeg -ss $st -to $end -vn -acodec copy -i $1 ${1%.(mp4|webm)}_x.mp4
    fi
}

function audio-extract() {
    if [[ $2 ]]; then
        echo "Extracting audio from $2 - $3"
        ffmpeg -i $1 -ss $2 -to $3 -vn -acodec copy $1.mp3
    else
        echo "Enter start: "; read -r s
        echo "Enter end: "; read -r e
        echo "Extracting audio from $s - $e"
        ffmpeg -i $1 -ss $s -to $e -vn -acodec copy "${1%.(mp3|mp4)}"_x.mp3
    fi
}

function audio-overlay() {
    ffmpeg -loop 1 -i $1 -i $2 -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "${1%.(jpg|png)}"_audio.mp4
    # ffmpeg -i $1 -i $2.mp3 -vf "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" ${1%.(jpg|png)}.mp4
    # reduce video and audio bitrate for small size
    # ffmpeg -i $1 -i $2.mp3 -vf "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -b:v 1000k -b:a 128k ${1%.(jpg|png)}.mp4
    # ffmpeg -loop 1 -y -i image8.jpg -i sound11.amr -shortest -acodec copy -vcodec mjpeg result.avi
}

function ocr () {
    echo "\n> OCR on $1\n"
    ocrmypdf "$1" "${1%.pdf}_OCR.pdf"
    echo "\n> "$1" OCRed successfully"
    mv "$1" $HOME/Documents
    echo "> original moved to HOME/Documents\n"
    substitute "$1" _OCR
}

#--------------------ZSH------------------------------

function mcd() {
    mkdir -p "$1" && cd "$1"
}

function files() { nautilus file:$(pwd) }
function exiter() { exit }
function restart() { source $ZSHRC && rehash }

function theme() {
    colors=("Tokyo Night" "Tokyo Night Moon" "Tokyo Night Storm"
            "Gruvbox Material Dark Hard" "Gruvbox Material Light Medium"
            "Github Dark Dimmed" "Aquarium Dark" "Hybrid" "Neutron" "N0tch2k"
            "Aquarium Light" "Pencil Light" "Leaf Light"
    )
    config=$(printf "%s\n" "${colors[@]}" | fzf --preview="" --height=~50% --border -0 | sed 's/ /\\ /')
    if [[ "$config" ]]; then
        kitty +kitten themes "$config" || kitty +kitten themes Gruvbox\ Material\ Dark\ Hard
        source $HOME/.zshenv; restart
        kill -SIGUSR1 $(pidof kitty)
    fi
}

# transparent
function pencils() {
    sed -E -i "s/#+\sbackground_opacity 0.70/ background_opacity 0.70/" $XDG_CONFIG_HOME/kitty/kitty.conf
    sed -E -i "s/fg=#\w+,/fg=#8d8678,/" $ZDOTDIR/completion.zsh
    sed -E -i "s/bg=#\w+\"/bg=#TRANSPARENT\"/" $ZDOTDIR/completion.zsh
    restart; kill -SIGUSR1 $(pidof kitty)
}

function nopencils() {
    sed -E -i "s/ background_opacity 0.70/# background_opacity 0.70/" $XDG_CONFIG_HOME/kitty/kitty.conf
    sed -E -i "s/fg=#\w+,/fg=#8d8678,/" $ZDOTDIR/completion.zsh
    sed -E -i "s/bg=#\w+\"/bg=#TRANSPARENT\"/" $ZDOTDIR/completion.zsh
    restart; kill -SIGUSR1 $(pidof kitty)
}


function dark-mode() {
    kitty +kitten themes Gruvbox\ Material\ Dark\ Hard
    sed -i 's/=light"/=dark"/' $XDG_CONFIG_HOME/nvim/lua/user/colors.lua
    sed -E -i "s/fg=#\w+,/fg=#8d8678,/" $ZDOTDIR/completion.zsh
    sed -E -i "s/bg=#\w+\"/bg=#TRANSPARENT\"/" $ZDOTDIR/completion.zsh
    source $HOME/.zshenv; restart
    kill -SIGUSR1 $(pidof kitty)
}

function light-mode() {
    kitty +kitten themes Leaf\ Light
    sed -i 's/=dark"/=light"/' $XDG_CONFIG_HOME/nvim/lua/user/colors.lua
    sed -E -i "s/fg=#\w+,/fg=#77706a,/" $ZDOTDIR/completion.zsh
    source $HOME/.zshenv; restart
    kill -SIGUSR1 $(pidof kitty)
}

zle -N exiter exiter
zle -N restart restart
zle -N theme theme
zle -N light-mode light-mode
zle -N dark-mode dark-mode
zle -N pencils pencils
zle -N nopencils nopencils
bindkey -s ',g' 'git status\n'
bindkey -s ',v' 'vim\n'
bindkey ',q' exiter
bindkey ',r' restart
bindkey ',c' theme
bindkey ',l' light-mode
bindkey ',d' dark-mode
bindkey ',t' pencils
bindkey ',o' nopencils
