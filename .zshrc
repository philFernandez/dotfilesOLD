
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOSTART=true
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/philthy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# load theme from another file that isn't under source control
# so that I can change the theme without having to re-commit
# to the repo everytime

source ~/.zsh_theme

# set vscode as default editor
#export EDITOR='code -w'
# set vim as default editor
export EDITOR=/usr/local/bin/vim

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7
#export DISABLE_AUTO_UPDATE=true
#export DISABLE_AUTO_TITLE=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  #globalias
  tmux
  git
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  iterm2
)

setopt NONOMATCH \
  HIST_IGNORE_ALL_DUPS \
  INC_APPEND_HISTORY \
  HIST_SAVE_NO_DUPS \
  APPEND_HISTORY \

source $ZSH/oh-my-zsh.sh
unalias la
unalias ls

export LSCOLORS=exGxcxdxCxbxbxCxCxbxbx

# only load all of powerlevel9k settings if powerlevel9k is the set theme
if [[ $ZSH_THEME == 'powerlevel9k/powerlevel9k' ]]; then
  source ~/.powerlevel_settings
fi

# Auto Comp Defns
compdef _gnu_generic file
compdef _gnu_generic password
compdef _gnu_generic ctm
compdef _git gdl=git-diff
compdef _gnu_generic lsd
