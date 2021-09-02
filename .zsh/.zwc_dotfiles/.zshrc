        ######################################################################
        #        |'''''||   .|'''.|  '||'  '||' '||''|.     ..|'''.|         #
        #            .|'    ||..  '   ||    ||   ||   ||  .|'     '          #
        #           ||       ''|||.   ||''''||   ||''|'   ||                 #
        #         .|'      .     '||  ||    ||   ||   |.  '|.      .         #
        #        ||......| |'....|'  .||.  .||. .||.  '|'  ''|....'          #
        ######################################################################

# search history based on text showing on screen with up/down

# {{{1 Temporary
# echo "!!!!!!!!!! play with zenity (after you do things you're supposed to!!)"
#echo
#echo
#echo "\033[1;m\033[38;5;1;mTurn off error ignore in ~/.config/flake8\033[0;m"
#echo
#echo

# Temp ENV_VARS for Python JWT Project =====================
#export SECRET_KEY="\xceJg\x8b\x99\x19\x91/r\xc3a\xe4\x07\x13\xb76\xbeR\x8c\xe7\x95:\xfa\xef"
#export APP_SETTINGS="project.server.config.DevelopmentConfig"
# ==========================================================


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

# Minimal Theme (Comment out above line, and the line that sources pk10 below in plugins)
 #export PS1="%F{2}>%f "

# My old p9k theme
#[[ ! -f $HOME/.powerlevel_settings ]] || source $HOME/.powerlevel_settings

# My original generated p10k theme
#[[ ! -f $ZDOTDIR/.myP10k.zsh ]] || source $ZDOTDIR/.myP10k.zsh


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

# Files to Source {{{1


if [[ -s ~/.dircolors ]]; then
  source ~/.dircolors
fi
# Plugins {{{1
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------- ZVM (vim mode plugin) ----------
# export ZVM_LAZY_KEYBINDINGS=false
# "vv" in normal mode will open editor
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
export ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
export ZVM_VI_EDITOR=nvim
# KEYTIMEOUT=1 messes up surround ys" cs" ' ds"  (unless you can do it in < 100th of sec)
#      But S" works (in visual mode), and thats all I care about
export ZVM_KEYTIMEOUT=0.01  # = KEYTIMEOUT=1
# Bindings related to vim mode
zvm_bindkey vicmd ' ' zvm_append_eol
zvm_bindkey viins "^[[A" history-beginning-search-backward
zvm_bindkey viins "^[[B" history-beginning-search-forward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# --------------------------------------------
eval "$(pyenv init -)"

# Variables {{{1
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# Disable C-S so that it can be used elsewhere



# Exports: {{{1 have to be below source $ZSH/oh-my-zsh.sh

export PICO_SDK_PATH=/Users/philthy/Source_Code/Arduino/RP_2040/C_Cpp/pico-sdk

#export BAT_THEME="Monokai Extended Bright"
export BAT_THEME="OneHalfDark"
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
# set vscode as default editor
# export EDITOR='code -w'
#export PAGER=less
# export PAGER="bat -p"


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
  #compdef _gnu_generic bat
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
