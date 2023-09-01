#keep at top
set -o vi
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

#If the CDPATH is set, the "cd" command starts finding the directory in the list of directories present in the CDPATH variable and then makes the directory switch appropriately.

# this mark function isn't working in zsh
#export CDPATH=".:~/.marks/:/Users/eric/src"
## .marks is for mark function
##function mark { ln -sr "$(pwd)" ~/.marks/"$1"; }
#function mark {
#  target_path="$(pwd)"
#  mark_path="${HOME}/.marks/$1"
#
#  # Create the .marks directory if it doesn't exist
#  mkdir -p "${HOME}/.marks"
#
#  # Create a relative symlink
#  if [[ "$OSTYPE" == "darwin"* ]]; then
#    # macOS
#    rel_target="$(python -c "import os.path; print(os.path.relpath('${tar#get_path}', os.path.dirname('${mark_path}')))")"
#  else
#    # Linux
#    rel_target="$(realpath --relative-to="$(dirname "$mark_path")" "$targ#et_path")"
#  fi
#
#  ln -s "$rel_target" "$mark_path"
#}



# custom key binds
bindkey '^R' history-incremental-search-backward
bindkey '^N' history-incremental-search-forward
bindkey '^k' clear-screen


load_bws() {
	pass=$(security find-generic-password -s 'bitwarden' -w)
	export BWS_ACCESS_TOKEN="$pass"
}

unload_bws() {
	unset BWS_ACCESS_TOKEN
}

load_notion_key() {
  key=$($HOME/bin/bws secret get 7909c25f-f3d3-44ea-8b86-aff8010d5ce9 -o tsv | tail -n 1 | awk '{print $3}')
  export NOTION_API_TOKEN="$key"
}

unload_notion_key() {
  unset NOTION_API_TOKEN
}

load_cgpt_key() {
	pass=$(security find-generic-password -s 'ChatGPT' -w)
	export CGPT_ACCESS_TOKEN="$pass"
}
unload_cgpt_key() {
	unset CGPT_ACCESS_TOKEN
}

load_gh_key() {
  pass=$(security find-generic-password -s 'github' -w)
  export GITHUB_ACCESS_TOKEN="$pass"
}

unload_gh_key() {
  unset GITHUB_ACCESS_TOKEN
}

load_cf_key() {
  pass=$($HOME/bin/bws secret get c912c706-c8a3-4928-afa3-b064003857f6 -o tsv | tail -n 1 | awk '{print $3}' )
  export CF_ACCESS_TOKEN="$pass"
}
unload_cf_key() {
  unset CF_ACCESS_TOKEN
}

load_fn_key() {
  pass=$($HOME/bin/bws secret get d16db1df-6bcf-4f90-a341-b0640187c855  -o tsv | tail -n 1 | awk '{print $3}')
  export FN_ENC_KEY="$pass"
}

unload_fn_key() {
  unset FN_ENC_KEY
}


cdtmp() {
  cd $(mktemp -d)
}

alias s='cd ..'

# move to aliases file and merege with linux/bash aliases
alias lb='load_bws'
alias ub='unload_bws'
alias nk='load_notion_key'
alias unk='unload_notion_key'
alias lc='load_cgpt_key'
alias uc='unload_cgpt_key'
alias lg='load_gh_key'
alias ug='unload_gh_key'
alias lcf='load_cf_key'
alias ucf='unload_cf_key'
alias lfnk='load_fn_key'
alias ufnk='unload_fn_key'
alias vim='nvim'
alias grep='rg'
alias python='python3'

key_init() {
	lb
	nk
	lc
  lg
  lcf
  lfnk
}

export CPGPT_ORGID=”org-mXtmTz67aAt9GTfmXaQZ72Dp”

export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/"
export PROMPT
