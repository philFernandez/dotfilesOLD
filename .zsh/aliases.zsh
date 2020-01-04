# Temp Aliases {{{1
alias b='(cd ~/eclipse-workspace/A4Prj && ant jar)'
# Commands and Shortcuts {{{1
alias z=k
alias diff='git diff --no-index --color-words'
alias sqlite3='/usr/local/Cellar/sqlite/3.30.1/bin/sqlite3'
alias sql='/usr/local/Cellar/sqlite/3.30.1/bin/sqlite3'
alias remoff='/bin/mv -f ~/.reminders ~/.reminders.silent'
alias remon='/bin/mv -f ~/.reminders.silent ~/.reminders'
alias lls='/bin/ls'
alias shwc='c;shwf -c'
alias shwa='c;shwf -a'
alias shw='c;shwf'
alias md='mkdir -p'
alias f=ranger
alias light='iterm2_profile Light'
alias dark='iterm2_profile Default'
alias ppath='printf "\033[38;5;038m%s\033[0m\n" $path'
alias pfpath='printf "\033[38;5;214m%s\033[0m\n" $fpath'
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
alias fl='fd -HI -d1'
alias zrl='zrecompile && exec zsh'
# Directory Things {{{1
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
# Manpage Shortcuts {{{1
alias bashcond="man -P 'less +2096' bash"
alias zshcond="man -P 'less +1884' zshall"
alias zshexpn="man -P 'less +2538' zshall"
alias zshprompt="man -P 'less +2099' zshall"
# Bat & Fzf {{{1
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
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gcam='git commit -a -m'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias glgp='git log --stat -p'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gm='git merge'
alias gp='git push'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gcl='git clone'
alias gsl='git shortlog'
alias gslc='git shortlog -s | xargs'
alias gco='git checkout'
# Version Controled Dotfiles {{{1
alias preconf='setopt completealiases'
alias postconf='unsetopt completealiases'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='setopt completealiases;config status'
alias cstt='config status'
alias ca='config add'
alias ccam='config commit -a -m; unsetopt completealiases'
alias cpush='config push -u origin master; unsetopt completealiases'
alias clcp='config log --stat -p'
alias clog='config log --oneline --decorate --graph --all'
alias confls='config ls-tree -r master --name-only $HOME'
alias cdl='setopt completealiases; config diff'
alias cdiff='config diff'
alias confzap='unsetopt completealiases; (cd && config checkout .)'
# make man pages display line numbers {{{1
alias nman='LESS+="-N" man'
# Package Management {{{1
alias update="brew -v update && \
  printc -nC spring '==>'; printc -b ' Outdated' \
  && brew outdated && brew cask outdated"
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
