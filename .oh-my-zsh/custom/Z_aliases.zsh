alias wdue='cat DUEDATE'
alias which='which -a'
alias qq='tmux kill-server'
alias cls=clear
alias rm='rm -v'
alias cll='clear;ls -a'
alias clll='clear;ls -l'
alias q='exit'
alias reload='exec zsh'
alias l='lsd -l --date relative --group-dirs first'
alias tree='lsd --tree -a'
alias la='lsd -a --group-dirs first'
alias laa='lsd -la --date relative --group-dirs first'
alias ls='lsd --group-dirs first'
alias bk='cd ..;cl'
alias vi='vim'
alias rd='rm -frv'
alias mv='mv -vi'
alias cp='cp -vi'
alias temp='take temp'
alias ppath='print -l $path'
alias lsblk='df -Hl'
alias py='python3'
alias ds='du -sh'
alias server='ssh philthy@192.168.0.36'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias lh="ls -AF | egrep --color=none '^\.'"
alias wiki='vim -c VimwikiIndex'
alias f='vifm'
alias vimode='pcat /Users/philthy/.oh-my-zsh/plugins/vi-mode/README.md | less'
alias config='git --git-dir=$HOME/.config_file_src_control/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccam='config commit -a -m'
alias cpush='config push -u origin master'


# make man pages display line numbers
alias man='LESS+="-N" man'

# run <pygmentize -L styles> to see all styles
alias pcat='pygmentize -f terminal256 -O style=fruity -g'

# Edit config shortcuts
alias ev='vi ~/.vimrc'
alias ef='vi ~/.oh-my-zsh/custom/myFunctions.zsh'
alias ep='vi ~/.oh-my-zsh/custom/Z_aliases.zsh'
alias rc='vi ~/.zshrc'
alias eg='vi ~/.oh-my-zsh/custom/global_aliases.zsh'
alias ett='vi ~/.zsh_theme'

# Package Management
alias update='brew -v update'
alias upgrade='brew -v upgrade'
alias outdated='brew -v outdated'
alias dryclean='brew cleanup --dry-run'
alias clean='brew cleanup'
alias brews='brew list -1'
