---
title: Login
linkTitle: Login
type: docs
aliases:
    - /manuals_linux-basics_intro.html
    - /manuals_linux-basics_intro
    - /manuals/hpc_cluster/login
---

## Resouce Types

There are several ways to access the cluster, depending on what resources you want to use:

   * [Web Services](#web-services) - Basic programming and testing
   * [File Transfers](#file-transfers) - Uploading/Downloading files
   * [Terminal](#terminal) - Running full analysis via jobs and much more ...

Our various `Web Services` do not require DUO authentication, only your cluster username and password.
However, `File Transfers` and `Terminal` (SSH) access do require either [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys).

## Authentication

We are moving all accounts to a more secure method of authentication for logging into the cluster.
Passwords alone will no longer be allowed via `SSH`, instead [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys) will be required.

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
This is becuase in order to get this working a file needs to be placed in your home directory on the cluster.
If you have, or will have a UCR NetID, then be sure to configure [Password+DUO](#passwordduo) before proceeding.

When using SSH key authentication, you will need to create a public and a pritate key.
This is analogous to how a key and a lock are used in the real world, one uniquely fits to the other.
Only when your private key "fits" the public key, can you be granted access.

We will be showing you how to do this in your computers [terminal](#terminal).
Alternatively, instructions using a graphical user interface (GUI) can be found [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/).

To create the key pair run the following command on your computer ([terminal](#terminal)):

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

If you are not able to confiugre [Password+DUO](#passwordduo) then contact [support](mailto:support@hpcc.ucr.edu) and provide your public key (`id_rsa.pub`).

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

#### Change Password

1. Log-in to the cluster via SSH
2. Once you have logged in, type the following command:
   `passwd`
3. Enter your current password (the random characters that you were given as your initial password)
4. Enter your new password (you will be asked to type it twice for verification)

#### Minimum password requirements

* Total length at least 8 characters long
* Must have at least 3 of the following:
  * Lowercase character
  * Uppercase character
  * Number
  * Punctuation character

