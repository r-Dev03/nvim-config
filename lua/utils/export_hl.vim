function ExportHighlights(file)
  try
    let lines = execute('hi')
    " let lines = substitute(lines, '\v(^|\n)+', '\1hi ', 'g')
    let lines = substitute(lines, 'xxx ', '', 'g')
    " let lines = substitute(lines, '\vhi (\S+) +links to +(\S+)', 'hi link \1 \2', 'g')
    " let lines = substitute(lines, '\vhi (\S+) +cleared', 'hi clear \1', 'g')
    let lines = split(lines, "\n")
    let last_sym = ""

    for i in range(len(lines))
      let sym = matchlist(lines[i], '\v^(\S+)')
      let last_sym = !empty(sym) ? sym : last_sym[0]
      if empty(sym)
        let lines[i] = substitute(lines[i], '\v^', 'hi ' . last_sym, '')
      else
        let lines[i] = substitute(lines[i], '\v^', 'hi ', '')
      endif
      let lines[i] = substitute(lines[i], '\vhi (\S+) +links to +(\S+)', 'hi link \1 \2', '')
      let lines[i] = substitute(lines[i], '\vhi (\S+) +cleared', 'hi clear \1', '')
    endfor

    call writefile(lines, a:file, 'b')
    echo "Highlights exported to " . a:file
  catch
    echo "Error exporting highlights: " . v:exception
  endtry
endfunction
