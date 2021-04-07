#!/bin/bash

# variables
GIT_USERNAME="taylorturner"
GIT_EMAIL="taylor.turner@payjoy.com"

# install xcode
xcode-select --install

# install oh my zsh + plugins
/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chmod 755 /usr/local/share/zsh
sudo chmod 755 /usr/local/share/zsh/site-functions

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# update homebrew
brew update

# install apps
brew tap homebrew/cask
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask slack
brew install --cask zoom
brew install --cask 1password
brew install --cask spotify
brew install --cask alfred
brew install --cask zoom
brew install --cask tunnelblick
brew install vim awscli nmap curl wget htop golang pyenv zlib sqlite

# install zsh plugins
brew install zsh-autosuggestions zsh-syntax-highlighting 

# add plugins to .zshrc
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
echo 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

# install powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

# show hidden files, paths, etc.
chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# configure git
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

# install java 8
brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk

# configure $JAVA_HOME
echo “export JAVA_HOME=$(/usr/libexec/java_home)” >> ~/.zshrc

# install python3
brew install pyenv
echo ‘eval “$(pyenv init -)”’ >> ~/.zshrc
pyenv install 3.9.4
pyenv install 2.7.18
pyenv global 2.7.18

# install ansible
sudo pip install ansible==2.7

# install vagrant
brew install --cask vagrant
vagrant plugin install vagrant-hostsupdater

# install virtualbox
brew install --cask virtualbox
