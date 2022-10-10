#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#
# to enable changes restart your terminal emulator and come back.
# if you are using ssh or a tty then type exit and log back in

source ~/.shell/*

# change prompt

get_pwd () {
  echo $(~/.shell/shortpath)
}

#source ~/prompt
PS1="\[\033[38;5;14m\]\$(get_pwd)\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;13m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# History:
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTFILE=~/.history

# startx automatically
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

# path
export PATH=$PATH:/home/ethan/.local/bin/

