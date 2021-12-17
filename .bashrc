# change prompt
PS1="\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]bash.\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;13m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# History in cache .sh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTFILE=~/.history

# default browsers
export BROWSER="/usr/local/bin/librewolf"
export PWBROWSER="/usr/local/bin/librewolf --private-window"
export ALTBROWSER="/usr/bin/chromium"
export ALTPWBROWSER="/usr/bin/chromium --incognito"

# startx automatically
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

# path
export PATH=$PATH:/home/ethan/.local/bin/

# aliases
alias hg='history | grep'
#sudo() { /usr/bin/su -c "$*" ;}
sudo() { doas -- "$@" ;}
