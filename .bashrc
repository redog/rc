if [ -f $HOME/.bash_profile ]
    then
        source $HOME/.bash_profile
fi

shopt -s cdspell
#set -o ignoreeof


export PATH=$PATH:$HOME/bin

source "${HOME}/lib/azure-cli/az.completion"
