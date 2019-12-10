# Temp Aliases {{{1
alias b='(cd ~/eclipse-workspace/A4Prj && ant jar)'
alias r='cn1'
# Commands and Shortcuts {{{1
alias remoff='/bin/mv -f ~/.reminders ~/.reminders.silent'
alias remon='/bin/mv -f ~/.reminders.silent ~/.reminders'
alias lls='/bin/ls -G'
alias shwc='c;shwf -c'
alias shwa='c;shwf -a'
alias shw='c;shwf'
alias f=ranger
alias light='iterm2_profile Light'
alias dark='iterm2_profile Default'
alias ppath='print -l $path'
alias server='TERM=xterm-256color ssh philthy@192.168.0.36'
alias timestamp='date +"%m/%d/%Y @ %I:%M %p"'
alias regex='man pcresyntax'
alias which='which -a'
alias tree='lsd --tree --group-dirs first'
alias bk='cd ..;cl'
alias cls=clear
alias c=clear
alias rm='rm -v'
alias cl='clear;ls'
alias cll='clear;ls -A'
alias clll='clear;ls -Al'
alias q='exit'
alias reload='exec zsh'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias ds='du -sh 2> /dev/null'
alias nl='nl -b a'
alias v='/usr/local/bin/vim'
alias bash='/usr/local/bin/bash'
alias watch='watch -n 0.1'
alias rg='rg --colors match:bg:blue --colors match:fg:yellow --colors line:style:bold --colors line:fg:yellow --colors path:fg:200,100,50 --colors path:style:bold -S'
# Manpage Shortcuts {{{1
alias bashcond="man -P 'less +2096' bash"
alias zshcond="man -P 'less +1884' zshall"
alias zshexpn="man -P 'less +2538' zshall"
alias zshprompt="man -P 'less +2099' zshall"
# Bat & Fzf {{{1
alias color='bat ~/.oh-my-zsh/custom/custom_colors.zsh'
alias bat="bat --theme 'Monokai Extended Bright'"
alias fhw='shw | fzf'
alias fzfbat='fd -tf --ignore-file $HOME/.cust_ignore | fzf --preview \
	"bat --theme=Monokai\ Extended\ Bright \
	--style=numbers,changes --color always {}" \
	--preview-window="down:95%"'
# Git {{{1
alias github='ln -sf ~/.gitconfigs/.gitconfig.github ~/.gitconfig'
alias gitlab='ln -sf ~/.gitconfigs/.gitconfig.gitlab ~/.gitconfig'
alias glor='LESS+=-N git log --oneline --decorate --reverse'
# Version Controled Dotfiles {{{1
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccam='config commit -a -m'
alias cpush='config push -u origin master'
alias clcp='config log --stat -p'
alias clog='config log --oneline --decorate --graph --all'
alias confls='config ls-tree -r master --name-only $HOME'
alias cdl='config diff | bat --style=numbers -l diff'
alias confzap='(cd && config checkout .)'
# make man pages display line numbers {{{1
alias man='LESS+="-N" man'
# Package Management {{{1
alias update='brew -v update && brew outdated && brew cask outdated'
alias upgrade='brew upgrade && brew cask upgrade'
alias outdated='brew -v outdated && brew cask outdated'
alias dryclean='brew cleanup --dry-run'
alias clean='brew cleanup -s'
alias brews='brew list -1'
alias show='brew info'
alias search='brew search'
alias show_all_cask='brew search --casks' # <package> (optional)
alias install='brew -v install'
# {{{1
# vim:foldenable foldmethod=marker foldcolumn=1
alias finals='cls;bat ~/.reminders/ZLIST\[General_Notes\]'
