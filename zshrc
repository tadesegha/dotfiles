alias g=git

source ~/dotfiles/centralmarket
source ~/dotfiles/zsh/prompt

# bash completion - used for git
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# rg aliases
alias rgi='rg --ignore-case'

# docker aliases
alias d='docker'
alias dcl='docker-command docker container ls'
alias dcla='docker container ls -a'
alias dcs='docker container stop'
alias db='docker build'
alias dpl='docker pull'
alias dcsa='docker container stop $(docker container ls -q)'
alias dcra='docker container rm $(docker container ls -aq)'
alias dira='docker image rm $(docker image ls -a)'

# docker-compose aliases
alias dcd='docker-compose down'
alias dcu='docker-command docker-compose $([[ -f docker-compose-local.yml ]] && echo "-f docker-compose-local.yml") up'

# automation aliases
alias ,r='run'
alias ,rt='run-tests'
alias ,t='watch-tests'

# docker functions
function docker-command {
  docker-machine start &> /dev/null; eval $(docker-machine env)
  $@
}

# environment variables
export EDITOR=nvim

export PATH="$PATH:$HOME/devtools/automation"

# random path ... probably specific to mbp-16
export PATH="/usr/local/opt/node@12/bin:$PATH:${GOPATH}/bin"

set -o vi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload creds
autoload -Uz compinit && compinit
