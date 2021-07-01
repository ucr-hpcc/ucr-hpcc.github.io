---
type: docs
linkTitle: Linux Basics - Vim Manual
title: Linux Basics - Vim Manual
permalink: manuals_linux-basics_vim.html
---

> Note: [Neovim](https://neovim.io/) has replaced vim on the cluster, however most (if not all) items here still apply.
Load Neovim via the module system, like so `module load neovim`. It may also be useful to alias `nvim` to `vim`, like so `alias vim=nvim`.
Thia alias can be added to your `~/.bashrc` file for convenience.

## Vim Manual

This is an extensive overview of vim features and operations.

### Basics

`vim <my_file_name> # open/create file with vim`

Once you are in Vim the most important commands are `i` ,  `:`  and `ESC`. The `i` key brings you into the insert mode for typing. `ESC` brings you out of there. And the `:` key starts the command mode at the bottom of the screen. In the following text, all commands starting with `:` need to be typed in the command mode. All other commands are typed in the normal mode after hitting the `ESC` key.

### Modifiers

```bash
i                   # INSERT MODE
ESC                 # NORMAL (NON-EDITING) MODE
:                   # Commands start with ':'
:w                  # Save command; if you are in editing mode you have to hit ESC first!!
:q                  # Quit file, don't save
:q!                 # Exits WITHOUT saving any changes you have made
:wq                 # Save and quit
R                   # Replace MODE
r                   # Replace only one character under cursor
q:                  # History of commands (from NORMAL MODE!), to reexecute one of them, select and hit enter!
:w new_filename     # Saves into new file
:#,#w new_filename  # Saves specific lines (#,#) to new file
:#                  # Go to specified line number
```

### Moving Around

```bash
$               # Moves cursor to end of line
A               # Same as $, but switches to insert mode
0               # Zero moves cursor to beginning of line
CTRL-g          # Shows file name and current line you are on
SHIFT-G         # Brings you to bottom of file
```

### Lines

```bash
:set wrap       # Wrap lines around the screen if too long
:set nowrap     # No line wrapping
:set number     # Shows line numbers
:set nonumber   # No line numbers
```

### Multiple Files

```bash
vim -o *.txt    # Opens many files at once and displays them with horizontal
                # Split, '-O' does vertical split
vim *.txt       # Opens many files at once; ':n' switches between files
```

```bash
:wall or :qall    # Write or quit all open files
:args *.txt       # Places all the relevant files in the argument list
:all              # Splits all files in the argument list (buffer) horizontally
CTRL-w            # Switch between windows
:split            # Shows same file in two windows
:split <file-to-open> # Opens second file in new window
:vsplit           # Splits windows vertically, very useful for tables, ":set scrollbind" let's you scroll all open windows simultaneously
:close            # Closes current window
:only             # Closes all windows except current one
```

### Spell Checking

```bash
:set spell           # Turns on spell checking
:set nospell         # Turns spell checking off
:! dict <word>       # Meaning of word
:! wn 'word' -over   # Synonyms of word
```

### Syntax Highlighting

```bash
:set filetype=perl   # Turns on syntax coloring for a chosen programming language.
:syn on              # Turns syntax highlighting on
:syn off             # Turns syntax highlighting off
```

### Undo and Redo

```bash
u          # Undo last command
U          # Undo all changes on current line
CTRL-R     # Redo one change which was undone
```

### Deleting

```bash
x       # Deletes what is under cursor
dw      # Deletes from curser to end of word including the space
de      # Deletes from curser to end of word NOT including the space
cw      # Deletes rest of word and lets you then insert, hit ESC to continue with NORMAL mode
c$      # Deletes rest of line and lets you then insert, hit ESC to continue with with NORMAL mode
d$      # Deletes from cursor to the end of the line
dd      # Deletes entire line
2dd     # Deletes next two lines, continues: 3dd, 4dd and so on.
```

### Copy and Paste

```bash
yy    # Copies line, for copying several lines do 2yy, 3yy and so on
p     # Pastes clipboard behind cursor
```

### Search

```bash
/my_pattern    # Searches for my_pattern downwards, type n for next match
?my_pattern    # Searches for my_pattern upwards, type n for next match
:set ic        # Switches to ignore case search (case insensitive)
:set hls       # Switches to highlight search (highlights search hits)
```

### Replacements

Great intro: [A Tao of Regular Expressions](http://www.scootersoftware.com/RegEx.html)

Quick reference to some replacement techniques:
```bash
:s/old_pat/new_pat/                      # Replaces first occurrence in a line
:s/old_pat/new_pat/g                     # Replaces all occurrence in a line
:s/old_pat/new_pat/gc                    # Add 'c' to ask for confirmation
:#,#s/old_pat/new_pat/g                  # Replaces all occurrence between line numbers: #,#
:%s/old_pat/new_pat/g                    # Replaces all occurrence in file
:%s/\(pattern1\)\(pattern2\)/\1test\2/g  # Regular expression to insert, you need here '\' in front of parentheses (<# Perl)
:%s/\(pattern.*\)/\1 my_tag/g            # Appends something to line containing pattern (<# .+ from Perl is .* in VIM)
:%s/\(pattern\)\(.*\)/\1/g               # Removes everything in lines after pattern
:%s/\(At\dg\d\d\d\d\d\.\d\)\(.*\)/\1\t\2/g  # Inserts tabs between At1g12345.1 and Description
:%s/\n/new_pattern/g                     # Replaces return signs
:%s/pattern/\r/g                         # Replace pattern with return signs!!
:%s/\(\n\)/\1\1/g                        # Insert additional return signs
:%s/\(^At\dg\d\d\d\d\d.\d\t.\{-}\t.\{-}\t.\{-}\t.\{-}\t\).\{-}\t/\1/g  # Replaces content between 5th and 6th tab (5th column), '{-}' turns off 'greedy' behavior
:#,#s/\( \{-} \|\.\|\n\)/\1/g            # Performs simple word count in specified range of text
:%s/\(E\{6,\}\)/<font color="green">\1<\/font>/g  # Highlight pattern in html colors, here highlighting of >= 6 occurences of Es
:%s/\([A-Z]\)/\l\1/g                     # Change uppercase to lowercase, '%s/\([A-Z]\)/\u\1/g' does the opposite
```

Uses 'global' command to apply replace function only on those lines that match a certain pattern. The 'copy $' command after the pipe '|' prints all matching lines at the end of the file.

```bash
:g/my_pattern/ s/\([A-Z]\)/\l\1/g | copy $
```

Command 'args' places all relevant files in the argument list (buffer); 'all' displays each file in separate split window; command 'argdo' applies replacement to all files in argument list (buffer); flag 'e' is necessary to avoid stop at error messages for files with no matches; command 'update' saves all changes to files that were updated.

```bash
:args *.txt | all | argdo %s/\old_pat/new_pat/ge | update
```

### Utilities

  * Matching Parentheses
    * Place cursor on (, [ or { and type % # cursor moves to matching parentheses

  * Printing and Inserting Files
    * `:ha            # Prints entire file`
    * `:#,#ha         # Prints specified lines: #,#`
    * `:r <filename>  # Inserts content of specified file after cursor`

  * Convert Text File to HTML Format
    * `:runtime! syntax/2html.vim  # Run this command with open file in Vim`

  * Shell Commands in Vim
    * `:!<SHELL_COMMAND> <ENTER>  # Executes any shell command, hit <enter> to return`
    * `:sh                        # Switches window to shell, 'exit' switches back to vim`

  * Using Vim as Table Editor
    * `v` starts visual mode for selecting characters
    * `V` starts visual mode for selecting lines`
    * `CTRL-V` starts visual mode for selecting blocks (use CTRL-q in gVim under Windows). This allows column-wise selections and operations like inserting and deleting columns. To restrict substitute commands to a column, one can select it and switch to the command-line by typing `:`. After this the substitution syntax for a selected block looks like this: `'<,'>s///.`
    * `:set scrollbind` starts simultaneous scrolling of 'vsplitted' files. To set to horizontal binding of files, use command `:set scrollopt=hor` (after first one). Run all these commands before the `:split` command.
    * `:AlignCtrl I= \t` then `:%Align` This allows to align tables by column separators (here '\t') when the [Align utility from Charles Campbell's](http://vim.sourceforge.net/scripts/script.php?script_id=294) is installed. To sort table rows by selected lines or block, perform the visual select and then hit F3 key. The rest is interactive. To enable this function, one has to include in the `.vimrc` file the [Vim sort script](https://cluster.hpcc.ucr.edu/%7Etgirke/Documents/UNIX/vim/vim_sort_fct.txt) from Gerald Lai.

### Settings

The default settings in Vim are controlled by the `.vimrc` file in your home directory.

  * see last chapter of vimtutor (start from shell)
  * useful [.vimrc sample](http://phuzz.org/vimrc.html)
  * when vim starts to respond very slowly then one may need to delete the `.viminf*` files in home directory

### Help

  * **Online Help**
    * Find help on the web. Google will find answers to most questions on **vi** and **vim** (try searching for both terms).
    * [Purdue University Vi Tutorial](https://engineering.purdue.edu/ECN/Support/KB/Docs/ViTextEditorTutorial)
    * Animated Vim Tutorial: https://linuxconfig.org/vim-tutorial
    * Useful list of vim commands:
      * [Vim Commands Cheat Sheet](http://www.fprintf.net/vimCheatSheet.html)
      * [VimCard](http://tnerual.eriogerg.free.fr/vimqrc.pdf)

You can run a tutor from the command Line:

```
vimtutor      # Open vim tutorial from shell, ":q" to quit
```

You can also get help from within Vim:

```bash
:help                # opens help within vim, hit :q to get back to your file
:help <topic>        # opens help on specified topic
:help_topic| CTRL-]  # when you are in help this command opens help topic specified between |...|,
                     # CTRL-t brings you back to last topic
:help <topic> CTRL-D # gives list of help topics that contain key word
: <up-down keys>     # like in shell you get recent commands!!!!
```
