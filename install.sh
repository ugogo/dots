# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brew tap heroku/brew
brew tap homebrew/cask-fonts
brew install autojump diff-so-fancy fnm git-recent heroku postgres whatsapp wget yarn
brew install --cask cleanshot dropbox font-fira-code flux iterm2 ngrok postico slack spotify visual-studio-code zoom

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

# open apps
open /Applications/Flux.app
open /Applications/Dropbox.app/
