PAGER="/usr/bin/less -qsRCM"
EDITOR="vim"
HISTIGNORE="&:ls:[bf]g:exit"
HISTSIZE=10000
HISTCONTROL=erasedups
WHO=`/usr/bin/whoami`
BROWSER='google-chrome-stable'

set -o vi
shopt -s cmdhist
shopt -s histappend
shopt -s histreedit

##################
##  MY ALIASES  ##
##################
if [[ -f ${HOME}/.aliases ]]
    then
    source ~/.aliases
fi
#########################
##  END OF MY ALIASES  ##
#########################
# Color man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

################
# terminal title
################
case ${TERM} in
 xterm*|rxvt|Eterm|eterm)
    if [[ ${WHO} != 'root' ]]
    then
      PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';
#     PROMPT_COMMAND='$(which $TERM)&'
    elif [[ ${WHO} == 'root' ]]
    then
#     PROMPT_COMMAND='$(which $TERM)&'
      PROMPT_COMMAND='echo -ne "\033]0;----***---ROOT---***----@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';
    fi
  ;;
 screen)
 if [[ ${WHO} != 'root' ]]
 then
    PROMPT_COMMAND='echo -ne "\033]0;-----SCREEN______-\033\\"';
#     PROMPT_COMMAND='$(which $TERM)&'
 elif [[ ${WHO} == 'root' ]]
 then
#     PROMPT_COMMAND='$(which $TERM)&'
    PROMPT_COMMAND='echo -ne "\033]0;----***---ROOT---***----@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"';
 fi
 ;;
 rxvt-unicode-256color)
    TERM=xterm
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';
    ;;
esac

MUTT=$HOME/.mutt
PYTHONSTARTUP="/${HOME}/.pythonrc.py"

export WHO TERM EDITOR TERM PAGER MUTT BROWSER PYTHONSTARTUP

