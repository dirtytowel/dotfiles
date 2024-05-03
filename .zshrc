#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# to enable changes restart your terminal emulator or run "source ~/.zshrc"

source ~/.shell/aliasrc
source ~/.shell/commonrc

setopt PROMPT_SUBST


## PROMPT ##
# I am sure there is a way to just source these instead of doing it this way
get_pwd () {
  echo "$(~/.shell/shortpath)"
}

# set prompt
PS1="%F{yellow}\$(ssh_check)%f\
%F{cyan}\$(get_pwd)%f\
%F{yellow}\$(git_branch)%f \
%F{magenta}$%f "


## ZSH SPECIFIC ##
# enable colors
autoload -U colors && colors

# show all history instead of 
alias history='history 1'

# tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# dynamic window title
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


## VIM BACKSPACE FIX ##
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

## PLUGINS ##
# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=red'
