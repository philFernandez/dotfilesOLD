[[ -a ~/Notes/software_to_try.txt ]] && \
  cat ~/Notes/software_to_try.txt

[[ -a ~/.reminders/reminders.txt ]] && \
  cat ~/.reminders/reminders.txt
# Variables {{{
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOSTART=true
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# Disable C-S so that it can be used elsewhere
stty -ixon
# }}}

# Exports {{{
# Path to your oh-my-zsh installation.
export ZSH="/Users/philthy/.oh-my-zsh"

# set vscode as default editor
#export EDITOR='code -w'

# set vim as default editor
export EDITOR=/usr/local/bin/vim

export UPDATE_ZSH_DAYS=7

export SAVEHIST=HISTSIZE=500000

export LSCOLORS=exGxcxdxCxbxbxCxCxbxbx

#export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
#export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || ag --hidden -g "")'

#export FZF_DEFAULT_OPTS='--color gutter:2 --ansi'
export FZF_DEFAULT_OPTS="--color hl:118 --color gutter:35 \
  --color pointer:118 --ansi --reverse"
export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || fd . -H)'
# }}}

# Plugins {{{
plugins=(
  tmux
  git
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  iterm2
)
# }}}

# Shell Options {{{
setopt NONOMATCH \
  HIST_IGNORE_ALL_DUPS \
  INC_APPEND_HISTORY \
  HIST_SAVE_NO_DUPS \
  APPEND_HISTORY \
  SHARE_HISTORY
# }}}

# Source Things {{{
# set theme in another file that isn't under source control
source ~/.zsh_theme

source $ZSH/oh-my-zsh.sh

# only load all of powerlevel9k settings if powerlevel9k is the set theme
if [[ $ZSH_THEME == 'powerlevel9k/powerlevel9k' ]]; then
  source ~/.powerlevel_settings
fi
source /usr/local/Cellar/fzf/0.18.0/shell/completion.zsh
# }}}

# Unset aliases {{{
if [[ $VIMRUNTIME == "" && $VIFM == "" ]]; then
  # causes error if this is unaliased inside vim or vifm shell
  # so only unalias it if we're not in vim or vifm
  unalias ls
fi
unalias la
unalias l
unalias rd
# }}}
 
# Auto Comp Defns {{{
compdef _gnu_generic file
compdef _gnu_generic password
compdef _gnu_generic ctm
compdef _git gdl=git-diff
compdef _gnu_generic lsd
compdef _gnu_generic fzf
# }}}

# vim:foldmethod=marker:foldlevel=0:foldenable
