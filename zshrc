alias g=git
alias package-spfx='gulp bundle --ship && gulp package-solution --ship'

source ~/dotfiles/centralmarket
source ~/dotfiles/zsh/prompt

# bash completion - used for git
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# central market aliases
# alias cm-switch-branch='cd ~/dev/central-market/cm-local-dev-environment/centralmarket.com/html && composer install && npm ci && npm run production && cd ../../themes/centralmarket-theme/ && npm ci && npm run build && cd ../../../'
# run composer install && npm ci && npm run production in wp-content/themes/centralmarket-theme and in root

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

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="/usr/local/opt/node@12/bin:$PATH:${GOPATH}/bin:$HOME/devtools"
export EDITOR=nvim

fpath=(~/.zsh-funcs $fpath)
autoload creds

set -o vi
