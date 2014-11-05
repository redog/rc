
"  tab expansion of aliases in e-mail messages.
"  Written by Sean Reifschneider <jafo@tummy.com>, tummy.com, ltd.
"  All Rights Reserved, Copyright (c) 2006
"  License: GNU Public License
"  edited by Eric G Ortego

"inoremap <tab> <nop>

function! s:DefPython()
python << PYTHONEOF
####################
import string, os, re, vim

def expandAliases():
	'''Look for aliases in the current line and expand them.'''
	import string, os
	muttaliases="/home/eric/.mutt/aliases"
	cb = vim.current.buffer
	lineno, col = vim.current.window.cursor
	if lineno > 10: return
	cline = cb[lineno - 1]
	lline = string.lower(cline)
	if lline[:4] != 'to: ' and lline[:4] != 'cc: ' and lline[:5] != 'bcc: ':
		return

	#  find start
	start = col - 1
	while start > 4 and cline[start] not in ',':
		start = start - 1
	while start < col and cline[start] in ' ,':
		start = start + 1
	if start == col: return
	search = cline[start:col + 1]
	if string.strip(search) == '': return

	#  find match
	fp = open(muttaliases, 'r')
	match = None
	for line in fp.readlines():
		m = re.match(r'^alias\s+(\S+)\s+(\S.*\S)\s*$', line)
		if not m: continue
		if m.group(1) == search:
			match = m.group(2)
			break
	fp.close()
	if not match: return

	#  replace match in line
	cb[lineno - 1] = cline[:start] + match + cline[col + 1:]
	vim.current.window.cursor = ( lineno, len(cline[:start] + match) )

TabIsMapped = 0

def SetTabToExpand():
	global TabIsMapped
	cb = vim.current.buffer
	lineno, col = vim.current.window.cursor
	cline = string.lower(cb[lineno - 1])
	if cline[:4] != 'to: ' and cline[:4] != 'cc: ' and cline[:5] != 'bcc: ':
		if TabIsMapped:
			TabIsMapped = 0
			vim.command('iunmap <Tab>')
		return
	if not TabIsMapped:
		TabIsMapped = 1
		vim.command('inoremap <Tab> <C-R>=PythonExpandAliases()<CR>')
PYTHONEOF
endfunction
call s:DefPython()

function! PythonExpandAliases()
   execute "python expandAliases()"
   return ""
endfunction

autocmd CursorHold,CursorMoved * python SetTabToExpand()

set spell
set noautoindent
