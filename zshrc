source ~/dotfiles/centralmarket
source ~/dotfiles/zsh/prompt

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
alias dcd='docker-command docker-compose $([[ -f docker-compose-local.yml ]] && echo "-f docker-compose-local.yml") down'
alias dcu='docker-command docker-compose $([[ -f docker-compose-local.yml ]] && echo "-f docker-compose-local.yml") up'

# docker functions
function docker-command {
  docker-machine start &> /dev/null; eval $(docker-machine env)
  $@
}

# environment variables
export EDITOR=nvim

export PATH="$PATH:$HOME/tools/automation"

# random path ... probably specific to mbp-16
export PATH="/usr/local/opt/node@12/bin:$PATH:${GOPATH}/bin"

set -o vi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ===git===
alias g=git

# bash completion - used for git
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# git aliases
alias rebase='git fetch origin && git rebase origin/develop'

# git functions
function merge {
  if [ $# -eq 0 ]; then
    echo "commit message required"
    return
  fi

  rebase && yarn test && git -c advice.detachedHead=false checkout origin/develop && git merge --squash - && git commit -m $1 && git push origin HEAD:develop && git branch -f @{-1} && git checkout -
}

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload creds
autoload -Uz compinit && compinit
