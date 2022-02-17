---
title: Changes for HPCC Users
linkTitle: Changes for HPCC Users
type: docs
aliases:
    - /changes.html
    - /changes
---

## User-facing Changes Implemented on 18-Feb-2022

The old `CentOS/RHEL 7` platform will be permanently retired on the 17th of March.
This 30 day transition period should be used to log into the new `Rocky/RHEL 8` platform and test your workflow.

Currently, `pigeon` is the only head/login node that is linked to the new `Rocky/RHEL 8` platform.
To check which platform you are on, you can run the `platform` command.

The change from `RHEL 7` to `RHEL 8` will impact users in the following ways mentioned below.

### Operating System

The biggest change is that we are upgrading the OS from `CentOS/RHEL 7` to `Rocky/RHEL 8`.
[Rocky Linux](https://rockylinux.org/) is the community equivalent and identical to `RHEL` (similar to how `CentOS` was).

<!--
For the past 7 years we have been using a `R`ed `H`at `E`nterprise `L`inux (`RHEL`) derivative called `CentOS Linux` (not to be confused with `CentOS Stream`).
Since `CentOS Linux` is [no longer supported](https://www.centos.org/news-and-events/1322-october-centos-dojo-videos/), 
we made the decision to stay in the RHEL family and go with [Rocky Linux](https://rockylinux.org/).

> Rocky Linux is an open-source enterprise operating system designed to be 100% bug-for-bug compatible with Red Hat Enterprise Linux
-->

### Passwords

Passwords will be expired and users will need to reset their password upon next login.
You must also configure `DUO` if using a password, or alternatively create an SSH key pair.
For more information refer to our manual page regarding [Login](/manuals/hpc_cluster/login/).

### Software

Previous software may be installed under a different version, or may no longer be installed as a module, or may not be installed at all.
Run the following command to list currently available modules:

```bash
module avail
```

Or you can search for a specific software (ie. `vim`) like so:

```bash
module avail vim
```

```bash
which vim
```

Since the new platform is built using `GCC 8.5`, then all previous compiled software must be re-compiled on the new platform.
If you cannot find what you are looking for send an installation request to [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).

Compatibility mode (`singularity`) can be used to run the older `CentOS 7` modules, however this may not work in all cases.
Please refer to our [Singularity Examples](/manuals/hpc_cluster/singularity/) for more information.

### Bash

We officially support bash, even though other shells may work they have not been tested under the new `Rocky/RHEL 8` platform.

When logging in under a bash shell, some errors/warnings may be visible.
The most common message being that a module cannot be loaded.

Check if the module (ie. `vim`) is available with the following:

```bash
module avail vim
```

If there is no output, then the module is not currently available. Either remove the `module load vim` from your `~/.bashrc` and/or `~/.bash_profile` files, or request that it be installed.

If the software is available, ensure a proper check is in place around loading modules within your `~/.bashrc` and/or `~/.bash_profile` files.

For example:

```bash
if [[ "$(type -t module)" == "function" ]]; then
    module load tmux
    module load neovim
fi
```

It may also help to keep `~/.bashrc` free of unnecessary bloat and only add customized changes to `~/.bash_profile`.
Also keep in mind that when running jobs with just `/bin/bash` the `~/.bashrc` file is loaded.
However, adding the lower case `L` to a job's interpreter, as in `/bin/bash -l` this will load the `~/.bash_profile` file.
This can be useful since it provides flexibility to initialize a default job shell or a customized job shell.

### Slurm

A newer version of Slurm is being used on the new `Rocky/RHEL 8` platform, however very little is different from the previous version.
All previous job submission scripts and commands/flags should still be compatible.

During the transition period From the old `CentOS/RHEL 7` platform any Slurm jobs scheduled to start after March 17th will never start.
Please check your jobs and ensure that they run before this time frame.
You can check your start times with the following command:

```bash
squeue --start -u $USER
```

Be sure to move to the newer `Rocky/RHEL 8` platform as soon as possible.

### Transfer Accounts

If you are currently using a transfer account, it is very likely that you do not have a UCR NetID, 
and this will only be able to access the cluster via SSH keys.
Please refer to our [SSH keys](/manuals/hpc_cluster/sshkeys/) manual for detail instructions.

## User-facing Changes Implemented on 23-Aug-2019 

### Domain Names

The old domain names `biocluster.ucr.edu` and `bioinfo.ucr.edu` have finally been discontinued. As a result, users need to use the new `hpcc.ucr.edu` 
name for the following services:
+ _ssh/scp/ftp/http_: `cluster.hpcc.ucr.edu` instead of `biocluster.ucr.edu` 
+ _RStudio Server_: `rstudio.hpcc.ucr.edu` instead of `rstudio.bioinfo.ucr.edu` 
+ _Jupyter_: `jupyter.hpcc.ucr.edu` instead of `jupyter.bioinfo.ucr.edu`
+ _Email Support_: `support@hpcc.ucr.edu` instead of `support@biocluster.ucr.edu`

In addition, URLs containing `biocluster.ucr.edu` need to be updated to `cluster.hpcc.ucr.edu`.

### Password Reset

After the upgrade on Aug 23, 2019, all HPCC users have been emailed a temporary
password with instructions how to change it. This email was sent to the address
we have on file for each user. In case you missed the corresponding email
notification and/or you are not able to log into the cluster, please email us
at [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) to receive a new password.

### Updated OpenMPI

If you have compiled or use software that was compiled with OpenMPI, then it will need to be recompiled.
If you are running into any issues, please email us at [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).

