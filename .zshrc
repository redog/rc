setopt HIST_IGNORE_SPACE
set -o vi

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

alias lb='load_bws'
alias ub='unload_bws'
alias nk='load_notion_key'
alias unk='unload_notion_key'
alias lc='load_cgpt_key'
alias uc='unload_cgpt_key'
alias lg='load_gh_key'
alias ug='unload_gh_key'
alias vim='nvim'
alias grep='rg'
alias python='python3'

key_init() {
	lb
	nk
	lc
  lg
}

export CPGPT_ORGID=”org-mXtmTz67aAt9GTfmXaQZ72Dp”

export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.11/lib/python3.11/site-packages/"
