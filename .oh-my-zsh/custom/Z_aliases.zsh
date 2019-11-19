alias b='(cd ~/eclipse-workspace/A3Prj && ant jar)'
alias nl='nl -b a'
alias fhw='shw | fzf'
alias v='/usr/local/bin/vim'
alias cds='fcd ~/Fall_2019'
alias cla='cls;ls -A'
alias remoff='/bin/mv -f ~/.reminders ~/.reminders.silent'
alias remon='/bin/mv -f ~/.reminders.silent ~/.reminders'
alias dos2unix="perl -pi -e 's/\r\n$/\n/g'"
alias bat="bat --theme 'Monokai Extended Bright'"
alias unix2dos="perl -pi -e 's/$/\r/'"
alias wtf='wtf -o'
alias vscode='code -n .'
alias cpd='pwd|pbcopy'
alias regex='man pcresyntax'
alias timestamp='date +"%m/%d/%Y @ %I:%M %p"'
alias light='iterm2_profile Light'
alias dark='iterm2_profile Default'
alias which='which -a'
alias cls=clear
alias c=clear
alias rm='rm -v'
alias cll='clear;pwdc;ls -A'
alias clll='clear;pwdc;ls -Al'
alias q='exit'
alias reload='exec zsh'
alias tree='lsd --tree --group-dirs first'
alias bk='cd ..;cl'
alias vi='vim'
alias mv='mv -vi'
alias cp='cp -vip'
alias ppath='print -l $path'
alias ds='du -sh'
alias server='ssh philthy@192.168.0.36'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias wiki='v -c VimwikiIndex'
alias wiki2='v ~/Nextcloud/CSUS/Fall_2019/wiki/index.wiki'
alias chkbu='watch -n 0.1 ls -all /Volumes'
alias selbook='open $(mdfind -onlyin $HOME/Spring_2019 -interpret "pdf" | sk -m)'
alias fzfbat='fd -tf --ignore-file $HOME/.cust_ignore | fzf --preview \
	"bat --theme=Monokai\ Extended\ Bright \
	--style=numbers,changes --color always {}" \
	--preview-window="down:95%"'

# dotfile/config bar repo aliases
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccam='config commit -a -m'
alias cpush='config push -u origin master'
alias clcp='config log --stat -p'
alias clog='config log --oneline --decorate --graph --all'
alias configls='config ls-tree -r master --name-only $HOME'
alias cdl='config diff | bat --style=numbers -l diff'

# make man pages display line numbers
alias man='LESS+="-N" man'

# Package Management
alias update='brew -v update'
alias upgrade='brew upgrade && brew cask upgrade'
alias outdated='brew -v outdated && brew cask outdated'
alias dryclean='brew cleanup --dry-run'
alias clean='brew cleanup -s'
alias brews='brew list -1'
alias show='brew info'
