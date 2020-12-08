# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brew install autojump
brew install wget
brew install tmate
brew install yarn
brew install heroku
brew install postgres
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install ngrok
brew tap heroku/brew

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# pure
# https://github.com/sindresorhus/pure
npm install --global pure-prompt

# move files
cp .gitignore_global ~/
cp .gitconfig ~/
cp .zshrc ~/

