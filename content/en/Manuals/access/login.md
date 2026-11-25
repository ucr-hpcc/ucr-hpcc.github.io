---
title: Login
linkTitle: Login
type: docs
aliases:
    - /manuals_linux-basics_intro.html
    - /manuals_linux-basics_intro
    - /manuals/hpc_cluster/login
    - /manuals/login/
---

## Before You Start

You need an HPCC user account. If you don't have one, see this article on [requesting access](https://hpcc.ucr.edu/about/facility/access/). Your login credentials will be emailed to you upon approval.

There are three ways to access the cluster:

| Method | Best for | Section |
|---|---|---|
| SSH from a terminal | Command-line work, job submission | [A. SSH Login](#a-ssh-login-from-a-terminal) |
| Web browser (OnDemand) | JupyterHub, RStudio, VSCode, remote desktop | [B. Web-based Access](#b-web-based-access) |
| Data-sharing account | Restricted accounts for file transfer | [C. Data-Sharing Account Access](#c-data-sharing-account-access) |

### Choose your authentication method

Passwords alone provide inadequate security. Use one of these:

| Method | Services | Who can use it |
|---|---|---|
| [Password + Duo](#password--duo) | All | UCR users only. |
| [SSH keys](#ssh-keys) | SSH/SFTP only | Everyone. **External (non-UCR) users must use SSH keys.** |

---

## A. SSH Login from a Terminal

1. Open a terminal (see [Terminal Options](#terminal-options) if you need one).
2. Connect to the cluster, replacing `<USERNAME>` with your HPCC username:

    ```bash
    ssh <USERNAME>@cluster.hpcc.ucr.edu
    ```

3. Authenticate:
    - **Password + Duo:** enter your password, then approve the Duo prompt.
    - **SSH key:** no password or Duo prompt is needed.

4. **First login or after a password reset:** change your password immediately:

    ```bash
    passwd
    ```

    New passwords must be at least 8 characters long and contain at least 3 of the following: lowercase letters, uppercase letters, numbers, punctuation.

> **Warning:** Skipping the password change, or entering a wrong password repeatedly, can lock you out. If that happens, email [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) to request a reset.

### Terminal Options

| Operating system | Recommended terminal |
|---|---|
| macOS | Built-in [Terminal](https://support.apple.com/guide/terminal/welcome/mac) or [iTerm2](https://iterm2.com/) |
| Linux | Built-in terminal |
| Windows | [MobaXterm](https://mobaxterm.mobatek.net/) (recommended; see the [demos](https://mobaxterm.mobatek.net/demo.html)). You can type the `ssh` command, or fill in the host (`cluster.hpcc.ucr.edu`), user name and password in its session window. |
| ChromeOS | Linux terminal (enable Linux apps in ChromeOS settings first) |

---

## Authentication Details

### Password + Duo

Password + Duo is available **only to UCR users whose UCR NetID matches their HPCC username**.

- To set up Duo, see UCR's [Multi-Factor Authentication handout](https://its.ucr.edu/sites/default/files/2018-06/Multi-Factor%20Authentication%20Handout.pdf) and [MyAccount page](https://its.ucr.edu/blog/2020/06/11/customer-support-enhancements-myaccount).
- If your HPCC username differs from your NetID, email [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) to request a username change, or use [SSH keys](#ssh-keys) instead.

### SSH Keys

An SSH key pair has two parts:

- **Private key** (`~/.ssh/id_ed25519`): stays on your computer. **Never share it.**
- **Public key** (`~/.ssh/id_ed25519.pub`): uploaded to the cluster, or emailed to support. This is the only file you share.

With a proper SSH key setup, the server will not ask for a password or Duo approval.

#### Step 1: Create a key pair

Run these commands **on your own computer, not on the cluster**. They work in the terminal on macOS, Linux, ChromeOS and MobaXterm. (MobaXterm users can also follow the [MobaXterm key guide](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/sshkeys_winos/#create-ssh-keys-mobaxterm).)

1. Generate the key pair. When prompted, accept the default file location. You will also be asked to enter a passphrase. This provides additional protection, but is optional:

    ```bash
    ssh-keygen -t ed25519
    ```

3. Confirm both files were created:

    ```bash
    ls ~/.ssh/
    ```

    You should see `id_ed25519` and `id_ed25519.pub`.

> **Note:** The ssh-keygen passphrase is separate from your cluster password. If you forget it, it can't be recovered. Create a new key pair and upload the new public key.

#### Step 2: Upload the public key

Choose the option that matches your situation:

- **UCR users:** you need Password + Duo to log in for this step. Run this on your computer:

    ```bash
    ssh-copy-id -i ~/.ssh/id_ed25519.pub <USERNAME>@cluster.hpcc.ucr.edu
    ```

- **External users** (no Password + Duo access): email your **public** key (`id_ed25519.pub`) to [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) and staff will install it for you.

#### Step 3: Test the key

```bash
ssh <USERNAME>@cluster.hpcc.ucr.edu
```

You should be logged in without a password or Duo prompt.

For more on SSH keys, see the [SSH Keys manual](https://hpcc.ucr.edu/manuals/hpc_cluster/sshkeys/).

---

## B. Web-based Access

[OnDemand](https://hpcc.ucr.edu/manuals/hpc_cluster/selected_software/ondemand/) lets you use the cluster from a web browser. We provide JupyterHub, RStudio, VSCode, and full remote desktop sessions through the OnDemand portal. These applications are queued onto the same compute nodes as other Slurm jobs, providing the best performance possible.

The OnDemand portal is currently not available to external users, due to Duo MFA requirements.

---

## C. Data-Sharing Account Access

Data-sharing accounts are a special type of external account, restricted to data access operations on the HPCC cluster. These accounts must use the same [SSH Key](#ssh-keys) authentication method as other external accounts. Additional information on sharing data is provided [here](https://hpcc.ucr.edu/manuals/hpc_cluster/sharing/#file-transfers).

---

## Need Help?

Email [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) for password resets, username changes or SSH key installation.
