alias g=git
alias package-spfx='gulp bundle --ship && gulp package-solution --ship'

# rg aliases
alias rgi='rg --ignore-case'

# docker aliases
alias d='docker'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcs='docker container stop'

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
