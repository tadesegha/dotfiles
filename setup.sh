directory=$(dirname $0)

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
    brew cask install hammerspoon && \
    mkdir ~/.hammerspoon && \
    ln -s $directory/hammerspoonrc ~/.hammerspoon/init.lua
