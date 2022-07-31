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

alias ls='exa --icons '
alias lt='exa -s modified -l '

# vim keys {{{
bindkey -v
export KEYTIMEOUT=10

autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# bindkey "^K" kill-line
# bindkey "^L" clear-screen
# bindkey "^R" history-incremental-search-backward
# bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
# bindkey "^Y" yank

bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
bindkey kj vi-cmd-mode
bindkey "kj" vi-cmd-mode
bindkey -M viins "kj" vi-cmd-mode
# }}}

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

function killpuma {
  pkill -9 -f puma
}

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
# export FZF_DEFAULT_OPTS='--reverse --height 75% --multi --bind ctrl-f:page-down,ctrl-b:page-up'
# export FZF_DEFAULT_COMMAND='fd --hidden --exclude ".git" .';
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND='fd --type d . --color=never'
# export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
# }}}

export BAT_THEME=Nord

WORDCHARS='*?_-[]~&;!#$%^(){}<>'


# fasd {{{

# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# # alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i' # cd with interactive selection
# # }}}

alias v='COLORTERM=tmux-256color vifm -c "vsplit"' # vi file manager
alias man='vimman'

eval "$(direnv hook zsh)"

[ -f "$HOME/.local/share/lscolors.sh" ] && source $HOME/.local/share/lscolors.sh

# asdf {{{
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
# }}}

# fzf-tab {{{
# https://github.com/Aloxaf/fzf-tab/issues/24
zstyle -d ':completion:*' format
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# }}}

command -v zoxide &> /dev/null && eval "$(zoxide init zsh)"

[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
