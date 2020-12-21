set -o vi
export EDITOR=nvim

export PATH="~/tools/automation:$PATH"

# ===git===
# this is currently specialized for central market. would be nice if this were generic
alias g=git

# bash completion - used for git
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# git aliases
alias rebase='git fetch origin && git rebase origin/develop'

# git functions
function merge {
  if [ $# -eq 0 ]; then
    msg=$(g l -n 1 --oneline | cut -d " " -f 2-)
    echo "using last commit message: $msg"
  else
    msg=$1
  fi

  rebase && yarn lint && yarn test && git -c advice.detachedHead=false checkout origin/develop && git merge --squash - && git commit -m $msg && git push origin HEAD:develop && git branch -f @{-1} && git checkout -
}

# miscellaneous
function convert-screen-recording {
  if [ $# -eq 0 ]; then
    echo input file required
    return
  fi

  input=$1
  ffmpeg -i ${input} -vcodec h264 -acodec aac ${input/%.mov/.mp4}
}
