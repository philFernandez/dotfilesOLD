#export CLASSPATH="/Users/philthy/eclipse-workspace/A3Prj/dist/A3Prj.jar:\
#/Users/philthy/eclipse-workspace/A3Prj/lib/CLDC11.jar:\
#/Users/philthy/eclipse-workspace/A3Prj/lib/CodenameOne.jar"


# Variables {{{
#ZSH_TMUX_AUTOCONNECT=false
#ZSH_TMUX_AUTOSTART=true
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

export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || ag --hidden -g "")'
#export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || fd . -H)'

export FZF_DEFAULT_OPTS="--color hl:120 --color gutter:35 \
  --color pointer:220 --color hl+:118 --color fg:251
  --color marker:196 --color border:214 --color prompt:214\
  --color header:208 --color bg+:240 --reverse --border"
# }}}

# Plugins {{{
plugins=(
  git
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
if [[ $ZSH_THEME == 'powerlevel10k/powerlevel10k' ]]; then
  source ~/.powerlevel_settings
fi
#source /usr/local/Cellar/fzf/0.18.0/shell/completion.zsh
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
compdef _git gdl=git-diff
compdef _gnu_generic lsd
compdef _gnu_generic fzf
# }}}

# Files to Source {{{

[[ -d ~/.reminders ]] && \
	(
     cd ~/.reminders;
	 shw_rc() {
		 local list_of_files
		 for entry in $(/bin/ls); do
			 if [ -s $entry ]; then
				 list_of_files+=("$entry")
			 fi
		 done
		 bat $list_of_files
	 }
 	shw_rc
    )

# }}}

# vim:foldmethod=marker:foldlevel=0:foldenable
