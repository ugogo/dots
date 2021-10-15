export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(autojump osx zsh-autosuggestions git-open)

# Pure theme
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
zstyle :prompt:pure:path color cyan
zstyle :prompt:pure:git:branch color '#EEE'
prompt pure

source $ZSH/oh-my-zsh.sh

# aliases
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
alias gcp="git cherry-pick"
alias grh="git reset head"
alias gstash="echo 💃 && git stash -q --keep-index"
alias gpoop="echo 💩 && git stash pop -q"

alias yb="yarn build"
alias ys="yarn start"
alias yt="yarn test"
alias yl="yarn lint"
alias yd="yarn dev"

alias s="spotify"
alias wip="gaa && gci -n -m 'wip'"

function push {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

  if [[ $1 == "-f" ]]; then
    echo "$ 💀  git push origin $CURRENT_BRANCH --force-with-lease 💀"
    git push origin $CURRENT_BRANCH --force-with-lease
  else
    echo "$ 🍻  git push origin $CURRENT_BRANCH 🍻"
    git push origin $CURRENT_BRANCH
  fi
}

function pull {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  echo "$ git pull origin $CURRENT_BRANCH --rebase"
  git pull --rebase origin $CURRENT_BRANCH
}

function ri {
  echo "$ git rebase -i head~$1"
  git rebase -i head~$1
}

export PATH=~/.bin:$PATH

# Shine
glogin() {
  gcloud auth application-default login
  token-getter
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ugogo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ugogo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ugogo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ugogo/google-cloud-sdk/completion.zsh.inc'; fi
