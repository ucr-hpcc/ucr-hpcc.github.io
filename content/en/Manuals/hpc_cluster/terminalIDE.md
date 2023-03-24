---
title: Terminal-based Working Environments 
linkTitle: Terminal IDEs 
type: docs
weight: 11
aliases:
    - /manuals_linux-cluster_terminalIDE.html
    - /manuals_linux-cluster_terminalIDE
---


## Terminal IDEs
This page introduces tmux and Neovim as terminal-based working environments for
working efficiently on remote systems like HPC clusters or cloud systems. They can
be used independently or in combination, and provide many useful
functionalities for working in local or remote terminal environments. 
Users who prefer a more graphical environment,
[VSCode](https://hpcc.ucr.edu/manuals/hpc_cluster/selected_software/vscode/)
might be a good alternative. 

## Tmux: virtual terminal multiplexer 

Tmux is a virtual terminal multiplexer providing persistent terminal sessions
that are de- and re-attachable. It is an incredible useful tool for terminal-based
work on remote systems. Major advantages of tmux are: 

* Work in a terminal session cannot get lost when a terminal session is disconnected 
  or disrupted due to internet problems. 
* Its many useful functionalities '_power charge_' terminal application on both local and remote systems.

Screen is a related virtual terminal multiplexer tool that can be used as an alternative (not covered here). 
It has similar functionalities as tmux. 

Tmux can be downloaded and installed from
[here](https://github.com/tmux/tmux/wiki/Installing). A custom tmux (and nvim)
environment with extensions can be installed by HPCC users with a
single command (here `Install_Nvim-R_Tmux`). The same
script also installs several useful Nvim plugins (see
[below](https://hpcc.ucr.edu/manuals/hpc_cluster/terminalide/#nvim-introduction)).
Alternatively, the install script can be downloaded from
[here](https://github.com/tgirke/Nvim-R_Tmux#2-installation). After installing
the provided tmux environment in a user account, one needs to log out and in
again to activate the environment. Note, installing the custom environment is
optional and not required for any of the following examples. Users also need to
be aware that the install script will make changes to their .bashrc` and
`.tmux.conf` files. If this is not desirable, then one can install the
components stepwise, or run the install, and then undo any configuration changes by
following the instructions printed to the screen during the install.

<center><img title="tmux" src="https://assets-global.website-files.com/607f4f6df411bd9e447dc7d8/607f4f6df411bd02d27dcb8b_tmux-vim-style-nav-with-fzf.gif"></center>
<center>Tmux: Window Split into Several Panes</center>


### Important considerations for virtual tmux sessions 

* Both tmux and screen sessions run on the system, where they were initialized. 
* To reattach to a specific session on a remote system, like the HPCC cluster, one needs to first log in to the same node (here headnode) and then re-attach to the corresponding tmux session. 
* It is important not to run tmux (or screen) sessions on computer nodes since tmux sessions are persistent. Instead tmux sessions should be run on a headnode. From an open tmux session one can then log in to a computer node via `srun`, or just submit jobs from tmux session with `sbatch`.

### Start Tmux

* `module load tmux`: only required on a system that uses environment modules, and the load command is not specified in a user's .bashrc file 
* `tmux`: starts a new tmux session
* `tmux a`: attaches to an existing session, or a default session of a system, _e.g._ specified under `~/.tmux.conf`
* `tmux attach -t <id>`: attaches to a running session selected under `<id>` 
* `tmux ls`: lists existing tmux sessions 

### Prefix 

The prefix for controlling tmux depends on a user's settings specified under `~/.tmux.conf`.

* `Ctrl-b`: default is hard to type, and thus often not preferred
* `Ctrl-a`: more commonly used, also on HPCC

The prefix can be changed by placing the following lines into `~/.tmux.conf`.

   ```sh
   unbind C-b
   set -g prefix C-a 
   ```

### Mouse Support

Mouse support for tmux can be enabled with following command.

* `Ctrl-a : set -g mouse on`  

To turn mouse support on by default, include in `~/.tmux.conf` this line: `set -g mouse on`

### Important keybindings for tmux 

__Pane-level commands__

* `Ctrl-a %`: splits pane vertically
* `Ctrl-a “`: splits pane horizontally
* `Ctrl-a o`  or `Ctrl-a <arrow keys>`: jumps cursor to next pane
* `Ctrl-a Ctrl-o`: swaps panes
* `Ctrl-a <space bar>`: rotates pane arrangement
* `Ctrl-a Alt <left or right>`: resizes to left or right
* `Ctrl-a Esc <up or down>`: resizes to left or right	

__Window-level commands__

* `Ctrl-a n`: switches to next tmux window
* `Ctrl-a Ctrl-a`: switches to previous tmux window
* `Ctrl-a c`: creates a new tmux window
* `Ctrl-a 1`: switches to specific tmux window selected by number

__Session-level commands__

* `Ctrl-a d`: detaches from current session
* `Ctrl-a s`: switch between available tmux sessions
* `$ tmux new -s <name>`: starts new session with a specific name
* `$ tmux ls`: lists available tmux session(s)
* `$ tmux attach -t <id>`: attaches to specific tmux session
* `$ tmux attach`: reattaches to session
* `$ tmux kill-session -t <id>`: kills a specific tmux session
* `Ctrl-a : kill-session`: kills a session from tmux command mode that can be initiated with Ctrl-a :


## Vim/Nvim overview

Vim is a widely used, extremely powerful and versatile code/text editor that is
usually available on most Linux and Unix systems by default. The newer version is called
Neovim (nvim). The main advantages of Neovim compared to Vim are its better
performance and its built-in terminal emulator facilitating the communication
among Neovim and interactive programming environments, such as command-lines
and R. Since the Vim and Neovim environments are managed independently, one can
easily install and use them in parallel on the same system without interfering with
each other. The usage of Neovim is almost identical to Vim. Emacs is a powerful alternative 
that can be used as an alternative to Nvim. 

<center><img title="neovim" src="https://user-images.githubusercontent.com/16662357/128590006-0fc1451f-fac1-49b2-bb95-8aba21bfa44e.gif"></center>
<center>Neovim Example with Autocompletion</center>

### Nvim introduction

The following opens a file (here `myfile`) with nvim (or vim). If nvim is not
found then it might need to be loaded with `module load neovim` first. A custom
nvim/tmux environment with extensions can be installed by HPCC users by
executing `Install_Nvim-R_Tmux` in their home account. Alternatively, the
install script can be downloaded from
[here](https://github.com/tgirke/Nvim-R_Tmux#2-installation). After installing
it one needs to log out and in again. Note, installing the custom environment
is optional (not requried for following examples) and will make changes to a
user's `.bashrc` and `.tmux.conf` files. These changes can be undone by
following instructions printed to screen during install.  

### Open file with Nvim 

```sh
nvim myfile.txt # for neovim (or 'vim myfile.txt' for vim)
```

### Three main modes

Once you are in Nvim, there are three main modes: normal, insert and command mode. The most important commands for switching between the three modes are:

* `i`: The `i` key brings you from the normal mode to the insert mode. The latter is used for typing. 
* `Esc`: The `Esc` key brings you from the insert mode back to the normal mode.
* `:`: The `:` key starts the command mode at the bottom of the screen.

### Important modifier keys to control vim/nvim

Use the arrow keys to move your cursor in the text. Using `Fn Up/Down key` allows to page through
the text quicker. In the following command overview, all commands starting with `:` need to be typed in the command mode. 
All other commands are typed in the normal mode after pushing the `Esc` key. 

* `:w`: save changes to file. If you are in editing mode you have to hit `Esc` first.
* `:q`: quit file that has not been changed
* `:wq`: save and quit file
* `:!q`: quit file without saving any changes

### Mouse support

When enabled, one can position the cursor anywhere with the mouse as well as resize split windows, and switch the scope from one window split to another.

* `:set mouse=n`  # Enables mouse support, also try a option
* `:set mouse-=n` # Disables mouse support

To enable mouse support by default, add `set mouse=n` to Nvim’s config file located in a user’s home under `~/.config/nvim/init.vim`.

### Moving round

* `arrow_keys`: move cursor in the text 
* `Fn Up/Down`: faster scrolling via paging.
* `G` or `gg`: jump to end of document and back to beginning 
* `w` or `b`: move forward and backward by word
* `)` or `(`: move forward and backward by sentence


### Important keybindings

* `:split` or `:vsplit`: splits viewport (similar to pane split in tmux)
* `gz`: maximizes size of viewport in normal mode (similar to Tmux's `Ctrl-a z` zoom utility) 
* `Ctrl-w w`: jumps cursor to other viewport and back
* `Ctrl-w r`: swaps viewports
* `Ctrl-w =`: resizes splits to equal size
* `:resize <+5 or -5>`: resizes height by specified value
* `:vertical resize <+5 or -5>`: resizes width by specified value
* `Ctrl-w H` or `Ctrl-w K`: toggles between horizontal/vertical splits
* `Ctrl-spacebar`: omni completion for R objects/functions when nvim is in insert mode. Note, this has been remapped in `init.vim` from difficult to type default `Ctrl-x Ctrl-o`. 
* `Ctrl-s and Ctrl-x`: freezes/unfreezes vim (some systems)

### Powerful features of command mode

For example, search and replace with regular expression support

* `/` or `?`: search in text forward and backward
* `:%s/search_pattern/replace_pattern/cg`: replacement syntax 

### Useful set command

* `set number` or `set nonumber`: toggle for turning line nubers on/off
* `set syntax=bash`: toggle syntax highlighting for different languages (e.g. python, perl, bash, etc) or turn off with `set syntax=off`

### Visual mode

* Initialized from normal mode with `v`, `V` or `Ctrl + v`. 
* Delete and copy selected text with `d` and `y`, respectively. For paste use `p` from normal mode. The copied (yanked) text is stored in a separate vim clipboard. 

### Copy and delete lines

* `yy`: copies line where cursor is or those that are selected via visual mode. Paste works with `p` as above.
* `dd`: deletes line where cursor is or those that are selected via visual mode.

### File browser built into vim: `NERDtree`

NERDtree provides file browser functionality for Vim. To enable it, the NERDtree plugin needs to be installed. It is included in account configuration 
with `Install_Nvim-R_Tmux`. To use NERDtree, open a file with vim/nvim and then type in normal mode `zz`. The same command closes NERDtree.
The basic NERDtree usage is explained [here](https://github.com/tgirke/Nvim-R_Tmux#33-basic-nerdtree-usage).

<center><img title="nerdtree" src="https://miro.medium.com/v2/resize:fit:828/format:webp/1*yFuOEvHxG9U0AUjrDlpbrQ.png" ></center>
<center>NERDtree in action</center>

### Useful resources for learning vim/nvim

* [Interactive Vim Tutorial](http://www.openvim.com)
* [Official Vim Documentation](http://vimdoc.sourceforge.net/)
* [HPCC Linux Manual](/manuals/linux_basics/vim/)

## Nvim for R users with `nvim-R` plugin 

### Basics

Tmux is a terminal multiplexer that allows to split terminal windows and to detach/reattach to
existing terminal sessions. Combinded with the `nvim-r` plugin it provides a powerful command-line working 
environment for R where users can send code from a script to the R console or command-line.
Both tmux and the `nvim-r` plugin need to be installed on a system. On HPCC Cluster both are configured
in each user account. If this is not the case then follow the quick configuration instructions given in the following subsection.

<center><img title="Nvim-R" src="https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/Nvim-R.gif" ></center>
<center>Nvim-R IDE for R</center>


### Quick configuration in user accounts

Skip these steps if Nvim-R-Tmux is already configured in your account. Or follow the [detailed
instructions](https://github.com/tgirke/Nvim-R_Tmux) to install Nvim-R-Tmux from scratch on your own system.

1. Log in to your user account on HPCC and execute `Install_Nvim-R_Tmux` (old: `install_nvimRtmux`). Alternatively, follow these step-by-step [install commands](https://github.com/tgirke/Nvim-R_Tmux).
2. To enable the nvim-R-tmux environment, log out and in again.
3. Follow usage instructions of next section.

### Basic usage of Nvim-R-Tmux

The official and much more detailed user manual for `Nvim-R` is available [here](https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt).
The following gives a short introduction into the basic usage of Nvim-R-Tmux:

__1. Start tmux session__ (optional)

Note, running Nvim from within a tmux session is optional. Skip this step if tmux functionality is not required (_e.g._ reattaching to sessions on remote systems).

```sh
tmux # starts a new tmux session 
tmux a # attaches to an existing session 
```

__2. Open nvim-connected R session__ 

Open a `*.R` or `*.Rmd` file with `nvim` and intialize a connected R session with `\rf`. This command can be remapped to other key combinations, e.g. uncommenting lines 10-12 in `.config/nvim/init.vim` will remap it to the `F2` key. Note, the resulting split window among Nvim and R behaves like a split viewport in `nvim` or `vim` meaning the usage of `Ctrl-w w` followed by `i` and `Esc` is important for navigation.

```sh
nvim myscript.R # or *.Rmd file
```

__3. Send R code from nvim to the R pane__

Single lines of code can be sent from nvim to the R console by pressing the space bar. To send 
several lines at once, one can select them in nvim's visual mode and then hit the space bar. 
Please note, the default command for sending code lines in the nvim-r-plugin is `\l`. This key 
binding has been remapped in the provided `.config/nvim/init.vim` file to the space bar. Most other key bindings (shortcuts) still start with the `\` as LocalLeader, _e.g._ `\rh` opens the help for a function/object where the curser is located in nvim. More details on this are given below.


### Important keybindings for tmux

__Pane-level commands__

* `Ctrl-a %`: splits pane vertically
* `Ctrl-a "`: splits pane horizontally
* `Ctrl-a o`: jumps cursor to next pane
* `Ctrl-a Ctrl-o`: swaps panes
* `Ctrl-a <space bar>`: rotates pane arrangement
* `Ctrl-a Alt <left or right>`: resizes to left or right
* `Ctrl-a Esc <up or down>`: resizes to left or right

__Window-level comands__

* `Ctrl-a n`: switches to next tmux window 
* `Ctrl-a Ctrl-a`: switches to previous tmux window
* `Ctrl-a c`: creates a new tmux window 
* `Ctrl-a 1`: switches to specific tmux window selected by number

__Session-level comands__

* `Ctrl-a d`: detaches from current session
* `Ctrl-a s`: switch between available tmux sesssions
* `$ tmux new -s <name>`: starts new session with a specific name
* `$ tmux ls`: lists available tmux session(s)
* `$ tmux attach -t <id>`: attaches to specific tmux session  
* `$ tmux attach`: reattaches to session 
* `$ tmux kill-session -t <id>`: kills a specific tmux session
* `Ctrl-a : kill-session`: kills a session from tmux command mode that can be initiated with `Ctrl-a :`

## For Bash, Python and other languages

### Basics

For languages other than R one can use the
[vimcmdline](https://github.com/jalvesaq/vimcmdline) plugin for nvim (or vim).
Supported languages include Bash, Python, Golang, Haskell, JavaScript, Julia,
Jupyter, Lisp, Macaulay2, Matlab, Prolog, Ruby, and Sage. The nvim terminal
also colorizes the output, as in the screenshot below, where different colors
are used for general output, positive and negative numbers, and the prompt
line.

<center><img title="vimcmdline" src="https://cloud.githubusercontent.com/assets/891655/7090493/5fba2426-df71-11e4-8eb8-f17668d9361a.png" ></center>
<center>vimcmdline</center>

### Install

To install it, one needs to copy from the `vimcmdline` resository the directories
`ftplugin`, `plugin` and `syntax` and their files to `~/.config/nvim/`. For
user accounts of UCR’s HPCC, the above install script `Install_Nvim-R_Tmux` (old: `install_nvimRtmux`) includes the 
install of `vimcmdline` (since 09-Jun-18).

### Usage

The usage of `vimcmdline` is very similar to `nvim-R`. To start a connected terminal session, one
opens with nvim a code file with the extension of a given language (_e.g._ `*.sh` for Bash or `*.py` for Python), 
while the corresponding interactive interpreter session is initiated
by pressing the key sequence `\s` (corresponds to `\rf` under `nvim-R`). Subsequently, code lines can be sent 
with the space bar. More details are available [here](https://github.com/jalvesaq/vimcmdline). 
