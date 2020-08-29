alias g=git
alias package-spfx='gulp bundle --ship && gulp package-solution --ship'

source ~/dotfiles/centralmarket
source ~/dotfiles/zsh/prompt

# bash completion - used for git
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# rg aliases
alias rgi='rg --ignore-case'

# docker aliases
alias d='docker'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcs='docker container stop'
alias db='docker build'
alias dpl='docker pull'
alias dcsa='docker container stop $(docker container ls -q)'
alias dcra='docker container rm $(docker container ls -aq)'
alias dira='docker image rm $(docker image ls -a)'

alias dcd='docker-compose down'
alias dcu='docker-compose up'

alias dms='docker-machine start; eval $(docker-machine env)'

# random aliases ... probably specific to mbp-16
alias tsc=/Users/tlo/.nvm/versions/node/v10.21.0/bin/tsc
alias firebase="`npm config get prefix`/bin/firebase"

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="/usr/local/opt/node@12/bin:$PATH:${GOPATH}/bin:$HOME/devtools"
export EDITOR=nvim

set -o vi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload creds
autoload -Uz compinit && compinit
