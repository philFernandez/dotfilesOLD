# Temp Aliases {{{1
alias b='(cd ~/eclipse-workspace/A3Prj && ant jar)'

# Commands and Shortcuts {{{1
alias remoff='/bin/mv -f ~/.reminders ~/.reminders.silent'
alias remon='/bin/mv -f ~/.reminders.silent ~/.reminders'
alias light='iterm2_profile Light'
alias dark='iterm2_profile Default'
alias ppath='print -l $path'
alias server='ssh philthy@192.168.0.36'
alias timestamp='date +"%m/%d/%Y @ %I:%M %p"'
alias regex='man pcresyntax'
alias which='which -a'
alias tree='lsd --tree --group-dirs first'
alias cls=clear
alias c=clear
alias rm='rm -v'
alias cll='clear;pwdc;ls -A'
alias clll='clear;pwdc;ls -Al'
alias q='exit'
alias reload='exec zsh'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias ds='du -sh'
alias nl='nl -b a'
alias v='/usr/local/bin/vim'
alias cla='cls;ls -A'


# Bat & Fzf {{{1
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
alias configls='config ls-tree -r master --name-only $HOME'
alias cdl='config diff | bat --style=numbers -l diff'

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

# {{{1
# vim:foldenable foldmethod=marker foldcolumn=1
