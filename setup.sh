directory=$(dirname $0)

# setup hammerspoon
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
    brew cask install hammerspoon && \
    mkdir ~/.hammerspoon && \
    ln -s $directory/hammerspoonrc ~/.hammerspoon/init.lua

# install victor-mono font
brew tap homebrew/cask-fonts && \
  brew cask install font-victor-mono && \
  brew install font-camingocode

# setup git completion
mkdir -p ~/.zsh && cd ~/.zsh && \
  curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && \
  curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# setup fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
  ~/.fzf/install --all --no-bash
