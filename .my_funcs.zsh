#--------------------Configs, sync package lists------------------------------------------------- 
# list all installed_packages
function get-installed-packages() {
  apt list --installed | sed 's/\/.*//' | sort | uniq | tee Documents/LINUX_SOFTWARE/installed_packages
}

function sync-all() {
    sync-dots
    syncvs
    syncsub
}

#sync dotfiles and return in dotfiles dir
function sync-dots() {
  cd /home/joel/Documents/data/code/docs/dotfiles/mine/
  #zsh
  cp  ~/.zshrc /home/joel/Documents/data/code/docs/dotfiles/mine/.zshrc
  #git
  cp  ~/.gitconfig /home/joel/Documents/data/code/docs/dotfiles/mine/.gitconfig
  #vim
  cp ~/.vimrc /home/joel/Documents/data/code/docs/dotfiles/mine/.vimrc 
  #myfuncs
  cp ~/.zsh/.my_funcs.zsh /home/joel/Documents/data/code/docs/dotfiles/mine/.my_funcs.zsh 
  #tmux
  cp ~/.tmux.conf /home/joel/Documents/data/code/docs/dotfiles/mine/.tmux.conf
  #bash
  cp ~/.bashrc /home/joel/Documents/data/code/docs/dotfiles/mine/.bashrc 
  #p10k
  cp ~/.p10k.zsh /home/joel/Documents/data/code/docs/dotfiles/mine/.p10k.zsh

  #nvim config
  cp ~/.config/nvim/*.(vim|json) /home/joel/Documents/data/code/docs/dotfiles/mine/config/nvim
  #vim config
  cp ~/.vim/*.vim /home/joel/Documents/data/code/docs/dotfiles/mine/vim

  git status
}

#sync vscode addons and settings
function syncvs(){
  cp ~/.config/Code/User/keybindings.json /home/joel/Documents/data/code/docs/addon/vsx/keybindings.json
  cp ~/.config/Code/User/settings.json /home/joel/Documents/data/code/docs/addon/vsx/settings.json
  #cp ~/.vscode/extensions/2211896472.snippets-0.1.38/snippets/cpp.json /mnt/data/joel/data/code/docs/addon/vsx/cpp.json 
}

#sync sublime text settings
function syncsub(){
    cp ~/.config/sublime-text-3/Packages/User/*.sublime-(keymap|settings) /home/joel/Documents/data/code/docs/addon/sublime/
}

#enable oh-my-zsh
function enable-omz(){
    sed -i 's/###export ZSH/export ZSH/' ~/.zshrc
    sed -i 's/###source $ZSH/source $ZSH/' ~/.zshrc
}

#disable oh-my-zsh
function disable-omz(){
    sed -i 's/export ZSH/###export ZSH/' ~/.zshrc
    sed -i 's/source $ZSH/###source $ZSH/' ~/.zshrc
}

# kitty dark mode
function dark-mode() {
 sed -i 's/foreground #282828/foreground #fbf1c7/' ~/.config/kitty/kitty.conf
 sed -i 's/background #fbf1c7/background #1d2021/' ~/.config/kitty/kitty.conf
 sed -i 's/background=light/background=dark/' ~/.vim/ui.vim
 sed -i 's/colorscheme PaperColor/colorscheme gruvbox/' ~/.vim/ui.vim
 sed -i 's/PaperColor/gruvbox/' ~/.vim/lightline.vim
}

# kitty light mode
function light-mode() {
 sed -i 's/foreground #fbf1c7/foreground #282828/' ~/.config/kitty/kitty.conf
 sed -i 's/background #1d2021/background #fbf1c7/' ~/.config/kitty/kitty.conf
 sed -i 's/background=dark/background=light/' ~/.vim/ui.vim
 sed -i 's/colorscheme gruvbox/colorscheme PaperColor/' ~/.vim/ui.vim
 sed -i 's/gruvbox/PaperColor/' ~/.vim/lightline.vim
}

function nvimconfig() {
  cd ~/.config/nvim
  $EDITOR ~/.config/nvim/$1.vim 
}

function ergo() {
  sed -i 's/xkb_variant/#xkb_variant/' ~/.config/sway/config
  sed -i 's/xkb_options/#xkb_options/' ~/.config/sway/config
  swaymsg reload
}

function lap() {
  sed -i 's/#xkb_variant/xkb_variant/' ~/.config/sway/config
  sed -i 's/#xkb_options/xkb_options/' ~/.config/sway/config
  swaymsg reload
}

function gitpuller { 
  for f in *;  do 
  if [ -d $f  -a ! -h $f ];  
    then  
      cd -- "$f";  
      git pull
      cd ..; 
    fi;  
  done;  
};
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

#check for recent intel atomic failures from syslog
function atomic() {
  cat /var/log/syslog | grep Atomic
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
  local cmd
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

#--------------------R------------------------------------------------- 
prettyr() {    
    while getopts ":hr:s:" option; do
        case ${option} in
            r ) 
                scope="$OPTARG"
                ;;
            s ) 
                strict="$OPTARG"
                ;;
            h )
                echo "Usage prettyr -r [spaces|line_breaks|tokens] -s [TRUE|FALSE] file"
                ;;
            \? ) 
                echo "Invalid option -$OPTARG" 1>&2
                ;;
        esac
    done
    shift $((OPTIND -1))
    files=("$@")
    echo "$strict"
    for file in $files; do
        R -e "styler::style_file(\"$file\", scope='$scope', strict=$strict)"
    done
}

#--------------------Websites------------------------------------------------- 
# random site in private mode
function fox() {
  firefox -private-window $1 &
}

# search with DDG, search string must have '+' as delimiter
function duck() {
  search_url="https://duckduckgo.com/?q=${1}&t=canonical&ia=web"
  firefox -private-window $search_url &
}

# cmdline stopwatch, increments in 5 seconds
function stopwatch() {
  date1=`date +%s`; while true; do 
   echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
   sleep 5
  done
}

#--------------------Media------------------------------------------------- 

# radio
function radio() {
  declare -A urls
  urls[wblv]="https://wblv.streamguys1.com/live"
  urls[miradio]="http://17003.live.streamtheworld.com:80/WUOMFM_SC"
  urls[wyce]="http://ice24.securenetsystems.net/WYCE"
  urls[npr]="https://npr-ice.streamguys1.com/live.mp3"
  
  if [[ "$platform" == "Linux" ]]; then
    vlc -I http "$urls[$1]" --play-and-exit -q > /dev/null 2>&1
  else
    cvlc -Vdummy "$urls[$1]" --play-and-exit -q > /dev/null 2>&1
  fi
}

function _radio() {
  local command="$1"

  local -a stations

  stations=("wblv" "wyce" "miradio" "npr")

  if (( CURRENT == 2 )); then
    _describe 'command' stations
  fi
}

compdef _radio radio
 
# youtube-dl from url
function ydl() {
  if [[ "$platform" == "Darwin" ]]; then
    url=$(pbpaste)
  else
    url=$(wl-paste)
  fi
  echo "$url"
  urls=$(youtube-dl --get-url --format m4a "$url")
  for url in "$urls"
  do
    if [[ "$platform" == "Darwin" ]]; then
      vlc -I http "$url" --play-and-exit -q > /dev/null 2>&1
    else
      cvlc -Vdummy "$url" --play-and-exit -q > /dev/null 2>&1
    fi
  done
  return 0
}

#------------------COMPILE-----------------------------------------------
function c-compile(){
    gcc -std=c18 $1.c -o $1 -lm
    #can check if compilation error else run
    ./$1
}

#--------------------zsh------------------------------------------------- 
function mcd() {
    mkdir -p "$1"
    cd "$1"
}

#open directory in file manager
function files() {
	nautilus file:$(pwd)
}

#find and replace filename
function mv-replace() {
    for file in *.$1; do
        mv $file ${file//$2/$3}
    done
}

#convert images from type to type
function convert-images() {
    echo "Use imageMagik Or ffmpeg [i/v]? " 
    read input
    echo "Rename Screenshots [y/n]? " 
    read rename

    if [[ $input == "i" || $input == "I" ]]; then
        for image in *.$1; do
            convert $image $image.$2
            echo "$image converted to $2"
        done
    elif [[ $input == "v" || $input == "V" ]]; then
        for image in *.$1; do
            ffmpeg -loglevel panic -i $image $image.$2
            echo "$image converted to $2"
        done
    fi

    rm *.$1

    if [[ $rename == "y" || $rename == "y" ]]; then
        #rename screenshots
        mv-replace $2 "Screenshot from "

        #remove space
        mv-replace $2 " " _

        #remove previous file extension
        mv-replace $2 .$1

    fi
}

#convert video from type to type
function convert-videos() {
    for video in *.$1; do
        ffmpeg -loglevel warning -i $video $video.$2
        echo "$video converted to $2"
    done

    #remove old file extension
    echo "Rename Videos [y/n]? "
    read input

    if [[ $input == "y" || $input == "y" ]]; then
        for file in *.$2; do
            mv $file ${file//.$1/}
        done
    fi
}

#concat videos into one file
function mp4concatall(){
    for file in *.mp4; do
        echo "file $file" >> list.txt
    done

    ffmpeg -f concat -safe 0 -i list.txt -c copy $1.mp4
    read -p "Delete list.txt?" yn
    if [$yn] ;
        rm list.txt
}


#concat specified files
function mp4concat() {
    ffmpeg -f concat -safe 0 -i list.txt -c copy $1.mp4
    read -p "Delete list.txt?" yn
    if [$yn] ;
        rm list.txt
}

#OCR PDFs
function ocr () {
    ocrmypdf "$1" "${1}_OCR.pdf"
    echo "\n$1 OCRed successfully\n"
    mv $1 $HOME/Documents
    echo "original moved to HOME/Documents\n"

    mv-replace pdf .pdf_OCR
}

function exiting(){
    exit
}

function clearing() {
    clear
}

zle -N exiter exiting
bindkey ',q'  exiter
bindkey ',l' clear
