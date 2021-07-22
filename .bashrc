# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### aliases ###
###############
alias ls='ls --color=auto'
alias v=nvim
alias githubsignin="eval '$(ssh-agent -s)' && ssh-add $HOME/keys/github_marneylc"

PS1='[ \W ] $ '
