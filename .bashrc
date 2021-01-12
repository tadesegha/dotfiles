set -o vi
export EDITOR=nvim

export PATH="~/tools/automation:/home/tlo/bin:$PATH"
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# miscellaneous
function convert-screen-recording {
  if [ $# -eq 0 ]; then
    echo input file required
    return
  fi

  input=$1
  ffmpeg -i ${input} -vcodec h264 -acodec aac ${input/%.mov/.mp4}
}

currDir=$(cd $(dirname "${BASH_SOURCE[0]}") >/dev/null 2>&1 && pwd)
source $currDir/dotfiles/bash/git
source $currDir/dotfiles/bash/centralmarket.sh
