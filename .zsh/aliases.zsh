# vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0
# Commands and Shortcuts {{{1
alias lcs=clear
alias tt=taskwarrior-tui
alias x="7z x"
alias h2="/Users/philthy/Documents/Software/h2/bin/h2.sh &"
alias cpan="echo 'DO NOT USE cpan! It is SLOOOWW' us cpanm"
alias pat="bat -p"
alias ka='k -a'
alias ptest='python -m unittest -v'
alias k9='kill -n 9'
alias ip="ifconfig | rg '\d{3}\.\d{3}\.\d\.\d{2}\b' -o --color=never"
alias dec2hex='hex2dec -r'
alias lightwiki="command cp ~/Notes/VimWikiStyles/light.css ~/Notes/vimwiki_html/style.css \
    && command cp ~/Notes/VimWikiStyles/light.css ~/Notes/Fall2020_html/style.css"
alias darkwiki="command cp ~/Notes/VimWikiStyles/dark.css ~/Notes/vimwiki_html/style.css \
    && command cp ~/Notes/VimWikiStyles/dark.css ~/Notes/Fall2020_html/style.css"
alias finder='open .'
alias wiki3='vim -c "VimwikiIndex 2"'
alias wiki2='vim -c "VimwikiIndex"'
alias wiki=' vim -c "VimwikiIndex 3"'
alias ssh='TERM=xterm-256color ssh'
alias titan="ssh fernandp@titan.ecs.csus.edu"
alias kf='k -f'
alias watch='watch -td -n 0.1'
alias md='mkdir -p'
alias f="ranger"
alias light='echo "\x1B]1337;SetProfile=Light\x07"'
alias dark='echo "\x1B]1337;SetProfile=Default\x07"'
alias ppath='printf "\033[38;5;038m%s\033[0m\n" $path'
alias pfpath='printf "\033[38;5;214m%s\033[0m\n" $fpath'
alias server='ssh philthy@192.168.0.36'
alias timestamp='date +"%m/%d/%Y @ %I:%M %p"'
alias regex='man pcresyntax'
alias tree2='lsd --tree --group-dirs first'
alias time='/usr/bin/time'
alias csl=clear
alias cls=clear
alias c='cl -1'
alias cl='clear;lsd --group-dirs first'
alias cll='clear;ls -A'
alias clll='clear;ls -Al'
alias lls='lsd --almost-all -l --blocks size,name -S'
alias ll='lsd --almost-all -l --blocks date,name --date relative -t'
alias lsh='lsd -d .* --group-dirs first'
alias q='exit'
alias reload='exec zsh'
alias vi='nvim'
alias vim='nvim'
alias vi='nvim'
alias mv='mv -v'
alias ds='du -sh 2> /dev/null'
alias v='nvim'
alias py='python3'
alias fl='fd -HI -d1'
alias zrl='zrecompile && (cd ~/.zsh/lib && fd -e old -x rm) && exec zsh'
alias icat=imgcat
alias mka="cp -r ~/Source_Code/Arduino/arduiono_vscode/.vscode ."
# Tab Colors {{{1
# run cmd "colors" to lists all colors from cmd line
alias material='tab 15 89 97'
alias lightred='tab 251 107 98'
alias maroon='tab 122 12 0'
alias pink='tab 255 192 203'
alias orange='tab 255 125 24'
alias red='tab 255 38 0'
alias green='tab 39 190 0'
alias teal='tab 0 255 200'
alias blue='tab 39 190 255'
alias yellow='tab 255 255 0'
alias purple='tab 122 12 122'
alias darkGreen='tab 51 102 0'
alias peach='tab 255 177 100'
alias oceanic='tab 52 90 107'
# Triad 1
alias triad1a='tab 49 198 165'
alias triad1b='tab 165 49 198'
alias triad1c='tab 198 165 49'
# Tetrad 1
alias tetrad1a='tab 100 59 204'
alias tetrad1b='tab 204 100 59'
alias tetrad1c='tab 162 204 59'
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
alias bat="bat --wrap never"
alias fhw='shw | fzf'
alias fzfbat='fd -tf --ignore-file $HOME/.cust_ignore | fzf --preview \
	"bat --theme=Monokai\ Extended\ Bright \
	--style=numbers,changes --color always {}" \
	--preview-window="down:95%"'
# Git {{{1
alias gls="git ls-files"
alias gce="git commit -a --allow-empty-message -m ''"
alias gzap='git checkout .'
alias github='ln -sf ~/.gitconfigs/.gitconfig.github ~/.gitconfig'
alias gitlab='ln -sf ~/.gitconfigs/.gitconfig.gitlab ~/.gitconfig'
alias glor='LESS+=-N git log --oneline --decorate --reverse'
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gcam='git commit -a -m'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias glgp='git log --stat -p'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --decorate --graph'
alias gloa='git log --oneline --decorate --graph --all'
alias glo='git log --oneline --decorate --graph'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
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
# show files that aren't under source control in ~/.zsh/lib
alias ldiff="printc -ub -C cantaloupe Untracked Lib Functions: && (cd /Users/philthy/.zsh/lib && sort <(fd G -v '(old$|zwc$)') <(config ls-files G -v .gitignore) | uniq -u)"
alias ldiff2="diff -u <(fd G -v '(old$|zwc$)') <(config ls-files G -v .gitignore) DSF"
# show files that aren't under source control in ~/.bin
alias sdiff=" printc -buC strawberry Untracked Bin Scripts: && (cd /Users/philthy/.bin && sort <(fd -tx) <(config ls-files) | uniq -u)"
alias sdiff2="diff -u <(fd -tx) <(config ls-files) DSF"
alias preconf='setopt completealiases'
alias postconf='unsetopt completealiases'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccam='config commit -a -m'
alias cpush='config push -u origin master'
alias clcp='config log --stat -p'
alias clog='config log --oneline --decorate --graph --all'
alias confls='config ls-tree -r master --name-only $HOME'
alias cdl='config diff'
alias cdiff='config diff'
alias confzap='(cd && config checkout .)'
alias cce="config commit -a --allow-empty-message -m ''"
# make man pages display line numbers {{{1
alias nman='LESS+="-N" man'
# Package Management {{{1
alias update="brew update && \
  printc -nC spring '==>'; printc -b ' Outdated' \
  && brew outdated && brew outdated --cask"
alias upgrade='brew upgrade'
alias cupgrade='brew cask upgrade'
alias outdated='brew -v outdated && brew cask outdated'
alias clean='brew cleanup --prune=all -s'
alias brews='brew list -1'
alias show='brew info'
alias search='brew search'
alias install='brew -v install'
alias u="update && upgrade && clean"
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
# Added from command line (mka) {{{1

alias bpython='ptpython'
alias rmv='rm -v'
alias gld='gdl'
alias el="vim ~/.zsh/.zwc_dotfiles/.zlogin"
alias dad="https --json icanhazdadjoke.com | jq '.joke'"
#alias dad='echo "\033[1;38;2;100;255;155m" && curl https://icanhazdadjoke.com && echo "\033[0m\n"'

alias rmi="rmindt"
alias exe="exercism"
