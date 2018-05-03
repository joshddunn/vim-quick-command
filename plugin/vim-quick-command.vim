" use escape to get out of terminal mode
tnoremap <leader><Esc> <C-\><C-n>:q<cr>
tnoremap <localleader><Esc> <C-\><C-n>

if !exists("g:vim_terminal_height")
  let g:vim_quick_commands_terminal_height = 20
endif

if !exists("g:vim_quick_command_aliases")
  let g:vim_quick_command_aliases = {}
endif

if !exists("g:vim_quick_command_default_terminal")
  let g:vim_quick_command_default_terminal = "Bash"
endif

" opening the terminal
function! VimTerminalOpen(which, command)
  let command = a:command . (len(a:command) ? "\n" : "")
  exe ":sp term://" . a:which . " | :resize " . g:vim_terminal_height . " | :startinsert | sleep 50m | call feedkeys('" . command . "')"
endfunction

command! -nargs=* Fish call VimTerminalOpen("fish", <q-args>)
command! -nargs=* Bash call VimTerminalOpen("bash", <q-args>)
command! -nargs=* Zsh call VimTerminalOpen("zsh", <q-args>)

" command line aliasing
function! VimQuickCommand(command)
  let command = split(a:command)

  if has_key(g:vim_quick_command_aliases, command[0])
    exe ":" . g:vim_quick_command_default_terminal . " " . g:vim_quick_commands[command[0]] . " " . join(command[1:], " ")
    exe ":startinsert"
  else
    echo "Error: " . command[0] . " not defined in g:vim_quick_commands"
  endif
endfunction

command! -nargs=* Qc call VimQuickCommand(<q-args>)
