#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# to enable changes restart your terminal emulator and come back.
# if you are using ssh or a tty then type exit and log back in

source ~/.shell/*

# Enable colors
autoload -U colors && colors

setopt PROMPT_SUBST

# shortpath
get_pth () {
  echo $(~/.shell/shortpath)
}

ssh_check () {
  [ -z $SSH_TTY ] && echo "" || echo "($(cat /proc/sys/kernel/hostname)) "
}

PS1="%F{yellow}\$(ssh_check)%f%F{cyan}\$(get_pth)%f %F{magenta}$%f "

# Dynamic window title

if [ $(xdotool getactivewindow getwindowname) != "spterm" ]; then
  case $TERM in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    precmd () {
      print -Pn "\e]0;\$(ssh_check)zsh %~\a"
    }
    preexec () {
      print -Pn "\e]0;\$(ssh_check)$1\a"
    }
  esac
fi

#ensure tdrop knows when scratchpad is closed
#if [[ $TERM = "rxvt-unicode" ]]; then trap 'tdrop --clear urxvt' EXIT; fi

# History:
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTFILE=~/.history
alias history='history 1'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# startx in tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startx; fi

# path
export PATH=$PATH:/home/ethan/.local/bin/

# plugins

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=red'

source ~/.zsh/git.plugin.zsh

