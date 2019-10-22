# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

# brew packages
brew install autojump
brew install wget
brew install tmate
brew install yarn
brew install thefuck
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install ngrok

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# move files
cp .gitignore_global ~/
cp .gitconfig ~/
cp .zshrc ~/

