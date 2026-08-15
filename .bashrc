#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|
#
# to enable changes restart your terminal emulator or run "source ~/.bashrc"

source ~/.shellrc

# set prompt
PS1="\[\033[38;5;11m\]\$(ssh_check)\[$(tput sgr0)\]\
\[\033[38;5;14m\]\$(get_pwd)\[$(tput sgr0)\]\
\[\033[38;5;11m\]\$(git_branch) \[$(tput sgr0)\]\
\[$(tput sgr0)\]\[\033[38;5;13m\]\\$ \[$(tput sgr0)\]"
