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

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


#If the CDPATH is set, the "cd" command starts finding the directory in the list of directories present in the CDPATH variable and then makes the directory switch appropriately.

# this mark function isn't working in zsh im not sure why yet...todo: fixme(chatgpt help)
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
# because I like l and k ?
bindkey '^k' clear-screen


# helper functinos
nvc() {
  cd .config/nvim/lua/custom/
}

check_git_status() {
  for dir in $HOME/src/*; do
    if [ -d "$dir" ]; then
      if [ -d "$dir/.git" ]; then
        git_status=$(git -C "$dir" status -s)
        if [ ! -z "$git_status" ]; then
          echo "\033[1;34m--------------------------------------------------\033[0m"
          echo "\033[1;32m📂 Checking git status in $dir...\033[0m"
          echo "\033[1;34m--------------------------------------------------\033[0m"
          echo "$git_status"
          echo "\033[1;34m--------------------------------------------------\033[0m"
          echo ""
        fi
      fi
    fi
  done
}

update_rc_files() {
  # work in progress needs some polish
  local verbose=false
  while getopts "v" opt; do
     case $opt in
      v) verbose=true ;;
      *) echo "Invalid option: -$opt"; return 1 ;;
    esac
  done
  # Save the current working directory
  local lwd
  lwd=$(pwd)
  # rc git repo
  cd ${HOME}/.dotfiles
  # Pull the latest changes
  if $verbose; then
    git pull origin master
  else
    git pull origin master > /dev/null 2>&1 || echo "⚠️  Pull failed. Please resolve manually."
  fi

  # If the custom rc file list exists, read it into the array
  if [[ -f "$HOME/my.git.rc" ]]; then
    mapfile -t rc_files < "$HOME/my.git.rc"
  else
    # Only add files that already exist in the repository
    rc_files=($(git ls-files))
  fi

  # Loop through each file and copy it from the home directory to the repo
  for file in "${rc_files[@]}"; do
    if $verbose; then
      cp -v "$HOME/$file" "$HOME/.dotfiles/$file"
    else
      cp "$HOME/$file" "$HOME/.dotfiles/$file" 2>/dev/null
    fi
  done

  # Add all the files to the git repository
  git add .

  if git diff-index --quiet HEAD --; then
    echo "No changes to commit."
  else
  # Commit the changes
    if $verbose; then
      git commit -m "Update rc files"
    else
      git commit -m "Update rc files" > /dev/null 2>&1 || echo "⚠️  Commit failed. Please resolve manually."
    fi
  fi

  # List affected files and ask for confirmation:
  echo "Affected files:"
  echo
  git diff --name-only HEAD~1
  echo "Are you sure you want to push these changes? [y/N]: "
  read -r  confirm

  # Push the changes if yes
  if [[ $confirm =~ ^[Yy]$ || $confirm == [yY][eE][sS] ]]; then
    if $verbose; then
      git push origin master
    else
      git push origin master > /dev/null 2>&1 || echo "⚠️  Push failed. Please resolve manually."
    fi
  else
    echo "Aborting - push canceled - erasing changes in rc"
    git reset --hard HEAD~1
    cd "$lwd"
    return
  fi
cd "$lwd"
}

# key functions
load_bws() {
	pass=$(security find-generic-password -s 'bitwarden' -w)
	export BWS_ACCESS_TOKEN="$pass"
  proj=$($HOME/bin/bws project list -o tsv | tail -n 1 | awk '{print $1}' )
  export BWS_PROJECT_ID="$proj"
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
  #fernet encruption key I used once...
  pass=$($HOME/bin/bws secret get d16db1df-6bcf-4f90-a341-b0640187c855  -o tsv | tail -n 1 | awk '{print $3}')
  export FN_ENC_KEY="$pass"
}

unload_fn_key() {
  unset FN_ENC_KEY
}

load_vault_pass() {
  pass=$($HOME/bin/bws secret get 42e1e10a-8ea9-427c-9c9e-b070013edb70 -o tsv | tail -n 1 | awk '{print $3}')
  export VAULT_PASSWORD="$pass"
}

unload_vault_pass() {
  unset VAULT_PASSWORD
}

cdtmp() {
  cd $(mktemp -d)
}


alias s='cd ..'
alias urc='update_rc_files'
alias gits='check_git_status'
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
alias lvp='load_vault_pass'
alias uvp='unload_vault_pass'
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
  lvp
}

export CPGPT_ORGID=”org-mXtmTz67aAt9GTfmXaQZ72Dp”

export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/"
export PROMPT

#function create_and_activate_venv() {
# init venv
function iv() {
  # Get the name of the venv to create, or default to "venv".
  venv_name=${1:-venv}

  # Check if the venv already exists.
  if [[ -d "$venv_name" ]]; then
    echo "The venv '$venv_name' already exists, skipping creation."
  else
    echo "Creating the venv '$venv_name'."
    python3 -m venv "$venv_name"
  fi

  # Activate the venv.
  source "$venv_name/bin/activate"

  echo "The venv '$venv_name' is now active."
}
