# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#  Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(atom autojump npm zsh_reload zsh-syntax-highlighting rbenv)

# Sources
source $ZSH/oh-my-zsh.sh

# Paths
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH=/usr/local/bin:$PATH
export PATH=~/.bin:$PATH
export PATH=$PATH:/usr/local/php5/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:$HOME/npm-global/bin
export PATH="$HOME/.yarn/bin:$PATH"

export GOPATH="$HOME/dev/heetch"
export PATH="$PATH:$GOPATH/src/github.com/heetch/universe/bin"
export PATH="$PATH:$GOPATH/src/github.com/heetch/universe/vendor/bin"
export PATH="$PATH:$GOPATH/bin"
export HOMEBREW_DEVELOPER=1

# Aliases
## General
alias c="clear"
alias at="atom"

## Zsh
alias zshconfig="atom ~/.zshrc"
alias src="source ~/.zshrc"

## Git
alias gs="git status";
alias gf="git fetch";
alias gaa="git add --all";
alias grm="git rebase origin/master";
alias grc="git rebase --continue";
alias gra="git rebase --abort";
alias gd="git diff";
alias gdc="git diff --staged";
alias gl="git lg";
alias gbr="git branch";
alias gco="git checkout";
alias gci="echo 🎯 && git commit";
alias grh="git reset head";

alias stash="echo 💃 && git stash -q --keep-index";
alias poop="echo 💩 && git stash pop -q";
alias pp="pull && push";

function basicRebase {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "$ git rebase origin/$CURRENT_BRANCH"
  git rebase origin/$CURRENT_BRANCH
}

function rebase {
  if [ -n "$1" ]; then
    if [ $1 = "-i" ]; then
      echo "$ git rebase -i head~$2"
      git rebase -i head~$2
    else
      echo "$ git fetch"
      git fetch

      basicRebase
    fi
  else
    basicRebase
  fi
}

function fetch {
  echo "$ git fetch"
  git fetch
}

function pull {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "$ git pull --rebase origin $CURRENT_BRANCH"
  git pull --rebase origin $CURRENT_BRANCH
}

function basicPush {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "$ 🍻  git push origin $CURRENT_BRANCH 🍻";
  git push origin $CURRENT_BRANCH
}

function push {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  if [ -n "$1" ]; then
    if [ $1 = "-f" ]; then
      echo "$ 💀  git push origin $CURRENT_BRANCH -f 💀"
      git push origin $CURRENT_BRANCH -f
    else
      basicPush
    fi
  else
    basicPush
  fi
}

function ri {
  echo "$ git rebase -i head~$1"
  git rebase -i head~$1
}

# NVM
export NVM_DIR="/Users/ugo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use 7

# rbenv
# eval "$(rbenv init -)"

