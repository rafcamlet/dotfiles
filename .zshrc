# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="3den"
ZSH_THEME="my"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


#----------PLUGINS----------
plugins=(
  git
  zsh-syntax-highlighting
  ruby
  rails
  common-aliases
  # vi-mode
  vundle
  bower
  nvm
  npm
  rvm
  grunt
  tmux
)

# USER CONFIGURATION

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt interactivecomments
setopt CORRECT
setopt AUTO_CD

export NVM_DIR="/home/r/.nvm"

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export LC_ALL=en_US.UTF-8

# make sure that if a program wants you to edit
# text, that Vim is going to be there for you
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

alias tmux="TERM=screen-256color-bce tmux"
alias -g gp="| grep -iP --color -e"

# # Vim keys
# bindkey -v
# bindkey -M viins 'jk' vi-cmd-mode
# bindkey '^r' history-incremental-search-backward
# bindkey -M vicmd '/' history-incremental-search-backward
# bindkey -sM vicmd 'diw' 'bde'
# bindkey -sM vicmd 'ciw' 'bdei'

film(){
 qnapi -c $1 && vlc $1
}

commit() {
 git add . -A && git commit && git status
}

amend() {
  git add . -A && git commit --amend && git status
}

mrebase() {
 git co master && git pull --rebase origin master && git status
}

fbp!() {
# feature branch force push
NAME=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
REPO=$(git config --get remote.origin.url | sed -e 's#git@github.com:\(.*\)\.git#\1#')

if [ "$NAME" == "master" ]; then
  echo "Its a MASTER!!!" && return
fi
echo "Pushing $NAME to repo..."
git push -f origin $NAME
notify-send --urgency=low -i "terminal" "Git - $NAME" "Was pushed to repo"
echo "Create PR https://github.com/$REPO/compare/$NAME"
}

send() {
  str=$@
  tmux send-keys -t 1 "$str" c-m
}

user-notify() {
  notify-send --urgency=low -i "terminal" "Your task end!" "$1"
}

tes() {
  cmds="$@"
  eval $cmds
  notify-send --urgency=low -i "terminal" "Your task end!" "$cmds"
}

f() {
  if [ -z "$2" ]
  then
    ls -tr | grep -iP --color -e $1 | tail -n 20
  else
    cd "$( ls -tr | grep -iP --color -e $1 | tail -n $2 | head -n 1 )"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###-tns-completion-start-###
if [ -f /home/r/.tnsrc ]; then 
    source /home/r/.tnsrc 
fi
###-tns-completion-end-###
