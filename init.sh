#!/bin/bash

function red {
  printf "\033[0;31m$1\033[0m\n"
}

function green {
  printf "\033[0;32m$1\033[0m\n"
}

function link {
  src=$(pwd)/$1
  dest=/home/$(whoami)/$1

  if [[ -e $dest ]]; then
    red "file $1 already exists!"
  else
    ln -s $src $dest && green "file $1 linked" || red "file $1 not linked"
  fi
}

echo 'Start linking files'
link '.gitconfig'
link '.newsboat'
link '.taskrc'
