# vim:fdm=marker:fdl=0

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

setopt RM_STAR_WAIT

# alias expansion {{{
# http://www.math.cmu.edu/~gautam/sj/blog/20140625-zsh-expand-alias.html
typeset -a ealiases
ealiases=()

function ealias() {
  alias $1
  ealiases+=(${1%%\=*})
}

function egalias() {
  alias -g $1
  ealiases+=(${1%%\=*})
}

function expand-ealias() {
  arr=$( IFS='|'; echo "${ealiases[*]}" )
  if [[ $LBUFFER =~ "($arr)\$" ]]; then
    zle _expand_alias
    zle expand-word
  fi
  zle self-insert
}

zle -N expand-ealias

bindkey " "        expand-ealias
bindkey "^[[Z"     magic-space     # control-space to bypass completion
bindkey -M isearch " "      magic-space     # normal space during searches
# }}}

egalias G='| grep -Pi'
ealias gs='git status'
ealias gdn='git diff --name-only '
alias mv="mv -v"
alias cp="cp -v"
alias mkdir="cp -vp"

export VISUAL=nvim
export EDITOR="$VISUAL"
export GOBIN=$HOME/go/bin

PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$GOBIN
PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.luarocks/bin

# Functions -> {{{

function vimman {
  if $(command man $1 &> /dev/null); then
    nvim -c "Man $1 $2" -c 'silent only'
  else
    echo 'No man page'
  fi
}

function amend {
  git add .
  git commit --amend
}

function commit {
  git add .
  git commit
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

function ff {
  command fd -p "${PWD}.*$1" ${@:2}
}

# }}}

# nnn exit function {{{
export NNN_TMPFILE="/tmp/nnn"
function n {
  nnn "$@"
  if [ -f $NNN_TMPFILE ]; then
    . $NNN_TMPFILE
    rm -f $NNN_TMPFILE
  fi
} # }}}

# fff exit function and settings {{{
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

export FFF_FAV9=~/projects
#}}}

# FZF options {{{
export FZF_DEFAULT_OPTS='
  --reverse
  --height 75% --multi
  --bind ctrl-f:page-down,ctrl-b:page-up
'
export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git" .';
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
# }}}

export BAT_THEME=Nord

WORDCHARS='*?_-[]~&;!#$%^(){}<>'

# NVM {{{
if [[ "$USER" == "r" ]]; then
  # NVM drastically increas startup time. Move to function.

  start_nvm(){
    unalias nvm node npm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  }

  if [ -s "$HOME/.nvm/nvm.sh" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
    alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
    alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
  fi
fi
# }}}

# source ~/.zplug/init.zsh
# # zplug "b4b4r07/enhancd", use:init.sh
# zplug load


# fasd {{{

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
# }}}

alias v='COLORTERM=tmux-256color vifm -c "vsplit"' # vi file manager
alias man='vimman'

eval "$(direnv hook zsh)"

# heroku autocomplete setup {{{
HEROKU_AC_ZSH_SETUP_PATH=/home/r2d2/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
# }}}

. "$HOME/.local/share/lscolors.sh"

# asdf & rvm {{{
if [[ "$USER" == "r" ]]; then
  unset rvm_bin_path
  unset rvm_prefix
  unset rvm_version
  unset rvm_path

  [ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
else
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
