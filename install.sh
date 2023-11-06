# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brew tap homebrew/cask-fonts
brew install autojump diff-so-fancy fnm git-recent postgres whatsapp wget yarn
brew install --cask 1password arc bartender cleanshot cron deepl dropbox font-fira-code flux iterm2 linear-linear ngrok raycast slack spotify visual-studio-code vlc

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

# postgres
# https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3
# ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
# createdb `whoami`
# brew services start postgresql
