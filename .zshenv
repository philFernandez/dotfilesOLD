# This is loaded by the shell that is spawned by vim's command line

# source functionality for use in vim's :!<command>
if [[ $VIMRUNTIME ]]; then
  # get 256color for vim's :terminal command
  TERM=xterm-256color
  # source zsh aliases
  source $HOME/.oh-my-zsh/custom/Z_aliases.zsh

  # source only the aliases from OMZSH's git plugin
  source <(grep alias $HOME/.oh-my-zsh/plugins/git/git.plugin.zsh)

  # source zsh functions
  source $HOME/.oh-my-zsh/custom/myFunctions.zsh

  # source OMZSH's clipboard plugin
  source $HOME/.oh-my-zsh/lib/clipboard.zsh
fi
