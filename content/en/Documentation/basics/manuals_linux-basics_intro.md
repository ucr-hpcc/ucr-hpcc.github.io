---
layout: page
title: Access
permalink: manuals_linux-basics_intro.html
---

## How to Get Access?

Many of the commands referenced here may work in any local `bash` shell, however we will focus on running these on the Linux HPC cluster.
In order to gain access to the cluster, you will need to request an account and also download an SSH client.

* Users at UC Riverside can apply for an account on our Linux clusters by sending an account request to Support (support@hpcc.ucr.edu).
* Install your preferred ssh client on your local machine (we can help you with this).

### Windows

1. Open MobaXTerm [Download MobaXTerm](https://mobaxterm.mobatek.net/download-home-edition.html)
2. Click on "Start local terminal" in the center of the window.

### Mac

1. Download and install [XQuartz](https://www.xquartz.org/), this is optional and only needed if you want X11 Forwarding.
2. Open Terminal or [iterm2](https://www.iterm2.com/downloads.html)

### Logging in

* Now that you have a terminal open, execute the following on the command line:
  `ssh -X myusername@cluster.hpcc.ucr.edu`

  `myusername` is your username on the cluster.
  You will be asked to enter your password. Simply type it (even if you cannot see anything) and press enter.

## Change Password

1. Log-in to the cluster via SSH
2. Once you have logged in, type the following command:
   `passwd`
3. Enter your current password (the random characters that you were given as your initial password)
4. Enter your new password (you will be asked to type it twice for verification)

### Minimum password requirements

* Total length at least 8 characters long
* Must have at least 3 of the following:
  * Lowercase character
  * Uppercase character
  * Number
  * Punctuation character
