" Shows number of changed, added, and deleted
" lines detected by GitGutter, inside lightline

function! hunkstatus#gitgutter()
  let branch=gitbranch#name()
  if branch !=# ''
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
  else
    return ''
  endif
endfunction
