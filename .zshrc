# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#  Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git atom cloudapp npm zsh_reload zsh-syntax-highlighting)

# Sources
source $ZSH/oh-my-zsh.sh

# Paths
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=/usr/local/heroku/bin:$PATH
export PATH=~/npm-global/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

# Aliases
## General
alias c="clear"
alias at="atom"

## Zsh
alias zshconfig="atom ~/.zshrc"

alias bi="bower install"
alias r_modules="sudo rm -rf node_modules/ && mkdir node_modules && sudo chmod 777 node_modules && npm i"

## Git
alias gs="git status";
alias gf="git fetch";
alias ga="git add";
alias grc="git rebase --continue";
alias gra="git rebase --abort";
alias gd="git diff";
alias gl="git lg";
alias gbr="git branch";
alias gco="git checkout";
alias gci="echo 🎯 && git commit";
alias grh="git reset head";

alias amend="gci --amend -m";
alias stash="echo 💃 && git stash -q --keep-index";
alias poop="echo 💩 && git stash pop -q";
alias pp="pull && push";

function basicRebase {
  echo "$ git rebase origin/$(current_branch)"
  git rebase origin/$(current_branch)
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
  echo "$ git pull --rebase origin $(current_branch)"
  git pull --rebase origin $(current_branch)
}

function basicPush {
  echo "$ 🍻  git push origin $(current_branch) 🍻";
  git push origin $(current_branch)
}

function push {
  if [ -n "$1" ]; then
    if [ $1 = "-f" ]; then
      echo "$ 💀  git push origin $(current_branch) -f 💀"
      git push origin $(current_branch) -f
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

nvm use 5

#NPM
# npm set progress=false
