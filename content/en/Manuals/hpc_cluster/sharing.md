---
title: Sharing Data
linkTitle: Sharing Data
type: docs
weight: 7
aliases:
    - /manuals_linux-cluster_sharing.html
    - /manuals_linux-cluster_sharing
---

## Permissions
It is useful to share data and results with other users on the cluster, and we encourage collaboration  The easiest way to share a file is to place it in a location that both users can access. Then the second user can simply copy it to a location of their choice. However, this requires that the file permissions permit the second user to read the file.
Basic file permissions on Linux and other Unix like systems are composed of three groups: owner, group, and other. Each one of these represents the permissions for different groups of people: the user who owns the file, all the group members of the group owner, and everyone else, respectively  Each group has 3 permissions: read, write, and execute, represented as r,w, and x. For example the following file is owned by the user `username` (with read, write, and execute), owned by the group `groupname` (with read and execute), and everyone else cannot access it.

```bash
username@pigeon:~$ ls -l myFile
-rwxr-x---   1 username groupname 1.6K Nov 19 12:32 myFile
```

If you wanted to share this file with someone outside the `groupname` group, read permissions must be added to the file for 'other':

```bash
username@pigeon:~$ chmod o+r myFile
```

To learn more about ownership, permissions, and groups please visit [Linux Basics Permissions](/manuals/linux_basics/permissions/).

## Set Default Permissions

In Linux, it is possible to set the default file permission for new files. This is useful if you are collaborating on a project, or frequently share files and  you do not want to be constantly adjusting permissions  The command responsible for this is called 'umask'. You should first check what your default permissions currently are by running 'umask -S'.

```bash
username@pigeon:~$ umask -S
u=rwx,g=rx,o=rx
```

To set your default permissions, simply run umask with the correct options. Please note, that this does not change permissions on any existing files, only new files created after you update the default permissions. For instance, if you wanted to set your default permissions to you having full control, your group being able to read and execute your files, and no one else to have access, you would run:

```bash
username@pigeon:~$ umask u=rwx,g=rx,o=
```

It is also important to note that these settings only affect your current session.
If you log out and log back in, these settings will be reset.
To make your changes permanent you need to add them to your `.bashrc` file, which is a hidden file in your home directory (if you do not have a `.bashrc` file, you will need to create an empty file called `.bashrc` in your home directory).
Adding umask to your `.bashrc` file is as simple as adding your umask command (such as `umask u=rwx,g=rx,o=r`) to the end of the file.
Then simply log out and back in for the changes to take affect. You can double check that the settings have taken affect by running `umask -S`.

To learn more about umask please visit [What is Umask and How To Setup Default umask Under Linux?](http://www.cyberciti.biz/tips/understanding-linux-unix-umask-value-usage.html).

## File Transfers

For file transfers and data sharing, both command-line and GUI applications can
be used. For beginners we recommend the FileZilla GUI application
(download/install from here) since it is available for most OSs. A basic user
manual for FileZilla is here and a video tutorial is here. Alternative
user-friendly SCP/SFTP GUI applications include Cyberduck and WinSCP for Mac
and Windows OSs, respectively. 

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

  If you would rather use a graphical interface, instead of the command line, try FileZilla [FileZilla](https://filezilla-project.org/) for file exchanges.

* To copy files To the server run the following on your workstation or laptop:

  `scp -r <path_to_directory> <your_username>@<host_name>:`

* To copy files From the server run the following on your workstation or laptop:

  `scp -r <your_username>@<host_name>:<path_to_directory> .`

## Copying bigdata

Rsync can:

* Copy (transfer) directories between different locations
* Perform transfers over the network via SSH
* Compare large data sets (`-n, --dry-run` option)
* Resume interrupted transfers

Rsync Notes:
* Rsync can be used on Windows, but you must install [Cygwin](https://cygwin.com). Most Mac and Linux systems already have rsync install by default.
* Always put the / after both folder names, e.g: `FOLDER_A/` Failing to do so will result in the nesting folders every time you try to resume. If you don't put / you will get a second folder_B inside folder_B `FOLDER_A/FOLDER_A/`
* Rsync only copies by default.
* Once the rsync command is done, run it again. The second run will be shorter and can be used as a double check. If there was no output from the second run then nothing changed.
* To learn more try `man rsync`

If you are transfering to, or from, your laptop/workstation it is required that you run the rsync command locally from your laptop/workstation.

To transfer to the cluster:

```bash
rsync -av --progress FOLDER_A/ cluster.hpcc.ucr.edu:FOLDER_A/
```

To transfer from the cluster:

```bash
rsync -av --progress cluster.hpcc.ucr.edu:FOLDER_A/ FOLDER_A/
```

Rsync will use SSH and will ask you for your cluster password, the same way SSH or SCP does.

If your rsync transer was interrupted, rsync can continue where it left off. Simply run the same command again to resume.


## Copying large folders on the cluster between Directories

If you want to syncronize the contents from one directory to another, then use the following:

```bash
rsync -av --progress PATH_A/FOLDER_A/ PATH_B/FOLDER_A/
```

Rsync does not move but only copies. Thus you would need to delete the original once you confirm that everything has been transfered.


## Copying large folders between the cluster and other servers

If you want to copy data from the cluster to your own server, or another remote system, use the following:

```bash
rsync -ai FOLDER_A/ sever2.xyz.edu:FOLDER_A/
```

The sever2.xyz.edu machine must be a server that accepts Rsync connections via SSH.

## Sharing Files on the Web

Simply create a symbolic link or move the files into your html directory when you want to share them.
For exmaple, log into the HPC cluster and run the following:

```bash
# Make sure you have an html directory
mkdir ~/.html

#Make sure permissions are set correctly
chmod a+x ~/
chmod a+rx ~/.html

# Make a new web project directory
mkdir www-project
chmod a+rx www-project

# Create a default test file
echo '<h1>Hello!</h1>' > ~/www-project/index.html

# Create shortcut/link for new web project in html directory 
ln -s ~/www-project ~/.html/
```

Now, test it out by pointing your web-browser to https://cluster.hpcc.ucr.edu/~username/www-project/
Be sure to replace `username` with your actual user name.

## Password Protect Web Pages

Files in web directories can be password protected.
First create a password file and then create a new user:

```bash
touch ~/.html/.htpasswd
htpasswd ~/.html/.htpasswd newwebuser
```

This will prompt you to enter a password for the new user 'newwebuser'.
Create a new directory, or go to an existing directory, that you want to password protect:

```bash
mkdir ~/.html/locked_dir
cd ~/.html/locked_dir
```

For the above commands you can choose any directory name you want.

Then place the following content within a file called `.htaccess`:

```apache
AuthName 'Please login'
AuthType Basic
AuthUserFile /rhome/username/.html/.htpasswd
require user newwebuser
```

Now, test it out by pointing your web-browser to http://cluster.hpcc.ucr.edu/~username/locked_dir
Be sure to replace `username` with your actual user name for the above code and URL.

## Google Drive

There are several tools used to transfer files from Google Drive to the cluster, however RClone may be the easiest to setup.

  1. Create an `SSH` tunnel to the cluster, (MS Windows users should use `MobaXterm`):
     ```
     ssh -L 53682:localhost:53682 username@cluster.hpcc.ucr.edu
     ```

  2. Once you have logged into the cluster with the above command, then load `rclone` via the module system and run it, like so:
     ```
     module load rclone
     rclone config
     ```

  3. After that, follow this [RClone Walkthrough](https://rclone.org/drive/) to complete your setup.

