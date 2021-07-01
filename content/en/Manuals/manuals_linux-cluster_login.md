---
layout: page
title: Linux Cluster - Login
permalink: manuals_linux-cluster_login.html
---

## Login

We are moving all accounts to a more secure method of authentication for logging into the cluster.
Passwords alone will no longer be allowed, but rather [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys).

Roll-Out Plan:

1. Old (password) and new (secure) authentication methods are provided through `cluster.hpcc.ucr.edu` and `secure.hpcc.ucr.edu` respectively.
2. Users configure new authentication method.
3. Users log into the cluster using host `secure.hpcc.ucr.edu`.
4. After the authentication switch over deadline (TBD), host `cluster.hpcc.ucr.edu` switches over to new (secure) authentication methods. The old (password) authentication method is completely deprecated.

## Secure Authentication

There are two methods of authentication that the cluster supports:

1. [Password+DUO](#passwordduo)
2. [SSH Keys](#ssh-keys)

### Password+Duo

The `Password+DUO` combination method will only work if your UCR NetID matches your cluster username.
If these two match then first check if you already have DUO installed and configured on a mobile device.
If you already have used DUO with other UCR campus multi-factor enabled sites or utilites, great!
Otherwise, if you have not yet installed, nor configured DUO on a mobile device, then you will need to do so by enrolling:
[https://cnc.ucr.edu/mfa/enrollment.html](https://cnc.ucr.edu/mfa/enrollment.html)

Once you have DUO installed and configured on your mobile device, then retrieve your password for the cluster.
If you have a new account then your password was emailed to you when your account was created.

In order to test this try to log into the cluster through the `secure` server:

```bash
ssh username@secure.hpcc.ucr.edu
```

Remember to replace `username` with your real cluster username, which should also match your UCR NetID.

Assuming that you have already installed and configured DUO on a mobile device, then when attempting to login you will be first asked to provide your password, and then you will need to choose your DUO authentication option to validate your login attempt.
Depending on how you chose to configure/enrolling your mobile device, you may see multiple options.

DUO uses either an option for DUO authentication via `Push` which uses the mobile app, or via `SMS` which sends a code as a text message to your phone.
Choose whichever option works best for you.

After logging in successfully, you are expected to update your password with the `passwd` command.

For more general information regarding Multi-Factor Authentication and DUO, please visit the following:
[https://cnc.ucr.edu/mfa/how.html](https://cnc.ucr.edu/mfa/how.html)

### SSH Keys

SSH keys can only be setup if you already have access to the cluster.
This is becuase in order to get this working a file needs to be placed in your home directory on the cluster.

When using SSH key authentication, you will need to create a public and a pritate key.
This is analogous to how a key and a lock are used in the real world, one uniquely fits to the other.
Only when your private key "fits" the public key, can you be granted access.

To create the key pair run the following command on your computer ([Terminal](manuals_linux-basics_intro#mac)/[MobaXterm](manuals_linux-basics_intro#windows)):

```
# Create SSH directory
mkdir -p ~/.ssh

# Create key pair (Private and Public)
ssh-keygen -t rsa -f ~/.ssh/id_rsa
```

Once the command has completed, you will find two files in your `~/.ssh` directory.

```
# List files in SSH directory
ls ~/.ssh/
  id_rsa
  id_rsa.pub
```

The `id_rsa` file is your private key and the `id_rsa.pub` is your public key.
You will need to copy your public key to the cluster, creating the `authorized_keys` file.

From your computer ([Terminal](manuals_linux-basics_intro#mac)/[MobaXterm](manuals_linux-basics_intro#windows)) run the following:

```
scp .ssh/id_rsa.pub username@cluster.hpcc.ucr.edu:.ssh/authorized_keys
```

If the `authorized_keys` file already exists, you can just append your new public key, like so:

```
scp .ssh/id_rsa.pub username@cluster.hpcc.ucr.edu:tmpkey && ssh username@cluster.hpcc.ucr.edu "cat tmpkey >> ~/.ssh/authorized_keys && rm tmpkey"
```

In order to test this try to log into the cluster through the `secure` server:

```bash
ssh username@secure.hpcc.ucr.edu
```

Remember to replace `username` with your real cluster username, which should also match your UCR NetID.

> Note: MS Windows (MobaXterm) can also use the graphical SSH keys manager "MobaKeyGen" (from the "Tools" menu).

## File Transfers

We support `FileZilla` as the recommended graphical file transfer application. If you are comfortable with the command line that is typically easier to use.
However, there may be times when selecting multiple files from a graphical application is prefered.

When using `FileZilla` you must create a new site, just click `File -> Site Manager`.
From the new window click `New Site`.

On the right pane fill in the information as follows:

```
Protocol    SFTP - SSH File Transfer Protocol
Host        secure.hpcc.ucr.edu
Port        22
```

The `Logon Type` can be either `Interactive` or `Key File`, this depends on if you have setup [Password+DUO](#passwordduo) or [SSH Keys](#ssh-keys) respectively.

