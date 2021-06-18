---
layout: page
title: Process Management
permalink: manuals_linux-basics_processes.html
---

## Process Management

Basic Linux process management commands only apply to processes that are running on the current machine you are logged into.
This means that you cannot use these commands to manage jobs.
Jobs on the cluster are managed through `Slurm`, see [Cluster Jobs](manuals_linux-cluster_jobs) for more details.
However, these commands are still useful for pausing, backgrounding, killing processes on a login node directly.
This commands could also be useful when running an interactive session on a compute node.

### User Management

```bash
top               # view top consumers of memory and CPU (press 1 to see per-CPU statistics)
who               # Shows who is logged into system
w                 # Shows which users are logged into system and what they are doing
```

### Process Management


#### Processes

```
ps                         # Shows processes running by user
ps -e                      # Shows all processes on system; try also '-a' and '-x' arguments
ps ux -u <USERNAME>        # Shows all processes owned by user
ps axjf                    # Shows the child-parent hierarchy of all processes
ps -o %t -p <PID>          # Shows how long a particular process was running.
                           # (E.g. 6-04:30:50 means 6 days 4 hours ...)
```

Here are two common utilities for displaying processes, sorting, and even killing them:

```
top            # Basic text based interface for exploring and managing processes
htop           # Text based interface for exploring and managing processes
```

> Note `q` to quit and `?` to see help

#### Background Resume Cancel

```
CTRL+z ENTER         # Suspend a process in the background
fg                   # Resume a suspended process and brings it into foreground
bg                   # Resume a suspended process but keeps it running in the background

CTRL+c               # Cancel the process that is currently running in the foreground
```

#### PID

```
echo $!              # Get PID of last executed command
```

#### Killing
```
kill -l              # List all of the signals that can be sent to a process
kill <PID>           # Kill a specific process with process ID using SIGTERM
kill -9 <PID>        # Violently kill process with process ID using SIGKILL, may corrupt files
```

### More on Terminating Processes

[DigitalOcean - How To Use ps, kill, and nice to Manage Processes in Linux](https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux)
