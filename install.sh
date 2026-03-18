#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# Helpers
# =============================================================================

log() {
  printf "\n==> %s\n" "$1"
}

warn() {
  printf "\n[warn] %s\n" "$1"
}

has() {
  command -v "$1" >/dev/null 2>&1
}

link_file() {
  local src="$1"
  local dest="$2"

  if [[ ! -e "$src" ]]; then
    warn "Missing source file: $src"
    return 0
  fi

  if [[ -L "$dest" ]]; then
    local current_target
    current_target="$(readlink "$dest")"
    if [[ "$current_target" == "$src" ]]; then
      echo "Already linked: $dest"
      return 0
    fi
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    mv "$dest" "${dest}.backup.$(date +%Y%m%d%H%M%S)"
    echo "Backed up existing file: $dest"
  fi

  ln -s "$src" "$dest"
  echo "Linked $src -> $dest"
}

# =============================================================================
# Resolve repo root
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# =============================================================================
# Homebrew
# =============================================================================

if ! has brew; then
  log "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  log "Updating Homebrew..."
  brew update
fi

# =============================================================================
# Brew formulae
# =============================================================================

log "Installing brew formulae..."

FORMULAE=(
  autojump
  fnm
  neonctl
  gh
  pure
  thaw
  wget
  zsh-async
)

for formula in "${FORMULAE[@]}"; do
  if brew list "$formula" >/dev/null 2>&1; then
    echo "Already installed: $formula"
  else
    brew install "$formula"
  fi
done

# =============================================================================
# Brew casks
# =============================================================================

log "Installing brew casks..."

CASKS=(
  1password
  arc
  alt-tab
  bartender
  cleanshot
  cursor
  deepl
  dropbox
  flux
  font-fira-code
  ghostty
  jordanbaird-ice
  linear-linear
  notion-calendar
  raycast
  slack
  spotify
  TheBoredTeam/boring-notch/boring-notch
  whatsapp
)

for cask in "${CASKS[@]}"; do
  if [[ -n "${FORCE_CASKS:-}" ]]; then
    echo "Force installing cask: $cask"
    brew install --cask "$cask" --force
  else
    if brew list --cask "$cask" >/dev/null 2>&1; then
      echo "Already installed: $cask"
    else
      brew install --cask "$cask" || warn "Failed to install cask: $cask"
    fi
  fi
done

# =============================================================================
# Node (via fnm)
# =============================================================================

log "Installing Node with fnm..."

export FNM_PATH="${HOME}/.fnm"
eval "$(fnm env --shell bash)"

if ! has node; then
  fnm install --lts
  fnm use lts-latest
else
  echo "Node already available: $(node -v)"
fi

eval "$(fnm env --shell bash)"

if ! has npm; then
  echo "npm is not available after fnm setup."
  exit 1
fi

# =============================================================================
# pnpm
# =============================================================================

log "Installing pnpm and global tools..."

npm install -g pnpm

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

mkdir -p "$PNPM_HOME"
mkdir -p "$HOME/Library/pnpm/global"

pnpm config set global-bin-dir "$PNPM_HOME"
pnpm config set global-dir "$HOME/Library/pnpm/global"

GLOBAL_PNPM_PACKAGES=(
  git-open
  npm-check-updates
)

pnpm add -g "${GLOBAL_PNPM_PACKAGES[@]}"

# =============================================================================
# Dotfiles
# =============================================================================

log "Linking dotfiles..."

link_file "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

# =============================================================================
# Shell profile hints
# =============================================================================

log "Checking shell config hints..."

if [[ -f "$HOME/.zshrc" ]]; then
  if ! grep -q 'PNPM_HOME="$HOME/Library/pnpm"' "$HOME/.zshrc"; then
    cat >> "$HOME/.zshrc" <<'EOF'

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
EOF
    echo "Added PNPM_HOME to ~/.zshrc"
  else
    echo "PNPM_HOME already present in ~/.zshrc"
  fi

  if ! grep -q 'fnm env' "$HOME/.zshrc"; then
    cat >> "$HOME/.zshrc" <<'EOF'

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"
EOF
    echo "Added fnm init to ~/.zshrc"
  else
    echo "fnm init already present in ~/.zshrc"
  fi
fi

log "Done."
echo "Restart your terminal or run: source ~/.zshrc"
