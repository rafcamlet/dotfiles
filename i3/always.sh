#!/bin/bash

[ -f ~/.custom.sh ] && source ~/.custom.sh

killall polybar
polybar  my &>/dev/null &
