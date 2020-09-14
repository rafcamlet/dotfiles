#!/bin/bash

killall polybar

if [[ $USER == 'r2d2' ]]; then
  MONITOR=eDP-1 polybar my &>/dev/null &
else
  polybar  my &>/dev/null &
fi
