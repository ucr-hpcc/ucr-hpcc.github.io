---
title: Terminal-based Working Environments 
linkTitle: Terminal-based Working Environments 
type: docs
weight: 10
aliases:
    - /manuals_linux-cluster_terminalIDE.html
    - /manuals_linux-cluster_terminalIDE
---

# Terminal IDEs
This page introduces several terminal-based working environments available on UCR's
HPC cluster that are useful for a variety of computer languages.


## Vim/Nvim Basics

To work efficiently on remote systems like a computer cluster, it is essential
to learn how to work in a pure command-line interface. GUI environments like
RStudio and similar coding environments are not suitable for this. In addition,
there is a lot of value of knowing how to work in an environment that is not
restricted to a specific programming language. Therefore, for working on remote 
systems like HPCC Cluster, this site focuses on Nvim and Tmux. Both are useful 
for many programming languages. Combinded with the `nvim-r` plugin they also 
provide a powerful command-line working environment for R. Users of Emacs may 
want to consider using [ESS](https://ess.r-project.org/) instead. The following 
provides a brief introduction to the Nvim-R-Tmux environment. 

### Vim overview

The following opens a file (here `myfile`) with nvim (or vim)

```sh
nvim myfile.txt # for neovim (or 'vim myfile.txt' for vim)
```

Once you are in Nvim, there are three main modes: normal, insert and command mode. The most important commands for switching between the three modes are:

* `i`: The `i` key brings you from the normal mode to the insert mode. The latter is used for typing. 
* `Esc`: The `Esc` key brings you from the insert mode back to the normal mode.
* `:`: The `:` key starts the command mode at the bottom of the screen.

Use the arrow keys to move your cursor in the text. Using `Fn Up/Down key` allows to page through
the text quicker. In the following command overview, all commands starting with `:` need to be typed in the command mode. 
All other commands are typed in the normal mode after pushing the `Esc` key. 

Important modifier keys to control vim/nvim

* `:w`: save changes to file. If you are in editing mode you have to hit `Esc` first.
* `:q`: quit file that has not been changed
* `:wq`: save and quit file
* `:!q`: quit file without saving any changes

### Useful resources for learning vim/nvim

* [Interactive Vim Tutorial](http://www.openvim.com)
* [Official Vim Documentation](http://vimdoc.sourceforge.net/)
* [HPCC Linux Manual](/manuals/linux_basics/vim/)

## For R: nvim-R 

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
instructions](https://gist.github.com/tgirke/7a7c197b443243937f68c422e5471899) to install Nvim-R-Tmux from scratch on your own system.

1. Log in to your user account on HPCC and execute `Install_Nvim-R_Tmux` (old: `install_nvimRtmux`). Alternatively, follow these step-by-step [install commands](https://github.com/tgirke/Install_Nvim-R_Tmux).
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

### Important keybindings for nvim

The main advantages of Neovim compared to Vim are its better performance and its built-in terminal emulator facilitating the communication among Neovim and interactive programming environments such as R. Since the Vim and Neovim environments are managed independently, one can run them in parallel on the same system without interfering with each other. The usage of Neovim is almost identical to Vim.

__Nvim commands__

* `\rf`: opens vim-connected R session. If you do this the first time in your user account, you might be asked to create an `R` directory under `~/`. If so approve this action by pressing `y`. 
* `spacebar`: sends code from vim to R; here remapped in `init.vim` from default `\l`
* `:split` or `:vsplit`: splits viewport (similar to pane split in tmux)
* `gz`: maximizes size of viewport in normal mode (similar to Tmux's `Ctrl-a z` zoom utility) 
* `Ctrl-w w`: jumps cursor to R viewport and back; toggle between insert (`i`) and command (`Esc`) mode is required for navigation and controlling the environment.
* `Ctrl-w r`: swaps viewports
* `Ctrl-w =`: resizes splits to equal size
* `:resize <+5 or -5>`: resizes height by specified value
* `:vertical resize <+5 or -5>`: resizes width by specified value
* `Ctrl-w H` or `Ctrl-w K`: toggles between horizontal/vertical splits
* `Ctrl-spacebar`: omni completion for R objects/functions when nvim is in insert mode. Note, this has been remapped in `init.vim` from difficult to type default `Ctrl-x Ctrl-o`. 
* `:h nvim-R`: opens nvim-R's user manual; navigation works the same as for any Vim/Nvim help document
* `:Rhelp fct_name`: opens help for a function from nvim's command mode with text completion support
* `Ctrl-s and Ctrl-x`: freezes/unfreezes vim (some systems)

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
