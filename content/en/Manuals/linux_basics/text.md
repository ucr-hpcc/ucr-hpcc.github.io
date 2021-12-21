---
title: Text Editors
linkTitle: Text Editors
type: docs
weight: 6
aliases:
    - /manuals_linux-basics_text.html
    - /manuals_linux-basics_text
---

## Text Viewing

Here are a few commands that are used to just display the text within a file:

```bash
more <FILENAME>     # Views text, use space bar to browse, 'q' to quit
less <FILENAME>     # Also views text, uses arrow keys to browse, 'q' to quit
cat  <FILENAME>     # Concatenates files and prints content to screen
```

## Text Editors

* **Nano**
  * A simple terminal-based editor.
* **Neovim**
  * Non-graphical (terminal-based) editor. Neovim is an improved version of vim.
* **Vim** **Gvim**
  * Non-graphical (`vim`) or window-based editor (`gvim`). Vim is the improved version of vi.
* **Emacs**
  * Non-graphical or window-based editor.
* **Atom**
    * Window-based editor that runs on your local machine.
* **Visual Studio Code**
    * Graphical editor that runs on your local machine that supports different plugins.

## Nano

The `nano` editor is the simplest to use and can be good for beginners:

```bash
nano <FILENAME>     # Open file if it exists, or create it
```

Navigation in `nano` uses the arrow keys, and all other commands are noted at the bottom of the screen.
The `CTRL` key is used in combination with other keys to execute commands in `nano`.

For example, at the bottom of the `nano` screen it is noted that `^X` is used to exit.
This means you will need to hold the `CTRL` key and then press `x` in order to quit.
After that, just follow the on screen prompts at the bottom.

For more `nano` commands, please visit [Overview of nano shortcuts](https://www.nano-editor.org/dist/latest/cheatsheet.html).

## Neovim / Vim / GVim / VI

All of these editors follow the same principals.

```bash
nvim <FILENAME>     # Open file if it exists, or create it
vim <FILENAME>      # Open file if it exists, or create it
gvim <FILENAME>     # Open file if it exists, or create it (must have XForwarding or VNC)
vi <FILENAME>       # Open file if it exists, or create it
```

For more information please visit [Vim Manual](/manuals/linux_basics/vim/).

## Emacs

Navigation in `emacs` also uses the arrow keys. It is similar to `nano`, in that, `CTRL` is combined with other keys to execute commands.

For example, to open a file, simply run the command with a file name:

```bash
emacs <FILENAME>     # Open file if it exists, or create it
```

Then, after you have made some changes, exit by holding the `CTRL` key and then pressing `c`, releasing and then holding the `CTRL` key once more and pressing `c` again.
After that, just follow the on screen prompts at the bottom.

For more commands in `emacs` please visit [GNU Emacs Reference Card](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)

## Atom

### Install
This editor should be installed on your local machine (ie. workstation, laptop).
Please visit [Atom](https://atom.io/) for software download.

### Remote Atom

After you have `atom` installed, you need to install the `Remote Atom` plugin.
Click on `edit`, then `preferences`, then look for the `install` item on the left side menu.
You should then be able to type `remote-atom` in the search field, find it and install it.
After installation, `atom` should restart.

### Start Server

Once you have `remote-atom` installed, click `Packages` in the top menu, then `Remote Atom`, and then click `Start Server`.
`Atom` may need to be restarted in order for you to see these new menu items.

### Cluster

SSH into cluster using a socket (replace `<USERNAME>` with your real username on the cluster):

```bash
ssh -R /rhome/<USERNAME>/.rmate.socket:localhost:52698 cluster.hpcc.ucr.edu
```

> Note: Do not use a remote PORT, you must use a SOCKET FILE as shown above. There are security issues otherwise.

After you have logged into the cluster load `rmate` (alias is optional):

```bash
module load rmate
alias ratom=rmate
```

You can add this into your `~/.bashrc` for convenience.

Then you should be able to open a file on the cluster and have it appear on your local machine:

```bash
rmate <FILENAME>
```

Once you have finished all your editing and close `atom`, be sure to delete the socket file from the cluster:

```bash
rm -f /rhome/<USERNAME>/.rmate.socket'
```

For more information regarding `remote-atom`, please visit [Remote-Atom](https://atom.io/packages/remote-atom).

## Visual Studio Code

### Install

This editor should be installed on your local machine (ie. workstation, laptop).
Please visit [Visual Studio Code](https://code.visualstudio.com/download) for software download.

### Remote Editing

To setup Visual Studio Code to remotely edit files on the cluster, please go to slides 13 on this [guide](https://docs.google.com/presentation/d/1pEXb4H47atpWruV0qxoYcZxtLc3dPk9ehIXNkf8Zv1g/edit?usp=sharing)

## RStudio Server

Two options exist to access the `RStudio Server` [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment):

  1. Shared Web Instance
  2. Private Compute Node

While the `Shared Web Instance` is easier for less experienced users, it does not allow to load a specific R version nor access more extensive computing resources.
Thus, experienced users may prefer the `Private Compute Node` as it does not share these limitations.

#### Shared Web Instance

R users can log in to their HPCC accounts via an RStudio Server instance.
To do so, visit the [HPCC RStudio Server](https://rstudio.hpcc.ucr.edu).
Next provide your HPCC login credentials and click the `Sign In` button.

#### Private Compute Node

Alternatively, an RStudio Server instances can be started directly on a compute node and accessed via an SSH tunnel.
This involves the following steps.
    
  1. SSH into the cluster as outlined [here](https://hpcc.ucr.edu/manuals/linux_basics/intro/).
   
  2. Log in to a compute node interactively via `srun`, where the proper parameters need to be specified by the user.
  These include partition name, RAM, number of CPU cores, wall time limit, etc. Additional details on using `srun` are available 
  [here](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#submitting-jobs).
   
   ```bash
   srun --partition=short --mem=8gb --cpus-per-task=2 --ntasks=1 --time=2:00:00 --pty bash -l
   ```
   
  3. Load the latest versions of `R` and `RStudio Server` from module system:

   ```bash
   module unload R
   module load R/4.1.1_gcc-8.3.0 # Or latest version
   module load rstudio-server/2021.09.1-372 # Or latest version
   ```

  4. Start RStudio Server:
   
   ```sh
   start-rserver.sh
   ```

  5. Next follow the instructions printed to the terminal after running `start-rserver.sh`. The command-lines given 
  in these instructions need be executed in a terminal of a user's local system, and not on the remote system where
  `start-rserver.sh` was exectuted.
  
Of course these steps can be integrated into a script and submitting non-interactvely for a quicker deployment of a private `RStudio Server`, instructions are outlined [here](https://github.com/ucr-hpcc/hpcc_slurm_examples/blob/master/rstudio-server/README.md#non-interactive).
