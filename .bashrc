if [ -f $HOME/.bash_profile ]
    then
        source $HOME/.bash_profile
fi

shopt -s cdspell
#set -o ignoreeof


export PATH=$PATH:/home/eric/bin

source '/home/eric/lib/azure-cli/az.completion'
