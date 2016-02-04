###################
##  MY DEFAULTS  ##
################### 
#set -o ignoreeof
xset -b
set -o vi
set -o notify
set -o noclobber
set -o physical
# why turn it off?
#set +o histexpand
shopt -s mailwarn
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend
shopt -s lithist
shopt -s histreedit

#eric@tonychachere.com
export EC2_HOME="/usr"
export EC2_CERT="~/.certs/ec2-tonychachere-cert.pem"
export EC2_PRIVATE_KEY="~/.certs/ec2-tonychachere-pk.pem"

EBEEP_IGNORE="IHATEBEEPS"
BROWSER='google-chrome-stable'
EDITOR="vim"
OS=`/bin/uname`
SHELL='/bin/bash'
WHO=`/usr/bin/whoami`
PTS=`tty | sed 's/\/dev\///'`
SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# do not add ls, bg, fg, exit to history
HISTIGNORE="&:exit:?:??"
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL=erasedups
HOSTNAME=$(/bin/hostname)        # don't want to keep checking for hostname
WHERE=`tty | sed -n -e  "s#/dev/##p"`
#LESSOPEN="|lesspipe.sh %s"
LESS="-isMR --shift 5"
PYTHONSTARTUP="${HOME}/.pythonrc.py"
PYTHONPATH="${PYTHONPATH}:/${HOME}/bin"
DISTCC_DIR="/var/tmp/portage/.distcc"
CONFIG_PROTECT_MASK='/etc/init.d'
#DISPLAY="`w | gawk -v x=$WHERE '{ if ( $2==x ) print $3 }'`:0"
XENVIORNMENT="${HOME}/.Xresources"
MUTT=$HOME/.mutt
IGNOREEOF="2"

export HISTSIZE WHO SHELL OS EDITOR PAGER WHERE LESSOPEN HOSTNAME PYTHONSTARTUP PYTHONPATH EBEEP_IGNORE CONFIG_PROTECT_MASK HISTIGNORE HISTCONTROL TERM MUTT IGNOREEOF XENVIORNMENT SSH_AUTH_SOCK
#export DISPLAY

export MANPATH=${MANPATH}:\
/usr/man:\
/opt/man:\

export LD_LIBRARY_PATH=/usr/lib:\
${HOME}/lib:\
/opt/lib:\
/usr/local/lib:\
/usr/share/lib

export PATH=/usr/lib/ccache/bin:\
/usr/lib/distcc/bin:\
~/bin:\
/bin:\
/usr/bin:\
/opt/bin:\
/sbin:\
/usr/sbin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/games/bin:${PATH}

export GOPATH="${HOME}/go"

##########
# COLORS #
##########
#Color ls setup.
eval `dircolors -b`
#eval `dircolors -b $HOME/.dir_colors 2>/dev/null`

#################
# END OF COLORS #
#################

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

#####################################
## Why did gentoo fuck up inputrc? ##
#####################################
INPUTRC="${HOME}/.inputrc"
export INPUTRC
#########################
##  END GENTOO FUCK UP ##
#########################
NEWROOT=""
# powerpc-unknown-linux-gnu
# i686-pc-linux-gnu etc etc
MACHTYPE="${MACHTYPE?:MACHTYPE NOT SET}"

#####################
# My Kickass Prompt #
#####################
# Am I root? Set prompt accordingly.
#       # If me define prompt
#		# If I'm root make my prompt red:

if [[ ${WHO} != 'root' ]]
then
	          PS1='\[[32m\]\D{%r}
\[[01;31m\]($PWD)\[[00;32m\][$HOSTNAME]
\[[01m[39m\]} \u {
\[[00m[36m\]$' 
	   	elif [[ ${WHO} == 'root' ]]
		then 
			export PS1='\[[01m[31m\]$SHLVL:} $WHO\[[00m[39m\]@\[[32m\]$HOSTNAME
\[[01m[39m\]$PWD
\[[31m\]#\[[00m[36m\]'
		fi
################
#  End Prompt  #
################

################
# terminal title
################
case ${TERM} in 
 xterm*|rxvt|Eterm|eterm)
	if [[ ${WHO} != 'root' ]]
	then
	  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';
#	  PROMPT_COMMAND='$(which $TERM)&'
	elif [[ ${WHO} == 'root' ]]
	then
#	  PROMPT_COMMAND='$(which $TERM)&'
	  PROMPT_COMMAND='echo -ne "\033]0;----***---ROOT---***----@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';
	fi
  ;;
 screen)
 if [[ ${WHO} != 'root' ]]
 then
	PROMPT_COMMAND='echo -ne "\033]0;-----SCREEN______-\033\\"';
#	  PROMPT_COMMAND='$(which $TERM)&'
 elif [[ ${WHO} == 'root' ]]
 then
#	  PROMPT_COMMAND='$(which $TERM)&'
	PROMPT_COMMAND='echo -ne "\033]0;----***---ROOT---***----@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"';
 fi
 ;;
 rxvt-unicode-256color)
	TERM=xterm-256color
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';
	;;
esac

#################
# Other Stuff   #
#################
export LIBGUESTFS_PATH="/usr/share/guestfs/appliance/"
export VMWARE_USE_SHIPPED_GTK="force"
#never creates core files larger than 0 bytes
ulimit -c 0

#all files created appear as rwxr-xr-x 0666  &  ~022  = 0644 = rw-r--r-
umask 022
#  enable bash to provide context sensitive tab completion for gst-launch
complete -C gst-complete gst-launch

function vd() {
	vim - -c ":vnew $1 | windo diffthis"
}

function rmpyc() {
	rm *.pyc;
	}

function color_index() {
  # Show an index of all available bash colors
  echo -e "\n              Usage: \\\033[*;**(;**)m"
  echo -e   "            Default: \\\033[0m"
  local blank_line="\033[0m\n     \033[0;30;40m$(printf "%41s")\033[0m"
  echo -e "$blank_line" # Top border
  for STYLE in 2 0 1 4 9; do
    echo -en "     \033[0;30;40m "
    # Display black fg on white bg
    echo -en "\033[${STYLE};30;47m${STYLE};30\033[0;30;40m "
    for FG in $(seq 31 37); do
        CTRL="\033[${STYLE};${FG};40m"
        echo -en "${CTRL}"
        echo -en "${STYLE};${FG}\033[0;30;40m "
    done
    echo -e "$blank_line" # Separators
  done
  echo -en "     \033[0;30;40m "
  # Background colors
  echo -en "\033[0;37;40m*;40\033[0;30;40m \033[0m" # Display white fg on black bg
  for BG in $(seq 41 47); do
      CTRL="\033[0;30;${BG}m"
      echo -en "${CTRL}"
      echo -en "*;${BG}\033[0;30;40m "
  done
  echo -e "$blank_line" "\n" # Bottom border
}

################
# tor/proxy    #
# Yes fuck you #
#
#ttp_proxy=http://127.0.0.1:8118/
#TTP_PROXY=$http_proxy
#xport http_proxy HTTP_PROXY

################
#     IRC      #
################
IRCUSER='REdOG'
#IRCHOST=What
IRCNAME=RTFM
IRCSERVER=irc.freenode.net
IRCFINGER=poke
export IRCUSER IRCHOST IRCNAME IRCSERVER IRCFINGER
######################
# End of Other Stuff #
######################
#trap '[[ -r $HOME/.bash_logout ]] && . $HOME/.logout' 0 1 3 15

#these are hillarious to use 4/1
#trap '[[ -r $(which $TERM) ]] && . $($(which $TERM))' 0 1 3 15
