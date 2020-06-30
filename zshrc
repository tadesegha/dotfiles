alias g=git
alias package-spfx='gulp bundle --ship && gulp package-solution --ship'

export PATH="/usr/local/opt/node@12/bin:$PATH"

fpath=(~/.zsh-funcs $fpath)
autoload creds

set -o vi
