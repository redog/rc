#keep at top
set -o vi
# my functions
source ~/.dotfiles/functions.sh
source ~/.dotfiles/aliases.sh
#keep at top

PROMPT='%F{green}%D{%I:%M %p}
%F{red}(%(4~|.../%3~|%~))%F{green}[%m]
%F{bold}%F{white}} %n {
%F{cyan}$ '

#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# custom key binds
bindkey '^R' history-incremental-search-backward
bindkey '^N' history-incremental-search-forward
# because I like l and k ?
bindkey '^k' clear-screen


#export CLICOLOR=1
#export TERM=xterm-256color

#ansible has issues
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export CPGPT_ORGID=”org-mXtmTz67aAt9GTfmXaQZ72Dp”

export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/"
export PROMPT

