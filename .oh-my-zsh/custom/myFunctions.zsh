#  __________  _________ ___ ___   ___________                   __  .__
#  \____    / /   _____//   |   \  \_   _____/_ __  ____   _____/  |_|__| ____   ____   ______
#    /     /  \_____  \/    ~    \  |    __)|  |  \/    \_/ ___\   __\  |/  _ \ /    \ /  ___/
#   /     /_  /        \    Y    /  |     \ |  |  /   |  \  \___|  | |  (  <_> )   |  \\___ \
#  /_______ \/_______  /\___|_  /   \___  / |____/|___|  /\___  >__| |__|\____/|___|  /____  >
#          \/        \/       \/        \/             \/     \/                    \/     \/


# This file does not have access to Z_aliases.zsh aliases
# because this is sourced first. (Alphabetic By Filename)

# \u001b[38;5;XXXm<String> , where XXX is asci code
# TEMP FUNCTIONS
cn1() {
  (clear;cd ~/eclipse-workspace/A3Prj && java -cp dist/A3Prj.jar:JavaSE.jar com.codename1.impl.javase.Simulator com.mycompany.a3.Starter)
}
# ------------------------------------------------------



# takes any number of file name arguments, reads
# the file names into all_files, cats all
# the contents through nl -ba for line numbers,
# then through fzf for fuzzy search
function fv {
  local all_files
  # if first arg is -l then use line numbers
  if [ "$1" == '-l' ]; then
    for i in {2..$#}; do
      echo "$@[i]"
      all_files="$all_files ""$@[i]"
    done
    cat $(echo $all_files) | nl -ba | fzf
  else # dont use line numbers
    for i in {1..$#}; do
      echo "$@[i]"
      all_files="$all_files ""$@[i]"
    done
    cat $(echo $all_files) | fzf
  fi
}


function schw {
  local SEARCH_T="$1"
  clear
  if [ -d ~/.reminders ]; then
    (cd ~/.reminders && ag --nonumbers --nocolor "$SEARCH_T" | bat --style=grid,numbers)
  else
    echo '\u001b[38;5;226mrun command: \u001b[38;5;069m<remon>' \
      '\u001b[38;5;226mto turn on reminders'
          (cd ~/.reminders.silent && ag --nonumbers --nocolor "$SEARCH_T" | bat --style=grid,numbers)
  fi
}


# Collects names of non-empty files in ~/.reminders
# and puts those names into a list. The list is passed
# as parameters to bat to display the contents of the
# files.
# If shw is called with an '-a' flag it will show the
# hidden non-empty archive files
function shwf() { # SEE '~/.bin/hw' script for managing files
  # make sure renders dir exists
  if [ "$1" = '-c' ] || [ "$2" = '-c' ]; then
    print -P $FG[192]''
    /usr/bin/cal -3
    print -P $reset_color
  elif [ "$1" = '-h' ] || [ "$1" = '--h' ]; then
    cat << EOF
usage $0 [-c] [-a]
$0 with no paramters shows all classes with assignments due
$0 with -c shows three month calendar in addition
$0 with -a shows archived assignments (see 'hw --h')
EOF
return
  fi

  #clear
  if [ -d ~/.reminders ]; then
    local list_of_files=()
    if [ "$1" = '-a' ]; then # get non-empty archives

      ( # cd to ~/.reminders in sub-shell
      cd ~/.reminders;
      for entry in $(fd '^\.' -H); do
        if [ -s $entry ]; then
          list_of_files+=("$entry")
        fi
      done
      # bat has to be called inside subshell
      # also, cannot use "$list_of_files"
      # with quotes because it will pass
      # all file names as 1 parameter
      bat $list_of_files
      ) # end subshell command

    else # get non-empty regular files
      ( # cd to ~/.reminders in sub-shell
      cd ~/.reminders;
      for entry in $(/bin/ls); do
        if [ -s $entry ]; then
          list_of_files+=("$entry")
        fi
      done
      # bat has to be called inside subshell
      bat $list_of_files
      ) # end subshell command

    fi
  else
    echo '\u001b[38;5;226mrun command: \u001b[38;5;069m<remon>' \
      '\u001b[38;5;226mto turn on reminders'
          ( # cd to ~/.reminders in sub-shell
          cd ~/.reminders.silent;
          for entry in $(/bin/ls); do
            if [ -s $entry ]; then
              list_of_files+=("$entry")
            fi
          done
          # bat has to be called inside subshell
          bat $list_of_files
          ) # end subshell command

  fi
}

function stats() {
  clear
  if [ -d ~/.reminders ]; then
    (cd ~/.reminders && if [ -s STAT50 ]; then bat STAT50; fi)
  else
    echo '\u001b[38;5;226mrun command: \u001b[38;5;069m<remon>' \
      '\u001b[38;5;226mto turn on reminders'
          (cd ~/.reminders.silent && if [ -s STAT50 ]; then bat STAT50; fi)
  fi
}
function music() {
  clear
  if [ -d ~/.reminders ]; then
    (cd ~/.reminders && if [ -s MUSC129 ]; then bat MUSC129; fi)
  else
    echo '\u001b[38;5;226mrun command: \u001b[38;5;069m<remon>' \
      '\u001b[38;5;226mto turn on reminders'
          (cd ~/.reminders.silent && if [ -s MUSC129 ]; then bat MUSC129; fi)
  fi
}
function csc133() {
  clear
  if [ -d ~/.reminders ]; then
    (cd ~/.reminders && if [ -s CSC133 ]; then bat CSC133; fi)
  else
    echo '\u001b[38;5;226mrun command: \u001b[38;5;069m<remon>' \
      '\u001b[38;5;226mto turn on reminders'
          (cd ~/.reminders.silent && if [ -s CSC133 ]; then bat CSC133; fi)
  fi
}
function csc139() {
  clear
  if [ -d ~/.reminders ]; then
    (cd ~/.reminders && if [ -s CSC139 ]; then bat CSC139; fi)
  else
    echo '\u001b[38;5;226mrun command: \u001b[38;5;069m<remon>' \
      '\u001b[38;5;226mto turn on reminders'
          (cd ~/.reminders.silent && if [ -s CSC139 ]; then bat CSC139; fi)
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
    print """
    ----------------------------------------------------------|
      usage: diff <file1> <file2> <N (default 3)>               |
      |
      file1 is first file in comparison                         |
      file2 is second file in comparison                        |
      N is the number of lines to show around each diff         |
      ----------------------------------------------------------|
      """
        else
          colordiff -U "${3:-3}" --label "$1" "$1" --label "$2" "$2"
  fi
}

function vwtf {
  wtf "$1"
  say -v Dan "$(wtf $1)"
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
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -a -m "$@" \
    && git --git-dir=$HOME/.cfg/ --work-tree=$HOME push -u origin master
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
  if [ "$1" == '1' ]; then
    /usr/bin/cal
  elif [ "$1" = '3' ]; then
    /usr/bin/cal -3
  else
    /usr/bin/cal $(date +%G)
    print -P $FG[154]'Issue Command' \
      $reset_color$FG[226]'cal 1'$reset_color$FG[154] \
      'to show one month.'$reset_color
    print -P $FG[154]'Issue Command' \
       $reset_color$FG[226]'cal 3'$reset_color$FG[154] \
       'to show three months.'$reset_color
  fi
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
  #history 0 | awk '{ print $4, $0 }' | egrep "^$1"
  history 0 | awk '{ print $4, $0 }' | ag "^$1"
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

# while zsh is in vim-mode, this must be in ~/.zshrc
#bindkey -s '^R' 'exec zsh\n'

# FZF functions borrowed from github ==========================

# execute selected
function fhx() { # just show the command w/o the number
  eval $( fc -l 1 | awk '{print substr($0, index($0,$2))}' \
    | fzf +s --tac --prompt='execute-> ' )
}

# put selected into edit buffer
function fh() { # just show the command w/o the number
  print -z $( fc -l 1 | awk '{print substr($0, index($0,$2))}' \
    | fzf +s --tac --prompt='edit-> ')
}

# Open history in fzf and put selected command on the command line for edit and/or execute
function fhn() { # shows history number
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | \
    fzf +s --tac --prompt='edit-> ' | awk '!($1="")')
}


# Open history in fzf and immediately execute the selected entry
function fhnx() { # shows history number
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | \
    fzf +s --tac --prompt='execute-> ' | awk '!($1="")')
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

# fzf functions that I wrote ===============================
function fcd {
  local dir
  dir="$(fd . ${1:-.} -I -H -td | fzf --sort \
    --preview=" lsd -A --color=always \
    --icon=always --group-dirs first {}" \
    --preview-window="down:50%" --prompt='cd '\ )" &&
    cd "$dir"
}

function fcdf {
  local file
  local dir
  file="$(fd . ${1:-.} -H -I -tf --ignore-file $HOME/.cust_ignore| \
    fzf -m --preview="bat --color=always --style=numbers {}" \
    --preview-window="down:90%" --prompt='cd-to-dir-of ' \ )"
      [ -n "$file" ] && dir=$(dirname "$file") && cd "$dir"

}

function fvim {
  local files
  files="$(fd . ${1:-.} -H -I -tf --ignore-file $HOME/.cust_ignore | \
    fzf -m --preview="bat --color=always --style=numbers {}" \
    --preview-window="down:90%" --prompt='vim ' \ )"
      [ -n "$files" ] && ${=EDITOR} $(echo "$files")
}

function fnote {
  vnote $(/bin/ls -1 ~/Notes/viNotes | fzf)
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
  ${=EDITOR} ~/.p10k.zsh
}
function es {
  ${=EDITOR} ~/.oh-my-zsh/custom/spotify.zsh
}
