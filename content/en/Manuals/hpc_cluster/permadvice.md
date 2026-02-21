---
title: File Permission Advice
linkTitle: File Permission Advice
type: docs
weight: 9
aliases:
    - /manuals_linux-cluster_permadvice.html
    - /manuals_linux-cluster_permadvice
---

## Overview

This page provides detailed advice on choosing and setting permissions on your files on the HPCC cluster. Permissions need to strike an important balance between security and convenience. As a user on a shared computing environment, it is important to choose these permissions carefully.

Readers should be familiar with [Permissions and Ownership](/manuals/linux_basics/permissions/) before proceeding with this documentation.

## Specific File/Directory Permissions

HPCC users should concern themselves primarily with permissions on a few specific locations. Removing permissions on a parent directory provides protection on all files within that directory. As such, it provides the most benefit with the least amount of effort.

### Home Directory

Home directories should have one of the following permissions:

- `u=rwx,g=,o=` - Default and most restrictive. Safest choice.
- `u=rwx,g=,o=x` - Necessary for sharing files over the web (via `${HOME}/.html/`).

### Web Files Directory

Users sharing files over the web must create a directory at `${HOME}/.html/`, and should have one of the following permissions:

- `u=rwx,g=,o=rx` - Allows listing of files in the web browser.
- `u=rwx,g=,o=x` - Files will not be listed in the web browser, but files inside can be read/traversed if their names are known, and `o=rX` permissions are set on them. Safer but less convenient.

### SSH Settings Directory

A user's SSH settings are stored at `${HOME}/.ssh/`, and **MUST** have its permissions set to `u=rwx,g=,o=`. Occasionally, a user might accidentally change this directory's permission by running a recursive `chmod` on their home directory. If permissions on this directory are too relaxed, you may experience problems with SSH keys, among other issues. To ensure you have adequately safe permissions, run the following command (note: the upper-case 'X' is intentional):

`chmod --recursive --verbose u=rwX,g=,o= ${HOME}/.ssh/`

### Bigdata User Directory

Users' bigdata directory (`/bigdata/LABNAME/USERNAME/`) should have one of the following permissions:

- `u=rwx,g=rx,o=` - Default. Reasonably safe.
- `u=rwx,g=,o=` - Most restrictive. Safest but can't share data inside.
- `u=rwx,g=rx,o=x` - To share files with users in other labs, or over the web (i.e. symlinked from ${HOME}/.html/)

It is **not** recommended to add group-write permissions on this directory. It is better to selectively add group-write to individual sub-directories that need it.

## Default Permissions (umask)

### HPCC Defaults

As of Feb 19, 2026, the default permissions for **new files** on HPCC is as follows:

- User (owner) has full access (read, write, exec)
- Group members can read and exec, but not write
- Others have no access

In more technical terms, the default `umask -S` value is `u=rwx,g=rx,o=`.

This default should be kept by most users, but may affect the following users:

- Users that frequently collaborate with other labs outside their own
- Users that frequently share files over the web (via `${HOME}/.html/`)

### Previous Defaults

Before Feb 19, 2026, HPCC used the following settings, which allowed "other" users to read and exec files by default:

- User (owner) has full access (read, write, exec)
- Group members can read and exec, but not write
- Others can read and exec, but not write

In more technical terms, the previous default `umask -S` value was `u=rwx,g=rx,o=rx`. Most Linux systems use this default unless changed by the administrator.

Set the session umask by running `umask u=rwx,g=rx,o=rx`. This will temporarily restore the previous default for the current session.

For users that feel that the new HPCC defaults are too restrictive, and understand the security implications, they may permanently restore the previous behavior:

```
# Add the following line to ${HOME}/.bashrc

umask u=rwx,g=rx,o=rx
```

### Optimal Defaults for Lab Collaboration

If a user is working in a shared workspace (e.g. `/bigdata/LABNAME/shared/`), they may want to set their **session** `umask` to `u=rwx,g=rwx,o=`. This will alleviate the need to tediously use `chmod` on every shared file.

Set the session umask by running `umask u=rwx,g=rwx,o=` at the beginning of each relevant session. It is **not** recommended to set this default in `.bashrc`.

### Optimal Defaults for Privacy

If a user is working with sensitive data, they may want to set their **session** `umask` to `u=rwx,g=,o=`.

Note that it is usually better to set `g=,o=` on a parent directory (with `chmod`) to prevent unwanted access. But in the rare situation that a user must create private files within a shared workspace, `umask` is the correct solution.

For data that falls under IS-3 P3 or P4, `umask` and `chmod` controls are inadequate. Please read our [Data Security](/manuals/hpc_cluster/security/) page for datasets requiring high security.

