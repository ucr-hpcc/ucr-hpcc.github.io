---
layout: page
title: Permissions and Ownership
permalink: manuals_linux-basics_permissions.html
---

## Overview

In Linux (and Unix systems in general), access to files and directories is
controlled by a system of owners, groups, and permission bits. Changing these
settings is necessary to control access by other users.
The permission system also affects what files can be executed.

## Ownership Levels

* **user (u)** - User ownership of a file/directory. This user has the special
right to change the permission bits and group ownership.
* **group (g)** - Group ownership of a file/directory. Members of this group may
be assigned greater access rights than non-members.
* **other (o)** - Everyone else that isn't the owning user or from the owning
group.

## Permission Bits

The elemental permissions in Linux/Unix are read, write, and execute. Users and
groups can have one many, or none of these rights. Their meanings are as follows:

|   | Letter | Number | File | Directory |
|---|---|---|---|---|
| Read | r | 4 | View the contents | View the listings |
| Write | w | 2 | Modify the contents | Create a new file, or rename or delete existing files |
| Execute | x | 1 | Execute a program/script | Traversal rights |

## Checking Permissions

Annotated output for `ls -la`:

```
---------- File type (d = directory, - = regular file, l = symlink)
|--------- User permission triplet
||  ------ Group permission triplet
||  |  --- Other permission triplet
||  |  |
||  |  |       [user] [group]
drwx-----x  61 username groupname   4096 Feb 24 16:39 ./
drwxr-xr-x 688 root   root       262144 Feb 24 11:05 ../
drwx------   2 username groupname   4096 Feb  2 22:45 .ssh/
drwxr-xr-x   5 username groupname   4096 Dec 12 15:57 Downloads/
drwxr-xr-x   2 username groupname   4096 Jan  9 16:29 bin/
-rw-------   1 username groupname   7960 Feb 23 18:37 .bash_history
-rw-r--r--   1 username groupname    306 Nov  3 15:08 .bashrc
-rw-r--r--   1 username groupname    677 Apr  8  2013 .profile
-rw-r--r--   1 username groupname    128 Nov 30 12:38 .tmux.conf
-rw-r--r--   1 username groupname  12126 Nov  2 13:14 .vimrc
lrwxrwxrwx   1 username groupname     23 Sep 12 10:49 bigdata -> /bigdata/groupname/username/
-rw-r--r--   1 username groupname   5657 Sep 19 11:31 bookmarks.html
lrwxrwxrwx   1 username groupname     23 Sep 12 10:49 shared -> /bigdata/groupname/shared/
```

Assign write and execute permissions to user and group

`chmod ug+rx my_file`

To remove all permissions from all three user groups

```bash
chmod ugo-rwx my_file
            # '+' causes the permissions selected to be added
            # '-' causes them to be removed
            # '=' causes them to be the only permissions that the file has.

chmod +rx public_html/ or $ chmod 755 public_html/ # Example for number system:
```

## Change ownership

```bash
chown <user> <file or dir>         # changes user ownership
chgrp <group> <file or dir>        # changes group ownership
chown <user>:<group> <file or dir> # changes user & group ownership
```
