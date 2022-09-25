---
title: Login
linkTitle: Login
type: docs
aliases:
    - /manuals_linux-basics_intro.html
    - /manuals_linux-basics_intro
    - /manuals/hpc_cluster/login
---

## Requirements

A user account is required to access HPCC's research computing infrastructure.
How to obtain a user account is described
[here](https://hpcc.ucr.edu/about/facility/access/). For external users it is
important to know that the below [Password+DUO](#passwordduo) multifactor
authenication system is only available to UCR users. Thus, external users have
to use the alternative [SSH Key](#ssh-keys) based authentication method, which
is both secure and convenient to use. 

The login instructions of this page are organized in three sections:

A. [SSH Login via Terminal](#a-ssh-login-from-terminal)
B. [Web-based Access](#b-web-based-access)
C. [Data Sharing Access](#c-data-sharing-access)

## A. `SSH` Login from Terminal

Terminal-based login is the most feature-rich method for accessing HPC
resources. Web-based alternatives via Jupyter Hub and RStudio Server are also provided 
and introduced [below](#b-web-based-access). To access the HPCC cluster with the standard
`ssh` protocol, users want to follow steps 1-3. Only step 1 is required after 
setting up ssh key based access.


__1.__ Type the following `ssh` login command from a terminal application, where `<username>` needs to be replaced by the actual account name of a user. The `<>` characters indicate a placeholder and need to be removed. Next, press enter to execute the `ssh` command.

```bash
ssh -X <username>@cluster.hpcc.ucr.edu
```

The `-X` argument enables X11 support, which is required for opening GUI applications on remote systems.

__2.__ Type your password and hit enter. Note, when typing the password the cursor will not move and nothing is printed to the screen. If ssh key access is enabled, both the password and Duo steps will be skipped automatically during the log in process.

__3.__ Follow the Duo multifactor authenication instructions printed to the screen. As external users do not have access to UCR's Duo system, they can only log in via the alternative ssh key method. How to enable ssh keys is described [here](#ssh-keys). Note, Duo will be bypassed if ssh key based login is enabled. This can be more conveniet than Duo when accessing the cluster frequently. 
    
+ If the login is performed via a GUI application, which is an option in MobaXterm),
then one can provide the same login information given under the above `ssh`
commad in the corresponding fields of the login window as follows:

    + Host name: `cluster.hpcc.ucr.edu`
    + User name: ...
    + Password: ...

__Importantly__, after the first login into a new account or a password reset,
users need to change their password with the `passwd` command and then follow
the on-screen instructions. This requires to enter the current password once
and then enter the new password twice. New passwords need to be at least 8 characters 
long and meet at least 3 of the following requirments: lowercase character, 
uppercase character, number, and punctuation character.


### Terminal Options

Various ssh terminal applications are available for all major operating systems. Examples include:

+ macOS: built-in macOS [Terminal](https://support.apple.com/guide/terminal/welcome/mac) or [iTerm2](https://iterm2.com/) 
+ Windows: [MobaXterm](http://mobaxterm.mobatek.net/) is a very feature rich terminal options for Windows users. [Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) is an alternative, but outdated and not recommended anymore. [Here](https://mobaxterm.mobatek.net/demo.html) are annimated usage introductions for MobaXterm.
+ Linux: a wide range of Terminal applications is available for Linux. Usually, the default terminal available on a Linux distributions will be sufficient. 
+ ChromeOS: after enabling Linux apps on Chromebooks one can use the default terminal that is similar to those on Linux systems. 

### Remote Graphics Support

X11 support is included in the terminal applications of most OSs. This includes MobaXterm on Windows, Linux and ChromeOS terminals. On macOS systems, users need to run XQuartz 
in the background to enable X11 graphics display support. XQuartz can be downloaded from [here](https://www.xquartz.org/) (also see this video [here](https://www.youtube.com/watch?v=uS4zTqfwSSQ)). 
Note, the install of XQuartz can be skipped if remote graphics support is not needed.
    

## Additional Authentication Details

In early 2022 the HPCC adopted a more secure authentication method for logging
into its clusters. Passwords alone will no longer be allowed for `SSH` or file
tansfer protocols. Instead [Password+DUO](#passwordduo) or [SSH
Keys](#ssh-keys) will be required. Because `Password+DUO` authentication requires
a UCR NetID, this access method is only available to UCR users for both `ssh` and
file transfer protocols (_e.g._ sFTP or SCP). Thus, external users need to use the 
alternative ssh key method. To enable ssh key access, the public key needs to be emailed to
[support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) (see below for details).
One exception are web-based services where password-based access doesn't require
Duo multifactor authenication or ssh keys.

### Password+Duo

Users familiar with UCR's Duo system can log in to HPCC's clusters by following the
on screen instructions during the [ssh login](#log-in-via-ssh-from-terminal). For new users, instructions 
for UCR's Duo Multifactor Authenication system are available
in this [PDF](https://its.ucr.edu/sites/default/files/2018-06/Multi-Factor%20Authentication%20Handout.pdf)
and on UCR's [MyAccount](https://its.ucr.edu/blog/2020/06/11/customer-support-enhancements-myaccount)
page. Importantly, the login via the `Password+DUO` method will only work if a
user's NetID matches the username of the corresponding HPCC account. If
this is not the case then the HPCC username can be changed to a user's NetID.
This change can be initiated by emailing [suppor@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).
As mentioned above, external users will not have access to UCR's Duo system, and thus have to use
the alternative [ssh key](#ssh-keys) access method to log in to HPCC's resources.

### SSH Keys

Ssh keys are an access credential used by the Secure Shell (SSH) protocol. For this a key pair is
created comprised of a private key and a public key. The private key remains on a user's system and should 
not be shared. The public key will be uploaded to the remote system, here `~/.ssh` directory of a user's account
on the HPCC cluster. Ssh key based access works analogous to how a key and a lock are used in the real world, where 
one uniquely fits into the other. Access can only be established if the private key on a user's system _fits_ the 
public key on the remote system.

The following introduces how to create an ssh key pair from the command-line in a [terminal](#terminal) and upload the
public key to the remote system. The latter upload will only work if a user can access the remote system, 
_e.g._ via temporary [Password+DUO](#passwordduo) access. User without this option have to email their public
ssh key to [suppor@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) so that the systems administrator can upload the 
public key for them. Additional details on ssh key generation and uploads are provided [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/).
This includes GUI based based options. However, we highly recommend to use the command-line options which are
much more straigthforward to use, including [MobaXterm](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/sshkeys_winos/#create-ssh-keys-mobaxterm) on Windows systems. 

#### (a) SSH Key Creation

An ssh key pair can be created with the following commands in a [terminal](#terminal) application of all major
operating systems, including Windows, macOS, Linux and ChromeOS.

__1.__ Create SSH directory

```bash
mkdir -p ~/.ssh
```
__2.__ Create key pair (private and public)

```bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa
```

Follow the prompts and complete the processes. Once the command has completed, one will find two files in the `~/.ssh` directory of 
a user account.

__3.__ Inspect `~/.ssh`  directory

```bash 
ls ~/.ssh/
  id_rsa
  id_rsa.pub
```

#### (b) SSH Key Upload

The `id_rsa` and `id_rsa.pub` files are the private and public keys,
respectively. The private key should never be shared with anyone. This means it
should not be emailed or uploaded to a remote system. Only the public key will
be uploaded to the remote system, here HPCC user account. Specifically, the public key will
be stored in a file called `authorized_keys` under a directory called `~/.ssh`.
If not present yet both need to be created. Note, `~/` refers to the higest (root)
level of a user account. 

__1.__ Upload of first public ssh key

If the `authorized_keys` doesn't exist yet, the following `scp` command can be run from a user's system. 
This command will create the `~/.ssh/authorized_keys` file and populate it with the public key.

```bash
scp .ssh/id_rsa.pub username@cluster.hpcc.ucr.edu:.ssh/authorized_keys
```

__2.__ Upload of subsequent public ssh keys

If the `authorized_keys` file already exists, one can append the new public key as follows.

```bash
scp .ssh/id_rsa.pub username@cluster.hpcc.ucr.edu:tmpkey && ssh username@cluster.hpcc.ucr.edu "cat tmpkey >> ~/.ssh/authorized_keys && rm tmpkey"
```

__3.__ Check ssh key based access

To test whether ssh key based access is functional, then the following log in should work without asking for a password. However,
it may ask for a passphrase if the ssh key pair was created this way. 

```bash
ssh <username>@cluster.hpcc.ucr.edu
```

#### (c) Additional Details on SSH Keys

See [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/).


## B. Web-based Access 

Web-based HPCC cluster access is provided via [RStudio Server](https://rstudio.hpcc.ucr.edu) and [JupyterHub](https://jupyter.hpcc.ucr.edu). 
Users with an HPCC cluster account can access them with the same login credential used for [ssh access](#a-ssh-login-from-terminal). The `Username+Password` 
authentication method with Duo is currently not required for these services. For load balancing RStudio Server has two instances:
[RStudio Server 1](https://rstudio.hpcc.ucr.edu) and [RStudio Server 2](http://rstudio2.hpcc.ucr.edu). If one of these services
is slow or not available, users want to choose the alternative option. A much more efficient method for using RStudio Server is
provided via a custom compute node instance using `srun`. This option is described [here](https://hpcc.ucr.edu/manuals/linux_basics/text/#2-compute-node-instance).


## C. Data Sharing Access

Users accessing HPCC's infrastructure mainly for file transfers and data sharing want to 
follow the corresponding instructions on the [Data Sharing](https://hpcc.ucr.edu/manuals/hpc_cluster/sharing/#file-transfers) page.




