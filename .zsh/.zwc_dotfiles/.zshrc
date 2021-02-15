        ######################################################################
        #        |'''''||   .|'''.|  '||'  '||' '||''|.     ..|'''.|         #
        #            .|'    ||..  '   ||    ||   ||   ||  .|'     '          #
        #           ||       ''|||.   ||''''||   ||''|'   ||                 #
        #         .|'      .     '||  ||    ||   ||   |.  '|.      .         #
        #        ||......| |'....|'  .||.  .||. .||.  '|'  ''|....'          #
        ######################################################################
# echo "!!!!!!!!!! play with zenity (after you do things you're supposed to!!)"
#export CLASSPATH=.:$HOME/javagaming8/javagaming/jogl/jogl-all.jar:$HOME/javagaming8/javagaming/jogl/gluegen-rt.jar:$HOME/javagaming8/javagaming/rage165/ray.jar:$HOME/javagaming8/javagaming/joml/joml-jdk8-1.9.25.jar:$HOME/javagaming8/javagaming/jinput/jinput.jar:$HOME/javagaming8/javagaming/jogl/joal.jar:$HOME/javagaming8/javagaming/vecmath/vecmath.jar:$HOME/javagaming8/javagaming/jbullet/jbullet.jar:$HOME/javagaming8/javagaming/graphicslib3D/graphicslib3D.jar
# {{{1 iterm2 set tab/window title
# Set iterm window/tab titles empty
# if you want to set it to somehthing,
# put the text between the two things (\033] and \007)
# outside of the quotes
#printf "\e[038;5;%dm" $[$RANDOM%229]; cowsay $(fortune -a wisdom)

#echo -ne "\033]0;"Put Text Here"\007" # window title i think?
#echo -ne "\033]1;"Put Text Here"\007" # tab title i think?

#echo -ne "\033]0;""\007" # window title i think?
#echo -ne "\033]1;""\007" # tab title i think?
# p10k {{{1
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

stty -ixon

# Generated p10k theme
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# My old p9k theme
#[[ ! -f $HOME/.powerlevel_settings ]] || source $HOME/.powerlevel_settings

# My original generated p10k theme
#[[ ! -f $ZDOTDIR/.myP10k.zsh ]] || source $ZDOTDIR/.myP10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# Autoload {{{1
zmodload zsh/complist # has to be before compinit
autoload -U compinit
compinit -u
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

bindkey "\e[3~" delete-char # make del key work correctly
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

# Make delete key work in vi-mode
bindkey -a '^[[3~' delete-char
# Make backspace key work in vi-mode
bindkey "^?" backward-delete-char

# Files to Source {{{1


if [[ -s ~/.dircolors ]]; then
  source ~/.dircolors
fi
# Plugins {{{1
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme


source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# histdb ----------------
#source ~/.zsh/zsh-histdb/sqlite-history.zsh
#autoload -Uz add-zsh-hook
#add-zsh-hook precmd histdb-update-outcome
# -----------------------
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Variables {{{1
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# Disable C-S so that it can be used elsewhere



# Exports: {{{1 have to be below source $ZSH/oh-my-zsh.sh

# set vscode as default editor
#export EDITOR='code -w'

export BAT_THEME="Monokai Extended Bright"
export BAT_STYLE="changes,header,numbers,snip"

# for light theme
#export BAT_THEME="Monokai Extended Light"

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
export EDITOR=nvim
#export PAGER=less
# export PAGER="bat -p"

export UPDATE_ZSH_DAYS=7

export SAVEHIST=500000
export HISTSIZE=500000

#export LSCOLORS=exGxcxdxCxbxbxCxCxbxbx
export LSCOLORS=ExGxbadxCxbxbxCxCxbxbx



export CLICOLOR=true

#export FZF_DEFAULT_COMMAND="(git ls-tree -r --name-only HEAD 2> /dev/null \
#|| rg --hidden --no-ignore --files 2> /dev/null)"
#export FZF_DEFAULT_COMMAND='(rg --hidden --no-ignore --files 2> /dev/null)'

export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD 2> /dev/null || fd . -HI)'

export FZF_DEFAULT_OPTS="--color hl:120 --color gutter:35 \
--color pointer:220 --color hl+:118 --color fg:251
--color marker:196 --color border:214 --color prompt:214 \
--color header:208 --color bg+:240 --reverse \
--bind=ctrl-t:top --border --multi"

# Shell Options {{{1
setopt NONOMATCH \
  HIST_IGNORE_ALL_DUPS \
  INC_APPEND_HISTORY \
  HIST_SAVE_NO_DUPS \
  HIST_IGNORE_SPACE \
  APPEND_HISTORY \
  SHARE_HISTORY \
  NO_CLOBBER \
  MENU_COMPLETE \
  AUTO_CD \
  AUTO_PUSHD \
  PUSHD_IGNORE_DUPS \
  PUSHD_MINUS \
  INTERACTIVE_COMMENTS \
  COMPLETE_ALIASES

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
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle ':completion:*' completer _list _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' insert-unambiguous true
# MODELINE {{{1
# vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0
