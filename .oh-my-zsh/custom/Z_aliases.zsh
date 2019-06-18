alias vim=''
alias vi=''
alias v='/usr/local/bin/vim'
alias dos2unix="perl -pi -e 's/\r\n$/\n/g'"
alias bat="bat --theme 'Monokai Extended Origin'"
alias unix2dos="perl -pi -e 's/$/\r/'"
alias wtf='wtf -o'
alias vscode='code -n .'
alias cpd='pwd|pbcopy'
alias regex='man pcresyntax'
alias player="pygmentize -l zsh -f terminal256 -O style=vim ~/.oh-my-zsh/custom/spotify.zsh"
alias timestamp='date +"%m/%d/%Y @ %I:%M %p"'
alias light='iterm2_profile Light'
alias dark='iterm2_profile Default'
alias wdue='cat DUEDATE'
alias which='which -a'
alias cls=clear
alias rm='rm -v'
alias cll='clear;ls -a'
alias clll='clear;ls -l'
alias q='exit'
alias reload='exec zsh'
alias tree='lsd --tree'
alias bk='cd ..;cl'
alias vi='vim'
alias rd='rm -frv'
alias mv='mv -vi'
alias cp='cp -vi'
alias ppath='print -l $path'
alias ds='du -sh'
alias server='ssh philthy@192.168.0.36'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias wiki='vim -c VimwikiIndex'
alias wiki2='vim ~/Nextcloud/CSUS/Fall_2019/wiki/index.wiki'
alias f='ranger'
alias chkbu='watch -n 0.1 ls -all /Volumes'
alias selbook='open $(mdfind -onlyin $HOME/Spring_2019 -interpret "pdf" | sk -m)'

# dotfile/config bar repo aliases
alias config='git --git-dir=$HOME/.config_file_src_control/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccam='config commit -a -m'
alias cpush='config push -u origin master'
alias clcp='config log --stat -p'
alias clog='config log --oneline --decorate --graph'
alias cdiff='config diff'
alias configls='config ls-tree -r master --name-only $HOME'
alias cdl='cdiff COLOR L'

# make man pages display line numbers
alias man='LESS+="-N" man'

# run <pygmentize -L styles> to see all styles
alias pcat='pygmentize -f terminal256 -O style=monokai -g'

# Edit config shortcuts
alias ev='v ~/.vimrc'
alias ef='v ~/.oh-my-zsh/custom/myFunctions.zsh'
alias ep='v ~/.oh-my-zsh/custom/Z_aliases.zsh'
alias rc='v ~/.zshrc'
alias eg='v ~/.oh-my-zsh/custom/global_aliases.zsh'
alias ett='v ~/.zsh_theme'
alias et='v ~/.tmux.conf'
alias es='v ~/.oh-my-zsh/custom/spotify.zsh'

# Package Management
alias update='brew -v update'
alias upgrade='brew upgrade && brew cask upgrade'
alias outdated='brew -v outdated && brew cask outdated'
alias dryclean='brew cleanup --dry-run'
alias clean='brew cleanup -s'
alias brews='brew list -1'
