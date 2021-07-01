---
type: docs
linkTitle: Linux Cluster - Data Storage
title: Linux Cluster - Data Storage
permalink: manuals_linux-cluster_storage.html
---

## Dashboard
HPCC cluster users are able to check on their home and bigdata storage usage from the [Dashboard Portal](https://dashboard.hpcc.ucr.edu).

## Home
Home directories are where you start each session on the HPC cluster and where your jobs start when running on the cluster.  This is usually where you place the scripts and various things you are working on.  This space is very limited.  Please remember that the home storage space quota per user account is 20 GB.

Path                 | /rhome/`username`
-------------------- | ----------------
User  Availability   | All Users
Node  Availability   | All Nodes
Quota Responsibility | User

## Bigdata
Bigdata is an area where large amounts of storage can be made available to users. A lab purchases bigdata space separately from access to the cluster. This space is then made available to the lab via a shared directory and individual directories for each user.

__Lab Shared Space__
This directory can be accessed by the lab as a whole.

Path                 | /bigdata/`labname`/shared
-------------------- | --------------------------
User Availability    | Labs that have purchased space.
Node Availability    | All Nodes
Quota Responsibility | Lab

__Individual User Space__
This directory can be accessed by specific lab members.

Path                 | /bigdata/`labname`/`username`
-------------------- | -----------------------------
User Availability    | Labs that have purchased space.
Node Availability    | All Nodes
Quota Responsibility | Lab

## Non-Persistent Space
Frequently, there is a need to do things like, output a significant amount of intermediate data during a job, access a dataset from a faster medium than bigdata or the home directories or write out lock files. These types of things are well suited to the use of non-persistent spaces. Below are the filesystems available on the HPC cluster.

__Temporary Space__
This is a standard space available on all Linux systems. Please be aware that it is limited to the amount of free disk space on the node you are running on.

Path                 | /tmp
-------------------- | ---------
User Availability    | All Users
Node Availability    | All Nodes
Quota Responsibility | N/A

__SSD Backed Space__
This space is much faster than the persistwnt space (/rhome,/bigdata), but slower than using RAM based storage.

Path                 | /scratch
-------------------- | --------
User Availability    | All Users
Node Availability    | All Nodes
Quota Responsibility | N/A

__RAM Space__
This type of space takes away from physical memory but allows extremely fast access to the files located on it. When submitting a job you will need to factor in the space your job is using in RAM as well. For example, if you have a dataset that is 1G in size and use this space, it will take at least 1G of RAM.

Path                 | /dev/shm
-------------------- | ---------
User Availability    | All Users
Node Availability    | All Nodes
Quota Responsibility | N/A

## Usage and Quotas
To quickly check your usage and quota limits:

```bash
check_quota home
check_quota bigdata
```

To get the usage of your current directory, run the following command:

```bash
du -sh .
```

To calculate the sizes of each separate sub directory, run:

```bash
du -shc *
```

This may take some time to complete, please be patient.

For more information on your home directory, please see the [Linux Basics Orientation](manuals_linux-basics_cmdline-basics.html#orientation).

## Automatic Backups

The cluster does create backups however it is still advantageous for users to periodically make copies of their critical data to a separate storage device.
The cluster is a production system for research computations with a very expensive high-performance storage infrastructure. It is not a data archiving system.

Home backups are created daily and kept for one week.
Bigdata backups are created weekly and kept for one month.

Home and bigdata backups are located under the following respective directories:

```bash
/rhome/.snapshots/
/bigdata/.snapshots/
```

The individual snapshot directories have names with numerical values in epoch time format.
The higher the value the more recent the snapshot.

To view the exact time of when each snapshot was taken execute the following commands:

```bash
mmlssnapshot home
mmlssnapshot bigdata
```

