alias -g L=' | less'
alias -g B='|bat'
alias -g SCH='~/Fall_2019'
alias -g DOW='~/Downloads'
alias -g DOC='~/Documents'
alias -g DES='~/Desktop'
alias -g ECW='~/eclipse-workspace'
alias -g SOU='~/Source_Code'
alias -g NEX='~/Nextcloud'
alias -g NOT='~/Notes'
alias -g CP=' | pbcopy'
alias -g CV=' | pbpaste'
alias -g NL=' | nl -b a'
alias -g BIN='~/.bin'
alias -g C=" | awk END'{print NR}'"
alias -g G='| rg --color never'
alias -g GC='| rg'
alias -g F='|fzf'
alias -g DSF='| diff-so-fancy | less --tabs=4 -RFX'
alias -g COLSOU='| sort | fzf --reverse --preview "bat --theme=Monokai\ Extended\ Bright \
  --style=numbers,changes --color always {}" --preview-window="down:95%"'
