#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# to enable changes restart your terminal emulator and come back.
# if you are using ssh or a tty then type exit and log back in

# common settings for all shells
source ~/.shell/*


## STARTX IN TTY1 ##
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then startx; fi


## XTERM COLOR FIX ##
[ $TERM = xterm ] && TERM=xterm-256color


## ENABLE COLORS ##
autoload -U colors && colors


## PROMPT ##
setopt PROMPT_SUBST

ssh_check () { [ -z $SSH_TTY ] && echo "" || echo "($(cat /proc/sys/kernel/hostname)) " }

get_pwd () { echo "$(~/.shell/shortpath)" }

git_branch () { echo "$(~/.shell/gitbranch)" }

# set prompt
PS1="%F{yellow}\$(ssh_check)%f%F{cyan}\$(get_pwd)%f%F{yellow}\$(git_branch)%f %F{magenta}$%f "


## DYNAMIC WINDOW TITLE ##
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


## HISTORY ##
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


## PLUGINS ##
# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=red'
