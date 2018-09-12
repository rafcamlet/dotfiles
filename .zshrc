# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


setopt RM_STAR_WAIT

export VISUAL=nvim
export EDITOR="$VISUAL"

function amend {
  git add .
  git commit --amend
}

function commit {
  git add .
  git commit --verbose
}

function gho {
  url=$(git config --get remote.origin.url | sed -nr 's/.*:(.*).git.*/\1/p')

  if [ -z "$1" ]; then
    branch=$(git rev-parse --abbrev-ref HEAD)
    xdg-open "https://github.com/$url/compare/$branch?expand=1" &>/dev/null
  else
    xdg-open "https://github.com/$url/commit/$1" &>/dev/null
  fi
}

function grm {
  git diff-index --quiet HEAD --

  if ! [[ $? -eq 0 ]]; then
    echo 'You have changes!'; return 1
  fi

  git co master
  git fetch
  git reset --hard origin/master
}

function fco {
  git checkout $(git branch --sort=-committerdate | grep -v HEAD | fzf )
}

function show {
  LESSOPEN="| pygmentize %s" LESS=' -RN' less "$@"
}

alias top=/usr/bin/top

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$HOME/bin

export GOBIN=$HOME/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

unset rvm_bin_path
unset rvm_prefix
unset rvm_version
unset rvm_path

[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"

# source ~/.zplug/init.zsh

# # zplug "b4b4r07/enhancd", use:init.sh

# zplug load

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias lc='colorls -r --sd'
alias gdn='git diff --name-only '

alias v='vifm' # vi file manager

eval "$(direnv hook zsh)"
