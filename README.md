# vim-quick-command

Be able to alias command-line commands within vim!

Work in progress.

### Usage

You can access a terminal with `:Bash`, `:Fish`, or `:Zsh`.

You can issue a quick command with `:Qc alias maybe_some_other_arguments`

Use `<leader><Esc>` to exit from terminal mode.

### Options

Set the height of the terminal with

    let g:vim_quick_commands_terminal_height = 20

Setup your command line alises

    let g:vim_quick_command_alias = {"alias": "really long command you dont want to type"}

Default terminal

    let g:vim_quick_command_default_terminal = "Bash" or "Zsh" or "Fish"
