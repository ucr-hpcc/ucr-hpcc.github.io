---
title: Login
linkTitle: Login
type: docs
aliases:
    - /manuals_linux-basics_intro.html
    - /manuals_linux-basics_intro
    - /manuals/hpc_cluster/login
---

## Log in with `SSH` from Terminal

Terminal-based login is the most feature-rich method for accessing HPC
resources. Web-based alternatives via Jupyter Hub and RStudio Server are also provided 
and introduced [below](). To access the HPCC cluster with the standard
`ssh` protocol, users want to follow steps 1-3. 

__1.__ Type the following `ssh` login command from a terminal application (see below), where the string `<user>` needs to be replaced by a user's account name. The `<>` characters indicate a placeholder and need to be removed. Next press enter to execute the command.

```sh
ssh -X <username>@cluster.hpcc.ucr.edu
```

Note, the `-X` argument enables X11 support, which is required for opening GUI applications on remote systems.

__2.__ Type your password and hit enter. Note, when typing the password the cursor will not move and nothing is printed to the screen. If ssh key access is enabled, the password step will be skipped.

__3.__ Follow the Duo multifactor authenication instructions printed to the screen. As external users do not have access to UCR's Duo system, they can only log in via the alternative ssh key method. How to enable ssh keys is described [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/). Note, Duo will be bypassed if ssh key based login is enabled. This can be more conveniet than Duo when accessing the cluster frequently. 
    
+ If the login is performed via a GUI application (one option in MobaXterm),
then one can provide the same login information given under the above ssh
commad in the corresponding fields of a login window as follows:

    + Host name: `cluster.hpcc.ucr.edu`
    + User name: ...
    + Password: ...

__Importantly__, after the first login into a new account or a password reset,
users need to change their password with the `passwd` command and then follow
the on-screen instructions. This requires to enter the current password once
and then enter the new password twice. The minimum requirements for the new
password are: total length at least 8 characters and at least 3 of the following
requirments need to be met: lowercase character; uppercase character; number; 
and punctuation character.


The following provides additional details.

+ Various terminal applications are available for all major operating systems. Examples include:
    + macOS: built-in macOS [Terminal](https://support.apple.com/guide/terminal/welcome/mac) or [iTerm2](https://iterm2.com/). 
    + Windows: [MobaXterm](http://mobaxterm.mobatek.net/) is very feature rich terminal options for Windows users. [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) is an alternative, but outdated and not recommended anymore. [Here](https://mobaxterm.mobatek.net/demo.html) is are annimated usage introductions for MobaXterm.
    + Linux: a wide range of Terminal applications is available for Linux. Usually, the default versions available on most Linux distributions will be sufficient. 
    + ChromeOS: after enabling Linux apps on Chromebooks or Chromeboxes one can use the default terminal that is similar to those on Linux systems. 

+ X11 support is included in the terminal applications of most OSs, including MobaXterm on Windows. On macOS systems, users need to run XQuartz in the background to enable X11 graphics display support. XQuartz can be downloaded from [here](https://www.xquartz.org/) (also see this video [here](https://www.youtube.com/watch?v=uS4zTqfwSSQ)).   
    
+ Additional login information can be found on the following sections:

    + Duo Multifactor Authenication: [here](https://hpcc.ucr.edu/manuals/login/#passwordduo) 
    + UCR Duo Manual: [here](https://its.ucr.edu/sites/g/files/rcwecm321/files/2018-06/Multi-Factor%20Authentication%20Handout.pdf)
    + SSH Keys: [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/)


## Additional Authentication Details

In early 2022 the HPCC adopted a more secure method of authentication for logging into the cluster.
Passwords alone will no longer be allowed via `SSH`, instead [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys) will be required.
Since `Password+DUO` authentication requires a UCR NetID, this access method is only available to
UCR users. External users need use the SSH key method. To enable ssh key access, the public key needs to 
be emailed to support (see below for details).

### Password+Duo

The `Password+DUO` combination method will only work if your UCR NetID matches your cluster username.

If your cluster user name does not match your UCR NetID, however you wish to change your cluster username so that it does, please send in a username change request to [support](mailto:support@hpcc.ucr.edu).

After they match then first check if you already have DUO installed and configured on a mobile device.
If you already have used DUO with other UCR campus multi-factor enabled sites or utilites, great!
If you wish to modify your DUO configuration, you may do so [here](https://myaccount.ucr.edu/)
Otherwise, if you have not yet installed, nor configured DUO on a mobile device, then you will need to do so by enrolling [here](https://its.ucr.edu/blog/2020/06/11/customer-support-enhancements-myaccount).

Once you have DUO installed and configured on your mobile device, then retrieve your password for the cluster.
If you have a new account then your password was emailed to you when your account was created.

### SSH Keys

SSH keys can only be setup if you already have access to the cluster.
This is becuase in order to get this working a file (public key) needs to be placed in your home directory on the cluster.
If you have, or will have a UCR NetID, then be sure to configure [Password+DUO](#passwordduo) before proceeding. If you 
never intend to have a UCR NetID, then you may create your keys according to the below instructions. However, you will 
need to contact support in order to copy your resulting public key to the cluster.

When using SSH key authentication, you will need to create a public and a pritate key.
This is analogous to how a key and a lock are used in the real world, one uniquely fits to the other.
Only when your private key "fits" the public key, can you be granted access.

The following shows to do this from the command-line in a [terminal](#terminal) application. This command-line approach 
works almost exactly the same way on all three major OSs including Linux, Mac OS X and Windows using MobaXterm. 
Alternatively, instructions using a graphical user interface (GUI) can be found [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/).

To create the key pair, run the following command in your computer's [terminal](#terminal):

```
# Create SSH directory
mkdir -p ~/.ssh

# Create key pair (Private and Public)
ssh-keygen -t rsa -f ~/.ssh/id_rsa
```

Follow the prompts and complete the processes.
Once the command has completed, you will find two files in your `~/.ssh` directory.

```
# List files in SSH directory
ls ~/.ssh/
  id_rsa
  id_rsa.pub
```

The `id_rsa` file is your private key (do not share this) and the `id_rsa.pub` is your public key.
You will need to copy your public key to the cluster, creating the `authorized_keys` file.

If you are not able to configure [Password+DUO](#passwordduo) then contact [support](mailto:support@hpcc.ucr.edu) and provide your public key (`id_rsa.pub`).

If you already have configured [Password+DUO](#passwordduo), then run the follwing from your computer [terminal](#terminal):

```
scp .ssh/id_rsa.pub username@cluster.hpcc.ucr.edu:.ssh/authorized_keys
```

If the `authorized_keys` file already exists, you can just append your new public key, like so:

```
scp .ssh/id_rsa.pub username@cluster.hpcc.ucr.edu:tmpkey && ssh username@cluster.hpcc.ucr.edu "cat tmpkey >> ~/.ssh/authorized_keys && rm tmpkey"
```

In order to test this try to log into the cluster again:

```bash
ssh username@cluster.hpcc.ucr.edu
```

Remember to replace `username` with your real cluster username.
When logging in this time it should no longer ask for your `password` nor `DUO` authentication, however it may ask for a passphrase depending on how you created your key.

> Note: MS Windows (MobaXterm) can also use the graphical SSH keys manager "MobaKeyGen" (from the "Tools" menu).

## Resouce Types

There are several ways to access the cluster, depending on what resources you want to use:

   * [Web Services](#web-services) - Basic programming and testing
   * [File Transfers](#file-transfers) - Uploading/Downloading files
   * [Terminal](#terminal) - Running full analysis via jobs and much more ...

Our various `Web Services` do not require DUO authentication, only your cluster username and password.
However, `File Transfers` and `Terminal` (SSH) access do require either [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys).

## Web Services

All web services (ie. [RStudio Server](http://rstudio.hpcc.ucr.edu) and [JupyterHub](https://jupyter.hpcc.ucr.edu)) simply use the `Username+Password` authentication method, `DUO` authentication is not currently required.

## File Transfers

> First, you must configure your [authentication method](#authentication).
> Also note that you CANNOT use the "Quickconnect" button from the main window to connect.

When using `FileZilla` you must create a new site to connect, click `File -> Site Manager`.
From the new window click `New Site`.

On the right pane of the `General` tab fill in the information as follows:

```
Protocol: SFTP
Host: cluster.hpcc.ucr.edu
Logon Type: Interactive
User: YOUR_CLUSTER_USER_NAME
```

Remeber to fill in `YOUR_CLUSTER_USER_NAME` with your actual cluster username.
The `Logon Type` can be either `Interactive` or `Key File`, this depends on if you have setup [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys) respectively.

If you choose a `Password+DUO` authentication, then you should also configure the max connections.
Navigate to the `Transfer Settings` tab and set the following:

```
    Limit Number of simultaneous connections: checked
    Maximum number of connections: 1
```

After all of the above has been completed, then you can click "OK" to save the new site.
Then from the main window you can click the arrow next to the site lists, or just reopen the Site Manager and click the "connect" button from your new site window.

## Terminal

The `terminal` is a tool to gain access to the command line.
You will need to use your `terminal` to run the `ssh` command in order to gain access to the cluster.

The `ssh` command (client) is used to directly connect to the cluster (server).
This is similar to using an internet browser (client) to connect to a website (server).
There are many `SSH` clients that would be sufficient, however we officially support the command line versions below.

### MS Windows

If you are using a MS Windows computer, then use `MobaXTerm`:

1. Download and install MobaXTerm [Download MobaXTerm](https://mobaxterm.mobatek.net/download-home-edition.html)
2. Run `MobaXTerm` application
3. Click on "Start local terminal" in the center of the window

### MacOS

If you are using a MacOS computer, then use the built in `terminal` or `iterm2`:

1. Download and install [XQuartz](https://www.xquartz.org/) *optional* (graphics support)
2. Download and install [iterm2](https://www.iterm2.com/downloads.html) *optional*
3. Run `terminal` or `iterm2` application

### Linux

If you are using a GNU/Linux computer, then it is very likely that you have a terminal built in and already know how to open it.
If not, then try to search the internet for instructions, if that fails email [support](mailto:support@hpcc.ucr.edu).

### First Login

Once you have a `terminal` open type `ssh username@cluster.hpcc.ucr.edu` and hit enter.
Make sure you replace the `username` above with your real cluster username.

Assuming that you have already installed and configured DUO on a mobile device, then when attempting to login you will be first asked to provide your password, and then you will need to choose your DUO authentication option to validate your login attempt.
Depending on how you chose to configure/enrolling your mobile device, you may see multiple options.

DUO uses either an option for DUO authentication via `Push` which uses the mobile app, or via `SMS` which sends a code as a text message to your phone.
Choose whichever option works best for you.

>IMPORTANT!!! New users are expected to change their temporary password with the `passwd` command upon successful login.


