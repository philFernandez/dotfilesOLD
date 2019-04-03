#  __________  _________ ___ ___   ___________                   __  .__
#  \____    / /   _____//   |   \  \_   _____/_ __  ____   _____/  |_|__| ____   ____   ______
#    /     /  \_____  \/    ~    \  |    __)|  |  \/    \_/ ___\   __\  |/  _ \ /    \ /  ___/
#   /     /_  /        \    Y    /  |     \ |  |  /   |  \  \___|  | |  (  <_> )   |  \\___ \
#  /_______ \/_______  /\___|_  /   \___  / |____/|___|  /\___  >__| |__|\____/|___|  /____  >
#          \/        \/       \/        \/             \/     \/                    \/     \/


# This file does not have access to Z_aliases.zsh aliases
# because this is sourced first. (Alphabetic By Filename)


##### USER FUNCTIONS #######

# Have to use function, because need filename before
# --group-dirs first
# Also have to unset la in $HOME/.zshrc because
# that alias breaks this function with lsd
function la {
  if [ $# -ge 1 ]; then
    lsd -a $@ --group-dirs first
  else
    lsd -a $pwd --group-dirs first
  fi
}

function ls {
  if [ $# -ge 1 ]; then
    lsd $@ --group-dirs first
  else
    lsd $pwd --group-dirs first
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
    git diff "$@" | pygmentize -f terminal256 -O style=vim -g -l diff | less
  else
    git diff | pygmentize -f terminal256 -O style=vim -g -l diff | less
  fi
}

# show whole year when envoking cal
function cal {
  /usr/bin/cal $(date +%G)
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
  local backColor=010
  local textColor=235

  print -P $FG[$backColor]$BG[$textColor]' PWD '$reset_color$FG[$textColor]$BG[$backColor]'\ue0b0'$FG[000]' '$(pwd)' '$reset_color$FG[$backColor]'\ue0b0'

  # must use this no matter which of the 2 above are used
  echo $reset_color; # must reset or other output (/bin/ls) will get messed up
  lsd --group-dirs first
}

function scat {
  pygmentize -f terminal256 -O style=vim -g $1 | nl -ba
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
    /bin/ls -AFH $1 | egrep -i $2
    # if one arg /bin/ls is done in pwd one single
    # arg is search key
  else
    #/bin/ls -AF | ack -i --nocolor $*
    #/bin/ls -AF | grep -Pi --color=never $*
    /bin/ls -AF | egrep -i $*
  fi
}

# remove all exept for $*
function rmn {
  /bin/ls -A | grep -v "$*" | xargs rm -rf
}

function gitalias {
  alias | grep git | grep "$*"
}

function aliases {
  alias | pygmentize -l shell | grep --color=none "$*"
}

bindkey -s '^R' 'exec zsh\n'
