# Temp Aliases {{{1
alias b='(cd ~/eclipse-workspace/A4Prj && ant jar)'
# Commands and Shortcuts {{{1
alias remoff='/bin/mv -f ~/.reminders ~/.reminders.silent'
alias remon='/bin/mv -f ~/.reminders.silent ~/.reminders'
alias lls='/bin/ls'
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
alias cls=clear
alias c=clear
alias rm='rm -v'
alias cl='clear;lsd --group-dirs first'
alias cll='clear;ls -A'
alias clll='clear;ls -Al'
alias ll='lsd --almost-all -l --blocks date,name --date relative'
alias q='exit'
alias reload='exec zsh'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias ds='du -sh 2> /dev/null'
alias v='/usr/local/bin/vim'
alias bash='/usr/local/bin/bash'
alias watch='watch -n 0.1'
alias rg='rg --colors --colors match:fg:yellow --colors match:style:bold --colors line:style:bold --colors line:fg:yellow --colors path:fg:200,100,50 --colors path:style:bold -S'
alias py='python3'
# Manpage Shortcuts {{{1
alias bashcond="man -P 'less +2096' bash"
alias zshcond="man -P 'less +1884' zshall"
alias zshexpn="man -P 'less +2538' zshall"
alias zshprompt="man -P 'less +2099' zshall"
# Bat & Fzf {{{1
alias color='bat ~/.oh-my-zsh/custom/custom_colors.zsh'
alias bat="LESS+=-S bat --theme 'Monokai Extended Bright'"
alias fhw='shw | fzf'
alias fzfbat='fd -tf --ignore-file $HOME/.cust_ignore | fzf --preview \
	"bat --theme=Monokai\ Extended\ Bright \
	--style=numbers,changes --color always {}" \
	--preview-window="down:95%"'
# Git {{{1
alias github='ln -sf ~/.gitconfigs/.gitconfig.github ~/.gitconfig'
alias gitlab='ln -sf ~/.gitconfigs/.gitconfig.gitlab ~/.gitconfig'
alias glor='LESS+=-N git log --oneline --decorate --reverse'
alias glgp='git log --stat -p B -l diff'
# Version Controled Dotfiles {{{1
alias preconf='setopt completealiases'
alias postconf='unsetopt completealiases'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccam='config commit -a -m'
alias cpush='config push -u origin master'
alias clcp='config log --stat -p | bat -l diff'
alias clog='config log --oneline --decorate --graph --all'
alias confls='config ls-tree -r master --name-only $HOME'
alias cdl='config diff | bat --style=numbers -l diff'
alias confzap='(cd && config checkout .)'
# make man pages display line numbers {{{1
alias nman='LESS+="-N" man'
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

# fuzzy function aliases {{{1
alias fcd1='fcd -d 1'
alias fcd2='fcd -d 2'
alias fcd3='fcd -d 3'
alias fcd4='fcd -d 4'
alias fcd5='fcd -d 5'
alias fcd6='fcd -d 6'

alias fcdf1='fcdf -d 1'
alias fcdf2='fcdf -d 2'
alias fcdf3='fcdf -d 3'
alias fcdf4='fcdf -d 4'
alias fcdf5='fcdf -d 5'
alias fcdf6='fcdf -d 6'

alias fvim1='fvim -d 1'
alias fvim2='fvim -d 2'
alias fvim3='fvim -d 3'
alias fvim4='fvim -d 4'
alias fvim5='fvim -d 5'
alias fvim6='fvim -d 6'

# {{{1
# vim:foldenable foldmethod=marker foldcolumn=1

