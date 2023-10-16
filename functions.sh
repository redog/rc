if [[ $SHELL == *"zsh"* ]]; then
  # Zsh-specific code
elif [[ $SHELL == *"bash"* ]]; then
  # Bash-specific code
fi

# list my functions
lsf() {
  if [[ $SHELL == *"zsh"* ]]; then
    echo -e "\033[1;4;32mFunctions:\033[0m"
    print -l ${(ok)functions} | awk '{printf "\033[1;93m%s\033[0m\n", $0}' | sort | column -c 80
  elif [[ $SHELL == *"bash"* ]]; then
    echo -e "\033[1;4;32mFunctions:\033[0m"
    declare -F | awk '{print $3}' | awk '{printf "\033[1;93m%-20s\033[0m\n", $0}' | sort | column -c 80
  fi
}


# list my aliases
lsa() {
  if [[ $SHELL == *"zsh"* ]]; then
    echo -e "\033[1;4;32mAliases:\033[0m"
    alias | awk -F "=" '{printf "\033[1;37m" $1 " (" "\033[0;93m" substr($0, index($0,$2)) "\033[0m" ")" "\n"}' | sort | column -c 80
  elif [[ $SHELL == *"bash"* ]]; then
    echo -e "\033[1;4;32mAliases:\033[0m"
    alias | awk -F "=" '{gsub(/^alias /, ""); printf "\033[1;37m%s (" "\033[0;93m%s" "\033[0m" ")\n", $1, substr($0, index($0, $2))}' | sort | column -c 80
  fi
}

# helper functinos
nvc() {
  cd .config/nvim/lua/custom/
}

#pull_all_repos() {
#  for dir in $HOME/src/*; do
#    if [ -d "$dir" ]; then
#      if [ -d "$dir/.git" ]; then
#        echo "\033[1;34m--------------------------------------------------\033[0m"
#        echo "\033[1;32m📂 Pulling $dir...\033[0m"
#        echo "\033[1;34m--------------------------------------------------\033[0m"
#        git -C "$dir" pull
#        echo "\033[1;34m--------------------------------------------------\033[0m"
#        echo ""
#      fi
#    fi
#  done
#}
#
#check_git_status() {
#  for dir in $HOME/src/*; do
#    if [ -d "$dir" ]; then
#      if [ -d "$dir/.git" ]; then
#        git_status=$(git -C "$dir" status -s)
#        if [ ! -z "$git_status" ]; then
#          echo "\033[1;34m--------------------------------------------------\033[0m"
#          echo "\033[1;32m📂 Checking git status in $dir...\033[0m"
#          echo "\033[1;34m--------------------------------------------------\033[0m"
#          echo "$git_status"
#          echo "\033[1;34m--------------------------------------------------\033[0m"
#          echo ""
#        fi
#      fi
#    fi
#  done
#}

rc_diff() {
  # Save the current working directory
  local lwd
  lwd=$(pwd)
  # rc git repo
  cd ${HOME}/.dotfiles
    rc_files=($(git ls-files))
    for f in "${rc_files[@]}"; do
      output=$(diff -q "$HOME/$f" "$HOME/.dotfiles/$f" 2>/dev/null)
      if [ $? -eq 1 ]; then
        echo "$output"
      fi
    done
  cd "$lwd"
}

update_rc_files() {
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
# bitwarden
load_bws_key() {
  if [[ $SHELL == *"zsh"* ]]; then
	  pass=$(security find-generic-password -s 'bitwarden' -w)
  elif [[ $SHELL == *"bash"* ]]; then
    export DISPLAY=:0
    pass=$(secret-tool lookup bitwarden accesstoken)
  fi

	export BWS_ACCESS_TOKEN="${pass}"
  proj=$($HOME/bin/bws project list -o tsv | tail -n 1 | awk '{print $1}' )
  export BWS_PROJECT_ID="$proj"
}

unload_bws_key() {
	unset BWS_ACCESS_TOKEN
}

load_notion_key() {
  key=$($HOME/bin/bws secret get 7909c25f-f3d3-44ea-8b86-aff8010d5ce9 -o tsv | tail -n 1 | awk '{print $3}')
  export NOTION_API_TOKEN="$key"
}

unload_notion_key() {
  unset NOTION_API_TOKEN
}

#chatgpt
load_cgpt_key() {
  if [[ $SHELL == *"zsh"* ]]; then
	  pass=$(security find-generic-password -s 'ChatGPT' -w)
  elif [[ $SHELL == *"bash"* ]]; then
    export DISPLAY=:0
    key=$(secret-tool lookup chatgpt accesstoken)
  fi

	export CGPT_ACCESS_TOKEN="$pass"
}

unload_cgpt_key() {
	unset CGPT_ACCESS_TOKEN
}

# github
load_gh_key() {
  if [[ $SHELL == *"zsh"* ]]; then
    pass=$(security find-generic-password -s 'github' -w)
  elif [[ $SHELL == *"bash"* ]]; then
    export DISPLAY=:0
    pass=$(secret-tool lookup github accesstoken)
  fi

  export GITHUB_ACCESS_TOKEN="$pass"
  export GH_TOKEN="$pass"
}

unload_gh_key() {
  unset GITHUB_ACCESS_TOKEN
  unset GH_TOKEN
}

# cloudflare
load_cf_key() {
  pass=$($HOME/bin/bws secret get c912c706-c8a3-4928-afa3-b064003857f6 -o tsv | tail -n 1 | awk '{print $3}' )
  export CF_ACCESS_TOKEN="$pass"
}

unload_cf_key() {
  unset CF_ACCESS_TOKEN
}

# fernet encryption
load_fn_key() {
  pass=$($HOME/bin/bws secret get d16db1df-6bcf-4f90-a341-b0640187c855  -o tsv | tail -n 1 | awk '{print $3}')
  export FN_ENC_KEY="$pass"
}

unload_fn_key() {
  unset FN_ENC_KEY
}

# ansible vaultpassword
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

# Need to load aliaises first
#key_init() {
#	lb
#	nk
#	lc
#  lg
#  lcf
#  lfnk
#  lvp
#}

#init venv
iv() {
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


print_line() {
  printf "\033[1;34m--------------------------------------------------\033[0m\n"
}

pull_all_repos() {
  for dir in $HOME/src/*; do
    if [ -d "$dir" ]; then
      if [ -d "$dir/.git" ]; then
        print_line
        printf "\033[1;32m📂 Pulling %s...\033[0m\n" "$dir"
        print_line
        git -C "$dir" pull
        print_line
        printf "\n"
      fi
    fi
  done
}

check_git_status() {
  for dir in $HOME/src/*; do
    if [ -d "$dir" ]; then
      if [ -d "$dir/.git" ]; then
        git_status=$(git -C "$dir" status -s)
        if [ ! -z "$git_status" ]; then
          print_line
          printf "\033[1;32m📂 Checking git status in %s...\033[0m\n" "$dir"
          print_line
          printf "%s\n" "$git_status"
          print_line
          printf "\n"
        fi
      fi
    fi
  done
}

#mv() {
#  if [ "$#" -ne 1 ]; then
#    command mv "$@"
#    return
#  fi
#  if [ ! -f "$1" ]; then
#    command file "$@"
#    return
#  fi
#  read -ei "$1" newfilename
#  mv -v "$1" "$newfilename"
#}

rmpyc() {
	rm *.pyc;
	}

ex() {
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2) 	tar xjf $1 ;;
			*.tar.gz) 	tar xzf $1 ;;
			*.bz2)		bunzip2 $1 ;;
			*.rar)		unrar x $1 ;;
			*.gz)		gunzip $1 ;;
			*.tar)		tar xf $1 ;;
			*.tbz2)		tar xjf $1 ;;
			*.zip)		unzip $1 ;;
			*.Z)		uncompress $1 ;;
			*.7z)		7z x $1;;
			*)			echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

color_index() {
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

unload_cgpt_key() {
  unset CGPT_ACCESS_TOKEN
}

key_init() {
  load_bws_key
  load_notion_key
  load_cgpt_key
  load_gh_key
  load_vault_pass
  load_cf_key
  load_fn_key
}

key_git_repo() {
  if [[ -z "${GITHUB_ACCESS_TOKEN}" ]]; then
    echo "GITHUB_ACCESS_TOKEN is not set."
    return 1
  fi
  git config user.github.token "${GITHUB_ACCESS_TOKEN}"
}

