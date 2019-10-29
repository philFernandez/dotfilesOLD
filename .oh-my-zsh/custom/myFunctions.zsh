#  __________  _________ ___ ___   ___________                   __  .__
#  \____    / /   _____//   |   \  \_   _____/_ __  ____   _____/  |_|__| ____   ____   ______
#    /     /  \_____  \/    ~    \  |    __)|  |  \/    \_/ ___\   __\  |/  _ \ /    \ /  ___/
#   /     /_  /        \    Y    /  |     \ |  |  /   |  \  \___|  | |  (  <_> )   |  \\___ \
#  /_______ \/_______  /\___|_  /   \___  / |____/|___|  /\___  >__| |__|\____/|___|  /____  >
#          \/        \/       \/        \/             \/     \/                    \/     \/


# This file does not have access to Z_aliases.zsh aliases
# because this is sourced first. (Alphabetic By Filename)

# TEMP FUNCTIONS
cn1() {
  (cd ~/eclipse-workspace/A2Prj && java -cp dist/A2Prj.jar:JavaSE.jar com.codename1.impl.javase.Simulator com.mycompany.a2.Starter)
}


##### USER FUNCTIONS #######

function remdate {
  pcregrep "$1" ~/.reminders/reminders.txt
}

function shw {
  if [ -d ~/.reminders ]; then 
    clear
    (cd ~/.reminders && bat *)
  else
    echo 'run command: <remon> to turn on reminders'
  fi
}

function stats() {
  if [ -d ~/.reminders ]; then
    clear
    (cd ~/.reminders && bat STAT50)
  else
    echo 'run command: <remon> to turn on reminders'
  fi
}

function music() {
  if [ -d ~/.reminders ]; then
    clear
    (cd ~/.reminders && bat MUSC129)
  else
    echo 'run command: <remon> to turn on reminders'
  fi
}

function csc133() {
  if [ -d ~/.reminders ]; then
    clear
    (cd ~/.reminders && bat CSC133)
  else
    echo 'run command: <remon> to turn on reminders'
  fi
}

function csc139() {
  if [ -d ~/.reminders ]; then
    clear
    (cd ~/.reminders && bat CSC139)
  else
    echo 'run command: <remon> to turn on reminders'
  fi
}
# make it so 'rd' only works for directories
function rd {
  if [ $# -ge 1 ]; then
    local typeof
    if [ $# -gt 1 ]; then
      for i in {1..$#}; do
        typeof="$(file --brief $@[i])"
        if [ "$typeof" = "directory" ]; then
          rm -vrf "$@[i]"
        else
          print -P $FG[192]'warning:' $reset_color"$@[i]" 'not removed.' >&2
        fi
      done
    else
      typeof="$(file --brief $1)"
      if [ "$typeof" = "directory" ]; then
        rm -vrf "$1"
      else
        print -P $FG[192]'warning:' $reset_color"$1" 'not removed.' >&2
      fi
    fi
  else
    print -P $FG[192]'usage:'$reset_color 'rd <dir_1> [dir_n]' >&2
  fi
}


function allcoms {
  print -l $commands | fzf
}

function diff {
  if [ "$1" = "-h" ] || [ "$1" = "--h" ]; then
    cat << EOF
------------------------------------------------------------------- \\
usage: diff <file1> <file2> <N (default 3)>                         |
                                                                    |
       file1 is first file in comparison                            |
       file2 is second file in comparison                           |
       N is the number of lines to show around each diff            |
--------------------------------------------------------------------/
EOF
  else
    colordiff -U "${3:-3}" --label "$1" "$1" --label "$2" "$2"
  fi
}

function vwtf {
  wtf "$1"
  say -v Dan "$(wtf $1)"
}

fcd() {
  local dir 
  dir="$(fd . ${1:-.} -I -H -td | fzf --sort \
    --preview=" lsd -A --color=always \
    --icon=always --group-dirs first {}" \
    --preview-window="down:50%" --prompt='cd '\
    )" && 
    cd "$dir"
}

fcdf() {
  local file
  local dir
  file="$(fd . ${1:-.} -H -I -tf | \
    fzf -m --preview="bat --color=always --style=numbers {}" \
    --preview-window="down:90%" --prompt='cd-to-dir-of ' \
    )"
      [ -n "$file" ] && dir=$(dirname "$file") && cd "$dir"

}

fvim() {
  local files
  files="$(fd . ${1:-.} -H -I -tf | \
    fzf -m --preview="bat --color=always --style=numbers {}" \
    --preview-window="down:90%" --prompt='vim ' \
    )"
  [ -n "$files" ] && ${=EDITOR} $(echo "$files")

}
 


# Have to use function, because need filename before
# --group-dirs first
# Also have to unalias la in $HOME/.zshrc because
# that alias breaks this function with lsd
function la {
  if [ $# -ge 1 ]; then
    lsd --almost-all $@ --group-dirs first
  else
    lsd --almost-all $pwd --group-dirs first
  fi
}
# Same philosophy as above function
# Had to unalias ls in .zshrc for this.
function ls {
  if [ $# -ge 1 ]; then
    lsd $@ --group-dirs first
  else
    lsd $pwd --group-dirs first
  fi
}

# Same philosophy as above function
# Nothing unset for this one
function laa {
  if [ $# -ge 1 ]; then
    lsd -la $@ --date relative --group-dirs first
  else
    lsd -la $pwd --date relative --group-dirs first
  fi
}

# Same philosophy as above function
# Had to unalias l
function l() {
  if [ $# -ge 1 ]; then
    lsd -l $@ --date relative --group-dirs first
  else
    lsd -l $pwd --date relative --group-dirs first
  fi
}

# this command adds, commits,
# and pushes new changes in one command
function gcamp {
  local commitMessage=$1
  git commit -a -m $commitMessage && git push origin $(git_current_branch)
}

function ccamp {
  git --git-dir=$HOME/.config_file_src_control/ --work-tree=$HOME commit -a -m "$@" \
    && git --git-dir=$HOME/.config_file_src_control/ --work-tree=$HOME push -u origin master
}

function gdl {
  if [ $# -ge  1 ]; then
    git diff "$@" | bat --style=numbers
  else
    git diff | bat --style=numbers
  fi
}

# show whole year when envoking cal
function cal {
  print -P $FG[192]''
  if [ $# == 1 ]; then
    /usr/bin/cal
  else
    /usr/bin/cal $(date +%G)
    print -P $FG[154]'Issue Command' \
      $reset_color$FG[226]'cal 1'$reset_color$FG[154] \
      'to show one month.'$reset_color
  fi
}

# grep things without highlighting results
function ncgrep {
  grep --color=never "$@"
}

# PWD when going back a directory.
function cl {
  clear;

  # spectrum_ls; show all FG color codes
  # spectrum_bls; show all BG color codes
  # Must use print -P to work with $ZSH/lib/spectrum.zsh
  local backColor=041
  local textColor=235

  print -P $FG[$backColor]$BG[$textColor]' PWD '$reset_color$FG[$textColor]$BG[$backColor]'\ue0b0'$FG[000]' '$(pwd)' '$reset_color$FG[$backColor]'\ue0b0'

  # must use this no matter which of the 2 above are used
  echo $reset_color; # must reset or other output (/bin/ls) will get messed up
  lsd --group-dirs first
}

# preform rm on all files of specified file extension
# ex. rmft txt removes all txt files in pwd
function rmft {
  if [ $# != 1 ]; then
    echo 'rmft usage: rmft <file extension>'
  elif [ $1 == '-h' ]; then
    echo 'rmft removes all files of a particular type'
    echo 'rmft usage: rmft <file extension>'
  else
    filetype=$1
    rm -v *.$filetype
  fi
}

# makes a file executable
function mke {
  chmod +x "$*"
}


# search history by keyword
function shist {
  # awk makes the command become the first column
  # and rearranges the original 4 columns after the
  # new first column, which is the command name itself
  #history 0 | awk '{ print $4, $0 }' | ack "^$1" --nocolor
  history 0 | awk '{ print $4, $0 }' | egrep "^$1"
}

# shows terminal color codes with text example
function textcolors {
  local text="This is a foreground sample.!?"
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$text%{$reset_color%}"
  done
}

function textcolors_bg {
  local text="This is a background sample.!?"
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$text%{$reset_color%}"
  done
}

# copy pwd to clipboard
function cpdir {
  emulate -L zsh
  print -n $PWD | clipcopy
}

# allows for filtering list output to desired search keys
function fl {
  #if two args, first arg is directory to /bin/ls
  #second arg is search key
  if [ $# == 2 ]; then
    #/bin/ls -AF $1 | ack -i --nocolor $2
    #/bin/ls -AF $1 | grep -Pi --color=never $2
    #/bin/ls -AFH $1 | egrep -i $2
    /bin/ls -AFH $1 | ag --nocolor $2
    # if one arg /bin/ls is done in pwd one single
    # arg is search key
  else
    #/bin/ls -AF | ack -i --nocolor $*
    #/bin/ls -AF | grep -Pi --color=never $*
    #/bin/ls -AF | egrep -i $*
    /bin/ls -AF | ag --nocolor $*
  fi
}

# remove all exept for $*
function rmn {
  /bin/ls -A | grep -v "$*" | xargs rm -rf
}

function aliases {
  if [ $# -ge 1 ]; then
    alias | ag --nocolor "$*" | bat --style=numbers -l sh
  else
    alias | bat --style=numbers -l sh
  fi

}

bindkey -s '^R' 'exec zsh\n'

# FZF functions ===============================================
# Open history in fzf and put selected command on the command line for edit and/or execute
  function fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | awk '!($1="")')
  }

# Open history in fzf and immediately execute the selected entry
function fhx() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | awk '!($1="")')
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
function fkill() {
  local pid 
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi  

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi  
}

# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
# f bat <bat selected files>
function f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf -m)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# Like f, but not recursive.
function fm() f "$@" --max-depth 1

# Deps
alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
function fzf-noempty () {
	local in="$(</dev/stdin)"
	test -z "$in" && (
		exit 130
	) || {
		ec "$in" | fzf "$@"
	}
}
function ec () {
	if [[ -n $ZSH_VERSION ]]
	then
		print -r -- "$@"
	else
		echo -E -- "$@"
	fi
}
# =============================================================

# Open conf files
function ev {
  ${=EDITOR} ~/.vimrc
}
function ef {
  ${=EDITOR} ~/.oh-my-zsh/custom/myFunctions.zsh
}
function ep {
  ${=EDITOR} ~/.oh-my-zsh/custom/Z_aliases.zsh
}
function rc {
  ${=EDITOR} ~/.zshrc
}
function eg {
  ${=EDITOR} ~/.oh-my-zsh/custom/global_aliases.zsh
}
function ett {
  ${=EDITOR} ~/.zsh_theme
}
function et {
  ${=EDITOR} ~/.tmux.conf
}
function es {
  ${=EDITOR} ~/.oh-my-zsh/custom/spotify.zsh
}
