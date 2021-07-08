---
title: Command Line Basics
linkTitle: Command Line Basics
type: docs
weight: 2
aliases:
    - /manuals_linux-basics_cmdline-basics.html
    - /manuals_linux-basics_cmdline-basics
---

## Basics

### Syntax and Notes

* Remember the UNIX/Linux command line is case sensitive!
* The hash (pound) sign `#` indicates end of a command and the start of a comment.
* The notation `<...>` refers to variables and file names that need to be specified by the user. The symbols `<` and `>` need to be excluded.
* No need to memorize all of these commands, by using these commands you will naturally memorize the most frequently used.

* When specifying file names:
  * The `.` (dot) refers to the present working directory
  * The `~` (tilde) refers to user's home directory

### Commands

#### Navigation and Exploration

```bash
pwd               # "Print working directory"; show your current path

ls                # "List" contents of current directory
ls -l             # Similar to ls, but provides additional info on files and directories
ls -a             # List all files, including hidden files (.name) as well
ls -R             # Lists subdirectories recursively
ls -t             # Lists files in chronological order

cd <dir_name>     # "Change directory" to specified path
cd                # Brings you to your home directory
cd ~              # Also bring you to your home directory
cd ..             # Moves one directory up
cd ../../         # Moves two directories up (and so on)
cd -              # Go back to you were previously (before the last directory change)
```

#### Informative

```bash
file <file-name>  # Show type of file (text, binary, compressed, etc...)
id                # Shows your user name and associated groups
hostname          # Shows the name of the machine your shell is currently on
```

#### Files and Directories

```bash
mkdir <dir_name>   # Creates specified directory
rmdir <dir_name>   # Removes empty directory
rm <file_name>     # Removes file_name
rm -r <dir_name>   # Removes directory including its contents, but asks for confirmation
rm -rf <dir_name>  # Same as above, but turns confirmation off. Use with caution
cp <name> <path>   # Copy file/directory as specified in path (-r to include content in directories)
mv <name1> <name2> # Renames directories or files
mv <name> <path>   # Moves file/directory as specified in path
```

### Copy and paste

The methods to copy and paste on the command line differ depending on your operating systems (ie. Mac OSX, MS Windows, Linux) and your SSH application (ie. Terminal, MobaXTerm).

* Linux (xterm)

```
# Copy
CTRL+SHIFT+C

# Paste
CTRL+SHIFT+V
```

* MS Windows (MobaXTerm)

```
# Copy by highlighting with mouse

# Paste
SHIFT+INSERT
```

* Mac OSX (Terminal)

```
# Copy
COMMAND+c

# Paste
COMMAND+v
```

### Shortcuts

#### Command History

* &#8593;`               # Up arrow key scrolls backwards through command history`
* &#8595;`               # Down arrow key scrolls forwards through command history`
* `history               # Shows all commands you have used recently`

#### Auto-completion

The tab (&#8677;) key auto completes commands or file names if there is only one option.
Hitting the tab (&#8677;) key twice will list multiple options.
Keep in mind that there are no spaces between the tab (&#8677;) keys and the partial names of commands or files.

Show all directories under my home that I can `cd` into:

`cd ~/`&#8677;&#8677;

Show all files that I can `ls` with names that start with "myfile":

`ls myfile`&#8677;&#8677;

Show all commands that I can run with names that start with "sp":

`sp`&#8677;&#8677;

#### Cursor

```bash
Ctrl+a    # Cursor to beginning of command line
Ctrl+e    # Cursor to end of command line
Ctrl+w    # Cut last word
Ctrl+k    # Cut to the end of the line
Ctrl+y    # Paste ("yank") content that was cut earlier (by Ctrl-w or Ctrl-k)
```

### Other Useful Unix Commands

```bash
df -h /scratch          # Show local disk space for /scratch, do not use for /rhome or /bigdata
free -h                 # Show memory of current machine
bc                      # Command-line calculator (to exit type 'quit')
wget <URL>              # Download a file or directory from the web
ln -s <FILENAME1> <FILENAME2> # Creates symbolic link (shortcut, or alias) for file or directory
du -sh .                # Shows size of current directory
du -sh <FILENAME>       # Shows size of individual file
du -s * | sort -nr      # Shows size of each file within current directory, sorted by size
```

## Help

Not all command have help documentation available, however one of these methods will likely work:

```bash
help <COMMAND>    # Show help for a Bash command
man <COMMAND>     # Show the manual page for a program (press the 'q' key to exit)
<COMMAND> --help  # Show help documentation for command
<COMMAND> -h      # Show help documentation for command
```

Online help: [Google](https://www.google.com/) is your friend.

Universally available Linux commands, with detailed examples and explanations: <https://www.linuxconfig.org/linux-commands>
