# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brew install autojump
brew install wget
brew install tmate
brew install yarn
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install ngrok

# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# move files
cp .gitignore_global ~/
cp .gitconfig ~/
cp .zshrc ~/

# heetch related
brew install rbenv
