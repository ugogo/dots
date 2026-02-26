#!/usr/bin/env bash
set -e

# =============================================================================
# Homebrew
# =============================================================================

if [[ $(command -v brew) == "" ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Updating Homebrew..."
  brew update
fi

# =============================================================================
# Brew formulae (CLI tools)
# =============================================================================

echo "Installing brew formulae..."
brew install \
  autojump \
  fnm \
  gh \
  pure \
  wget \
  zsh-async

# =============================================================================
# Brew casks (GUI apps)
# =============================================================================
# Install each cask; skip on failure (e.g. app already in /Applications from non-brew).
# To overwrite existing apps, set FORCE_CASKS=1: FORCE_CASKS=1 ./install.sh

echo "Installing brew casks..."
CASKS=(
  1password
  arc
  cleanshot
  cursor
  deepl
  dropbox
  flux
  font-fira-code
  jordanbaird-ice
  linear-linear
  notion-calendar
  raycast
  slack
  spotify
  whatsapp
)
for cask in "${CASKS[@]}"; do
  if [[ -n "${FORCE_CASKS:-}" ]]; then
    brew install --cask "$cask" --force
  else
    brew install --cask "$cask" || true
  fi
done

# =============================================================================
# Node (via fnm), pnpm (npm -g), and global pnpm packages
# =============================================================================

echo "Installing Node (fnm), pnpm (npm -g), and global tools..."
eval "$(fnm env)"
command -v node &>/dev/null || fnm install --lts
npm install -g pnpm
pnpm add -g git-open npm-check-updates

# =============================================================================
# Dotfiles
# =============================================================================

echo "Linking dotfiles..."
cp .gitconfig ~/
cp .zshrc ~/
