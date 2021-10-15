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
brew install git-recent
brew install diff-so-fancy
brew install --cask font-fira-code
brew install --cask ngrok
brew install --cask iterm2
brew install --cask slack
brew install --cask spotify
brew tap homebrew/cask-fonts
brew tap heroku/brew

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

# npm globals
npm install --global pure-prompt
npm install --global git-open

# move files
cp .gitignore_global ~/
cp .gitconfig ~/
cp .zshrc ~/
