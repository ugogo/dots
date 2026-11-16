# =============================================================================
# Environment & PATH
# =============================================================================

export PATH="$HOME/.bin:$PATH"

# pnpm — add pnpm bins to PATH (no-op if already present)
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# fnm — Node version manager (must be installed: brew install fnm)
export FNM_VERSION_FILE_STRATEGY=recursive
eval "$(fnm env --use-on-cd)"

# =============================================================================
# Zsh options (optional but useful)
# =============================================================================

# Share history between sessions and append immediately
setopt SHARE_HISTORY
setopt APPEND_HISTORY
# Ignore duplicates and commands starting with space
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# =============================================================================
# Prompt — Pure (https://github.com/sindresorhus/pure)
# =============================================================================
# Installed via: brew install pure. Ensures prompt is found when not using Homebrew zsh.
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit
promptinit
PURE_PROMPT_SYMBOL='$'
zstyle :prompt:pure:path color cyan
zstyle :prompt:pure:git:branch color '#EEE'
prompt pure

# =============================================================================
# Autojump — j <part-of-path> to jump to a frequently used directory
# =============================================================================
# Requires: brew install autojump. Then use: j kings, j doc, etc.
_autojump_script="$(brew --prefix autojump 2>/dev/null)/share/autojump/autojump.zsh"
[[ -s "$_autojump_script" ]] && source "$_autojump_script"
unset _autojump_script

# =============================================================================
# General aliases
# =============================================================================

alias c="cursor"
alias p="pnpm"
alias zshconfig="c ~/.zshrc"
alias src="source ~/.zshrc"

# =============================================================================
# Git aliases
# =============================================================================

alias gs="git status"
alias gf="git fetch"
alias ga="git add"
alias gaa="git add --all"
alias gd="git diff -w"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbr="git branch"
alias gci="echo 🎯 && git commit"
alias gcp="git cherry-pick"
alias grh="git reset HEAD"
alias gstash="echo 💃 && git stash -q --keep-index"
alias gpoop="echo 💩 && git stash pop -q"

# Rebase: origin/master (legacy) and origin/main
alias grm="git rebase origin/master"
alias grmain="git rebase origin/main"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grs="git rebase --skip"

# =============================================================================
# Git helpers (optional / project-specific)
# =============================================================================

alias wip="gaa && gci -n -m 'wip'"

# =============================================================================
# Git functions
# =============================================================================

function push {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD)
  if [[ "$1" == "-f" ]]; then
    echo "$ 💀  git push origin $branch --force-with-lease 💀"
    git push origin "$branch" --force-with-lease
  else
    echo "$ 🍻  git push origin $branch 🍻"
    git push origin "$branch"
  fi
}

# gco <branch>: cd into the branch's worktree if it has one, else git checkout
unalias gco 2>/dev/null
function gco {
  if [[ $# -eq 1 && "$1" != -* ]]; then
    local wt
    wt=$(git worktree list --porcelain 2>/dev/null | awk -v ref="refs/heads/$1" '
      /^worktree / { path = substr($0, 10) }
      $0 == "branch " ref { print path; exit }')
    if [[ -n "$wt" ]]; then
      echo "$ 🌳 cd $wt"
      cd "$wt"
      return
    fi
  fi
  git checkout "$@"
}

function pull {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD)
  echo "$ git pull origin $branch --rebase"
  git pull --rebase origin "$branch"
}

# =============================================================================
# Path
# =============================================================================

export PATH="$HOME/.local/bin:$PATH"
