" Stuff that should be done everytime this file is sourced
" should go below here...

so $MYVIM/usr/devgen.vim

if exists("loaded_html")
  finish

endif
let loaded_html=1

" Stuff that should be only once should go below here...

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui")
  nmenu &HTML\ Tags.Comment               O<!-- COMMENT --><Esc>2bcw
  vmenu &HTML\ Tags.Comment               <Esc>`>a --><Esc>`<i<!-- <Esc>
                                          
  nmenu &HTML\ Tags.Name\ Anchor          O<a name="NAME"><Esc>2bcw
  vmenu &HTML\ Tags.Name\ Anchor          <Esc>`>a"><Esc>`<i<a name="<Esc>l
                                          
  nmenu &HTML\ Tags.Href\ Anchor          O<a href="URL">TAG</a><Esc>5bcw
  vmenu &HTML\ Tags.Href\ Anchor          <Esc>`>a</a><Esc>`<i<a href="URL"><Esc>2bcw
                                          
  nmenu &HTML\ Tags.Image                 O<img src="URL" alt="IMAGE"><Esc>6bcw
  vmenu &HTML\ Tags.Image                 <Esc>`>a" alt="IMAGE"><Esc>`<i<img src="><Esc>l
                                          
  nmenu &HTML\ Tags.Break                 O<br><Esc>
  vmenu &HTML\ Tags.Break                 <Esc>`<i<br><Esc>
                                          
  nmenu &HTML\ Tags.Rule                  O<hr><Esc>
  vmenu &HTML\ Tags.Rule                  <Esc>`<i<hr><CR><Esc>
                                          
  nmenu &HTML\ Tags.Headings.H1		      O<h1>HEADING</h1><Esc>3bcw
  vmenu &HTML\ Tags.Headings.H1		      <Esc>`>a</h1><Esc>`<i<h1><Esc>l
                                         
  nmenu &HTML\ Tags.Headings.H2		      O<h2>HEADING</h2><Esc>3bcw
  vmenu &HTML\ Tags.Headings.H2		      <Esc>`>a</h2><Esc>`<i<h2><Esc>l
                                         
  nmenu &HTML\ Tags.Headings.H3		      O<h3>HEADING</h3><Esc>3bcw
  vmenu &HTML\ Tags.Headings.H3		      <Esc>`>a</h3><Esc>`<i<h3><Esc>l
                                         
  nmenu &HTML\ Tags.Headings.H4		      O<h4>HEADING</h4><Esc>3bcw
  vmenu &HTML\ Tags.Headings.H4		      <Esc>`>a</h4><Esc>`<i<h4><Esc>l
                                          
  nmenu &HTML\ Tags.Headings.H5	  	      O<h5>HEADING</h5><Esc>3bcw
  vmenu &HTML\ Tags.Headings.H5	 	      <Esc>`>a</h5><Esc>`<i<h5><Esc>l
                                          
  nmenu &HTML\ Tags.Headings.H6		      O<h6>HEADING</h6><Esc>3bcw
  vmenu &HTML\ Tags.Headings.H6		      <Esc>`>a</h6><Esc>`<i<h6><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Address       O<address>TEXT</address><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Address       <Esc>`>a</address><Esc>`<i<address><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Bold          O<b>TEXT</b><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Bold          <Esc>`>a</b><Esc>`<i<b><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Bigger        O<big>TEXT</big><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Bigger        <Esc>`>a</big><Esc>`<i<big><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Blink         O<blink>TEXT</blink><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Blink         <Esc>`>a</blink><Esc>`<i<blink><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Blockquote    O<blockquote>TEXT</blockquote><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Blockquote    <Esc>`>a</blockquote><Esc>`<i<blockquote><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Center        O<center>TEXT</center><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Center        <Esc>`>a</center><Esc>`<i<center><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Cite          O<cite>TEXT</cite><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Cite          <Esc>`>a</cite><Esc>`<i<cite><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Code          O<code>TEXT</code><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Code          <Esc>`>a</code><Esc>`<i<code><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Definition    O<dfn>TEXT</dfn><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Definition    <Esc>`>a</dfn><Esc>`<i<dfn><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Emphasis      O<em>TEXT</em><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Emphasis      <Esc>`>a</em><Esc>`<i<em><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Italics       O<i>TEXT</i><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Italics       <Esc>`>a</i><Esc>`<i<i><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Keyboard      O<kbd>TEXT</kbd><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Keyboard      <Esc>`>a</kbd><Esc>`<i<kbd><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.No\ Break     O<nobr>TEXT</nobr><Esc>3bcw
  vmenu &HTML\ Tags.Formats.No\ Break     <Esc>`>a</nobr><Esc>`<i<nobr><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Preformat     O<pre>TEXT</pre><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Preformat     <Esc>`>a</pre><Esc>`<i<pre><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Strike        O<strike>TEXT</strike><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Strike        <Esc>`>a</strike><Esc>`<i<strike><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Sample        O<samp>TEXT</samp><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Sample        <Esc>`>a</samp><Esc>`<i<samp><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Smaller       O<small>TEXT</small><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Smaller       <Esc>`>a</small><Esc>`<i<small><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Strong        O<strong>TEXT</strong><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Strong        <Esc>`>a</strong><Esc>`<i<strong><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Subscript     O<sub>TEXT</sub><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Subscript     <Esc>`>a</sub><Esc>`<i<sub><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Superscript   O<sup>TEXT</sup><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Superscript   <Esc>`>a</sup><Esc>`<i<sup><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Typerwriter   O<tt>TEXT</tt><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Typerwriter   <Esc>`>a</tt><Esc>`<i<tt><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Underline     O<u>TEXT</u><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Underline     <Esc>`>a</u><Esc>`<i<u><Esc>l
                                          
  nmenu &HTML\ Tags.Formats.Variable      O<var>TEXT</var><Esc>3bcw
  vmenu &HTML\ Tags.Formats.Variable      <Esc>`>a</var><Esc>`<i<var><Esc>l

  nmenu &HTML\ Tags.List.List\ Item       O<li>LIST ITEM<Esc>2b2cw
  vmenu &HTML\ Tags.List.List\ Item       <Esc>`<i<li><Esc>

  nmenu &HTML\ Tags.List.List\ Header     O<lh>LIST HEADER</lh><Esc>4b2cw
  vmenu &HTML\ Tags.List.List\ Header     <Esc>`>a</lh><Esc>`<i<lh><Esc>l

  nmenu &HTML\ Tags.List.Unordered\ List  O<ul><CR>  <li>LIST ITEM<CR><BS><BS></ul><Esc>4b2cw
  vmenu &HTML\ Tags.List.Unordered\ List  <Esc>`>a<CR></ul><Esc>:'<+1,'>+1s/^/    <li>/<CR>`<i<ul><CR>    <li><Esc>/<li><.ul><CR>4x4X

  nmenu &HTML\ Tags.List.Ordered\ List    O<ol><CR>  <li>LIST ITEM<CR><BS><BS></ol><Esc>4b2cw
  vmenu &HTML\ Tags.List.Ordered\ List    <Esc>`>a<CR></ol><Esc>:'<+1,'>+1s/^/    <li>/<CR>`<i<ol><CR>    <li><Esc>/<li><.ol><CR>4x4X

  nmenu &HTML\ Tags.List.Directory\ List  O<dir><CR>  <li>LIST ITEM<CR><BS><BS></dir><Esc>4b2cw
  vmenu &HTML\ Tags.List.Directory\ List  <Esc>`>a<CR></dir><Esc>:'<+1,'>+1s/^/    <li>/<CR>`<i<dir><CR>    <li><Esc>/<li><.dir><CR>4x4X

  nmenu &HTML\ Tags.List.Menu\ List       O<mu><CR>  <li>LIST ITEM<CR><BS><BS></mu><Esc>4b2cw
  vmenu &HTML\ Tags.List.Menu\ List       <Esc>`>a<CR></mu><Esc>:'<+1,'>+1s/^/    <li>/<CR>`<i<mu><CR>    <li><Esc>/<li><.mu><CR>4x4X

  nmenu &HTML\ Tags.List.Definition       O<dt>TERM<CR><dd>DEFINITION<Esc>5bcw
  vmenu &HTML\ Tags.List.Definition       <Esc>`>a<CR><dd>DEFINITION <Esc>`<i<dt><Esc>5wcw

  nmenu &HTML\ Tags.List.Definition\ List O<dl><CR>  <li>LIST ITEM<CR><BS><BS></dl><Esc>4b2cw
  vmenu &HTML\ Tags.List.Definition\ List <Esc>`>a<CR>    <dd>DEFINITION<CR><BS><BS><BS><BS></dl><Esc>`<i<dl><CR>    <dt><Esc>l
endif
