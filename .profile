# ~/.profile: executed by the command interpreter for login shells. This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists. see /usr/share/doc/bash/examples/startup-files for 
# examples. the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask for ssh logins, install and configure the libpam-umask package. umask 022


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

setxkbmap pl
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add control = Control_L"
xmodmap -e "keycode 94 = Shift_L"
xmodmap -e "keycode 91 = period period"
xset r rate 200 40

source "$HOME/.cargo/env"
