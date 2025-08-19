# install zsh

if [ -n $ZSH ]; then
  echo "$ Zsh already installed, skipping..."
else
  echo "$ Installing zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install brew
if [[ $(command -v brew) == "" ]]; then
    echo "$ Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "$ Updating Homebrew"
    brew update
fi

# brew packages
 echo "$ Installing brew packages..."
 brew tap homebrew/cask-fonts
 brew install \
 autojump \
 diff-so-fancy \
 fnm \
 git-recent \
 pure \
 whatsapp \
 wget \
 yarn
brew install --cask \
1password \
arc \
bartender \
cleanshot \
cursor \
cron \
deepl \
dropbox \
font-fira-code \
flux \
iterm2 \
linear-linear \
ngrok \
raycast \
slack \
spotify \
vlc

# zsh plugins
echo "$ Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# npm packages
echo "$ Installing npm packages..."
npm install --global git-open
npm install --global npm-check-updates

# move files
echo "$ Moving files..."
cp .gitignore_global ~/
cp .gitconfig ~/
cp .zshrc ~/

# # open apps
open /Applications/Flux.app
open /Applications/Dropbox.app/

