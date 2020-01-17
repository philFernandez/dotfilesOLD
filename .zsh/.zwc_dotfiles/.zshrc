    ######################################################################
    #        |'''''||   .|'''.|  '||'  '||' '||''|.     ..|'''.|         #
    #            .|'    ||..  '   ||    ||   ||   ||  .|'     '          #
    #           ||       ''|||.   ||''''||   ||''|'   ||                 #
    #         .|'      .     '||  ||    ||   ||   |.  '|.      .         #
    #        ||......| |'....|'  .||.  .||. .||.  '|'  ''|....'          #
    ######################################################################
# p10k {{{1
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
stty -ixon

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autoload {{{1
zmodload zsh/complist
autoload -Uz compinit
compinit
autoload -Uz edit-command-line
autoload -Uz printc
autoload -Uz k
autoload zrecompile

# Source any *.zsh file in ~/.zsh top directory
for config_file ($ZSH_CUSTOM/*.zsh(N)); do
  source $config_file
done
unset config_file

typeset -U lib
lib=( ${$(echo $ZSH_CUSTOM/lib/*):r:r:t} )
# Autoload user defined lib functions
for fun in $lib; do
  autoload -Uz $fun
done
unset lib fun

# Bindkey {{{1
KEYTIMEOUT=1
bindkey -D emacs
bindkey -v

# Rebindings ( bindkey -M <keymap> <your binding> <command>  )
# keymap is the group that the command lives in eg.
# the keymap <menuselect> contains the command <vi-backward-char>
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M vicmd ' ' vi-add-eol # space goes to eol in insert mode

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^?" backward-delete-char
bindkey '^X^E' edit-command-line # open vim for writing command
zle -N edit-command-line
bindkey '^F' vi-end-of-line # accept autocomplete
bindkey '^A' vi-beginning-of-line
bindkey '^G' vi-delete # press twice; acts sort of like '^U'
#bindkey -M viins 'jj' vi-cmd-mode

# makes binding for autoloaded 'k'
# but it wont close unless i press enter twice
#zle -N k
#bindkey -s '^K' k

bindkey -s '^R' 'exec zsh\n'
#bindkey -s '^K' 'k\n'
# ^i brings up completion
# ^j accepts completions

bindkey '^h' _complete_help


# Files to Source {{{1

#[[ -d ~/.reminders ]] && [[ ! "$VIMRUNTIME" ]] && [[ ! "$RANGER_LEVEL" ]] && \
  #(
  #cd ~/.reminders;
  #shw_rc() {
    #local list_of_files
    #for entry in $(/bin/ls); do
      #if [ -s $entry ]; then
        #list_of_files+=("$entry")
      #fi
    #done
    #bat -p $list_of_files
  #}
#shw_rc
#)

# set theme in another file that isn't under source control

# only load all of powerlevel9k settings if powerlevel9k is the set theme
#if [[ $ZSH_THEME == 'powerlevel10k/powerlevel10k' ]]; then
#source ~/.powerlevel_settings
#fi

if [[ -s ~/.dircolors ]]; then
  source ~/.dircolors
fi


# Plugins {{{1
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# histdb ----------------
source ~/.zsh/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome
# -----------------------
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Variables {{{1
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# Disable C-S so that it can be used elsewhere



# Exports: {{{1 have to be below source $ZSH/oh-my-zsh.sh

# set vscode as default editor
#export EDITOR='code -w'


export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export RANGER_LOAD_DEFAULT_RC=false
#export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
#export K_TOGGLE_PREV="ctrl-p"
#export K_HEADER_BGCOLOR=202
#export K_HEADER_FGCOLOR=016
#export K_GUTTER_COLOR=$K_HEADER_BGCOLOR
#export K_LINE_BG_COLOR=$K_HEADER_BGCOLOR
#export K_LINE_FG_COLOR=$K_HEADER_FGCOLOR

# set vim as default editor
export EDITOR=/usr/local/bin/vim

export UPDATE_ZSH_DAYS=7

export SAVEHIST=5000
export HISTSIZE=5000

#export LSCOLORS=exGxcxdxCxbxbxCxCxbxbx
export LSCOLORS=ExGxbadxCxbxbxCxCxbxbx


#export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=3;33'

export CLICOLOR=true

export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || rg --hidden --no-ignore --files 2> /dev/null)'
#export FZF_DEFAULT_COMMAND='(rg --hidden --no-ignore --files 2> /dev/null)'

#export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || fd . -H)'

export FZF_DEFAULT_OPTS="--color hl:120 --color gutter:35 \
--color pointer:220 --color hl+:118 --color fg:251
--color marker:196 --color border:214 --color prompt:214 \
--color header:208 --color bg+:240 --reverse \
--bind=ctrl-t:top --border"

# Shell Options {{{1
setopt NONOMATCH \
  HIST_IGNORE_ALL_DUPS \
  INC_APPEND_HISTORY \
  HIST_SAVE_NO_DUPS \
  APPEND_HISTORY \
  SHARE_HISTORY \
  NO_CLOBBER \
  MENU_COMPLETE \
  AUTO_CD \
  AUTO_PUSHD \
  PUSHD_IGNORE_DUPS \
  PUSHD_MINUS \
  INTERACTIVE_COMMENTS

  # Auto Comp Defns {{{1
  #fpath=(~/.oh-my-zsh/custom/completions $fpath)
  compdef _gnu_generic file
  compdef _git gdl=git-diff
  compdef _gnu_generic lsd
  compdef _gnu_generic fzf
  compdef _gnu_generic bat
  #compdef _gnu_generic rg
  #compdef _pdfgrep pdfgrep


# Completion {{{1
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*'         group-name ''
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/Users/philthy/.zsh/.zsh_dotfiles/.zshrc'
# End of lines added by compinstall
_comp_options+=(globdots)
# modeline (¡¡KEEP AT BOTTOM!!){{{1
# vim:foldenable foldmethod=marker foldcolumn=1
