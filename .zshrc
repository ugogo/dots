# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(autojump osx yarn-autocompletions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias c="code"
alias zshconfig="code ~/.zshrc"
alias src="source ~/.zshrc"

alias gs="git status"
alias gf="git fetch"
alias ga="git add"
alias gaa="git add --all"
alias grm="git rebase origin/master"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gd="git diff -w"
alias gdc="git diff -w --staged"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbr="git branch"
alias gco="git checkout"
alias gci="echo 🎯 && git commit"
alias grh="git reset head"
alias gu="git reset --soft HEAD^"
alias gstash="echo 💃 && git stash -q --keep-index"
alias gpoop="echo 💩 && git stash pop -q"
alias gpp="pull && push"

alias yb="yarn build"
alias ys="yarn start"
alias yt="yarn test"
alias yl="yarn lint"
alias yd="yarn dev"

alias s="spotify"

alias wwlan="cd ~/Desktop && sh wlan.command"
alias w2.4="cd ~/Desktop && sh 2.4-1764.command"

function push {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

  if [[ $1 == "-f" ]]; then
    echo "$ 💀  git push origin $CURRENT_BRANCH -f 💀"
    git push origin $CURRENT_BRANCH -f
  else
    echo "$ 🍻  git push origin $CURRENT_BRANCH 🍻"
    git push origin $CURRENT_BRANCH
  fi
}

function pull {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "$ git pull --rebase origin $CURRENT_BRANCH"
  git pull --rebase origin $CURRENT_BRANCH
}

function ri {
  echo "$ git rebase -i head~$1"
  git rebase -i head~$1
}

export PATH=~/.bin:$PATH

# heetch related

# go
export GOPATH="$HOME/dev/go"
export PATH=$GOPATH/bin:$PATH
export PATH=$GOPATH/src/github.com/heetch/universe/bin:$PATH

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 11.10.1

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
