# Temp Things {{{1

#export CLASSPATH="/Users/philthy/eclipse-workspace/A3Prj/dist/A3Prj.jar:\
#/Users/philthy/eclipse-workspace/A3Prj/lib/CLDC11.jar:\
#/Users/philthy/eclipse-workspace/A3Prj/lib/CodenameOne.jar"


# Variables {{{1
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
# Disable C-S so that it can be used elsewhere
stty -ixon

# Plugins {{{1
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
  iterm2
)

# Shell Options {{{1
setopt NONOMATCH \
  HIST_IGNORE_ALL_DUPS \
  INC_APPEND_HISTORY \
  HIST_SAVE_NO_DUPS \
  APPEND_HISTORY \
  SHARE_HISTORY

# Source Things {{{1
# set theme in another file that isn't under source control
source ~/.zsh_theme

#--Do-Not-Separate-These-Two-------------
export ZSH="/Users/philthy/.oh-my-zsh" #|
source $ZSH/oh-my-zsh.sh               #|
#--Keep-Them-In-Same-Order---------------

# only load all of powerlevel9k settings if powerlevel9k is the set theme
if [[ $ZSH_THEME == 'powerlevel10k/powerlevel10k' ]]; then
  source ~/.powerlevel_settings
fi

# Exports: {{{1 have to be below source $ZSH/oh-my-zsh.sh
# Path to your oh-my-zsh installation.

# set vscode as default editor
#export EDITOR='code -w'

# set vim as default editor
export EDITOR=/usr/local/bin/vim

export UPDATE_ZSH_DAYS=7

export SAVEHIST=500000
export HISTSIZE=500000

export LSCOLORS=exGxcxdxCxbxbxCxCxbxbx

export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || ag --hidden -g "")'
#export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || fd . -H)'

export FZF_DEFAULT_OPTS="--color hl:120 --color gutter:35 \
	--color pointer:220 --color hl+:118 --color fg:251
	--color marker:196 --color border:214 --color prompt:214\
		--color header:208 --color bg+:240 --reverse --border"

# Unset aliases {{{1
if [[ $VIMRUNTIME == "" && $VIFM == "" ]]; then
  # causes error if this is unaliased inside vim or vifm shell
  # so only unalias it if we're not in vim or vifm
  unalias ls
fi
unalias la
unalias l
unalias rd

# Auto Comp Defns {{{1
fpath=(~/.oh-my-zsh/custom/completions $fpath)
compdef _gnu_generic file
compdef _git gdl=git-diff
compdef _gnu_generic lsd
compdef _gnu_generic fzf
compdef _gnu_generic bat
compdef _pdfgrep pdfgrep

# Files to Source {{{1

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

# vim:foldenable foldmethod=marker foldcolumn=1
