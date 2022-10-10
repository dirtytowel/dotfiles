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

# Prompt
#PS1="[%F{yellow}%n%f%F{yellow}@%f%F{yellow}%m%f %F{cyan}%~%f]%F{magenta}$%f "
setopt PROMPT_SUBST

#git prompt
export PATH=$PATH:$HOME/git/git-radar

#path
get_pth () {
  echo $(~/.shell/shortpath)
}


#PS1="[%F{yellow}%n%f%F{yellow}@%f%F{yellow}%m%f %F{cyan}\$(get_pth)%f]%F{magenta}$%f "
PS1="%F{cyan}\$(get_pth)%f %F{magenta}$%f "

# Dynamic window title
case $TERM in
  rxvt-unicode-256color|(dt|k|E)term)
    precmd () { print -Pn "\e]0;urxvt %~\a" }
    preexec () { print -Pn "\e]0;$1\a" }
esac

if [[ $TERM = "rxvt-unicode" ]]; then trap 'tdrop --clear urxvt' EXIT; fi

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

