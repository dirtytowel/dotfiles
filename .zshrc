#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# to enable changes restart your terminal emulator and come back.
# if you are using ssh or a tty then type exit and log back in
setopt PROMPT_SUBST

# common
source ~/.shell/*
  # History
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTFILE=~/.history

  # autostart startx in tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startx; fi

  # SSH check
ssh_check () {
  [ -z $SSH_TTY ] && echo "" || echo "($(cat /proc/sys/kernel/hostname)) "
}

  # shortpath
get_pwd () {
  echo $(~/.shell/shortpath)
}

  # xterm color fix
[ $TERM = xterm ] && TERM=xterm-256color

# Enable colors
autoload -U colors && colors

# Prompt
PS1="%F{yellow}\$(ssh_check)%f%F{cyan}\$(get_pwd)%f %F{magenta}$%f "

# Dynamic window title
local dwt () {
    case $TERM in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
      precmd  () { print -Pn "\e]0;\$(ssh_check)zsh %~\a" }
      preexec () { print -Pn "\e]0;\$(ssh_check)$1\a" }
    esac
}

if [ -z $(ssh_check) ]; then
  [ $(xdotool getactivewindow getwindowname) != "spterm" ] \
    && dwt || precmd(){ print -n "\033]0;spterm\007" }
else
  dwt
fi

# ensure tdrop knows when scratchpad is closed
# might not be needed
#if [[ $TERM = "rxvt-unicode" ]]; then trap 'tdrop --clear urxvt' EXIT; fi

# History:
alias history='history 1'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# plugins

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=red'

source ~/.zsh/git.plugin.zsh

