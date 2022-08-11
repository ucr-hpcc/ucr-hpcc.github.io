---
title: Getting Started
linkTitle:  Getting Started
type: docs
weight: 2
aliases:
    - /manuals_linux-cluster_start.html
    - /manuals_linux-cluster_start
---

## Login from Mac, Linux, MobaXTerm

The initial login brings users into the cluster head node (i.e. pigeon, pelican, parrot). From there, users can submit jobs via `srun`/`sbatch` to the compute nodes to perform intensive tests.
Since all machines are mounting a centralized file system, users will always see the same home directory on all systems. Therefore, there is no need to copy files from one machine to another.

Open the terminal and type

```bash
ssh -X username@cluster.hpcc.ucr.edu
```

## Login from Windows

Please refer to the login instructions of our [Linux Basics manual](/manuals/linux_basics/intro/#windows).

## Change Password

1. Login via SSH using the Terminal on Mac/Linux or MobaXTerm on Windows
+  Once you have logged in type the following command:
```
passwd
```
+ Enter the old password (the random characters that you were given as your initial password)
+ Enter your new password

The password minimum requirements are:
* Total length at least 8 characters long
* Must have at least 3 of the following:
    * Lowercase character
    * Uppercase character
    * Number
    * Punctuation character

## Modules

All software used on the HPC cluster is managed through a simple module system.
You must explicitly load and unload each package as needed.
More advanced users may want to load modules within their bashrc, bash_profile, or profile files.

### Available Modules

To list all available software modules, execute the following:

```bash
module avail
```

This should output something like:

```bash
------------------------- /usr/local/Modules/versions --------------------------
3.2.9
--------------------- /usr/local/Modules/3.2.9/modulefiles ---------------------
BEDTools/2.15.0(default) modules
PeakSeq/1.1(default) python/3.2.2
SOAP2/2.21(default) samtools/0.1.18(default)
bowtie2/2.0.0-beta5(default) stajichlab
cufflinks/1.3.0(default) subread/1.1.3(default)
matrix2png/1.2.1(default) tophat/1.4.1(default)
module-info
```

### Using Modules

To load a module, run:

```bash
module load <software name>[/<version>]
```

For example, to load R version 4.1.2, run:
```bash
module load R/4.1.2
```

To load the default version of the tophat module, run:

```bash
module load tophat
```

### Show Loaded Modules

To show what modules you have loaded at any time, you can run:

```bash
module list
```

Depending on what modules you have loaded, it will produce something like this:

```bash
Currently Loaded Modulefiles:
  1) vim/7.4.1952                  3) slurm/16.05.4                 5) R/3.3.0                       7) less-highlight/1.0            9) python/3.6.0
  2) tmux/2.2                      4) openmpi/2.0.1-slurm-16.05.4   6) perl/5.20.2                   8) iigb_utilities/1
```

### Unloading Software

Sometimes you want to no longer have a piece of software in path. To do this you unload the module by running:

```bash
module unload <software name>
```

## Databases

### Loading Databases

[NCBI](http://www.ncbi.nlm.nih.gov/), [PFAM](http://en.wikipedia.org/wiki/Pfam#External_links), and [Uniprot](http://www.uniprot.org/), do not need to be downloaded by users. They are installed as modules on the cluster.

```
module load db-ncbi
module load db-pfam
module load db-uniprot
```

Specific database release numbers can be identified by the version label on the module:
```
module avail db-ncbi

----------------- /usr/local/Modules/3.2.9/modulefiles -----------------
db-ncbi/20140623(default)
```

### Using Databases

In order to use the loaded database users can simply provide the corresponding environment variable (NCBI_DB, UNIPROT_DB, PFAM_DB, etc...) for the proper path in their executables.

This is the old deprecated BLAST and it may not work in the near future, however if you require it:

```
blastall -p blastp -i proteins.fasta -d $NCBI_DB/nr -o blastp.out
```

You can can also use this method if you require the old version of BLAST (old BLAST with legacy support):

```
BLASTBIN=`which legacy_blast.pl | xargs dirname`
legacy_blast.pl blastall -p blastp -i proteins.fasta -d $NCBI_DB/nr -o blast.out --path $BLASTBIN
```

This is the preferred/recommended method (BLAST+):

```
blastp -query proteins.fasta -db $NCBI_DB/nr -out proteins_blastp.txt
```

Usually, we store the most recent release and 2-3 previous releases of each database. This way time consuming projects can use the same database version throughout their lifetime without always updating to the latest releases.

### Additional Features
There are additional features and operations that can be done with the module command. Please run the following to get more information:

```bash
module help
```

## Quotas

### CPU

Currently, the maximum number of CPU cores a user can use simultaneously on the cluster is 256 CPU cores when the load on the cluster is <30% and 128 CPU cores when the load is above 30%. If a user submits jobs for more than 256/128 CPU cores then the additional requests will be queued until resources within the user's CPU quota become available. Upon request a user's upper CPU quota can be extended temporarily, but only if sufficient CPU resources are available. To avoid monopolisation of the cluster by a small number of users, the high load CPU quota of 128 cores is dynamically readjusted by an algorithm that considers the number of CPU hours accumulated by each user over a period of 2 weeks along with the current overall CPU usage on the cluster. If the CPU hour average over the 2 week window exceeds an allowable amount then the default CPU quota will be reduced for such a heavy user to 64 CPU cores, and if it exceeds the allowable amount by two-fold it will be reduced to 32 CPU cores. Once the average usage of a heavy user drops again below those limits, the upper CPU limit will be raised accordingly. Note: when the overall CPU load on the cluster is below 70% then the dynamically readjusted CPU quotas are not applied. At those low load times every user has the same CPU quota: 256 CPU cores at <30% load and 128 CPU cores at 30-70% load.

### Data Storage

A standard user account has a storage quota of 20GB. Much more storage space, in the range of many TBs, can be made available in a user account's bigdata directory. The amount of storage space available in bigdata depends on a user group's annual subscription. The pricing for extending the storage space in the bigdata directory is available [here](/home).

### Memory

From the cluster head node users can submit jobs to the batch queue or the highmem queue. The nodes associated with the batch queue are mainly for CPU intensive tasks, while the nodes of the highmem queue are dedicated to memory intensive tasks. The batch nodes allow a 1GB RAM minimum limit on jobs and and the highmem nodes allow 100GB-1024GB RAM jobs.

## What's Next?

You should now know the following:

1. Basic orginization of the cluster
+  How to login to the cluster
+  How to use the Module system to gain access to the cluster software
+  CPU, storage, and memory limitations (quotas and hardware limits)

Now you can start using the cluster.

The HPCC cluster uses the Slurm queuing system and thus the recommended way to run your jobs (scripts, pipelines, experiments, etc...) is to submit them to this queuing system by using `sbatch`.
Please **DO NOT RUN ANY** computationally intensive tasks on any head node (i.e. pigeon, pelican, parrot). If this policy is violated, your process will either run very slow or be killed.
The head nodes (login nodes) are a shared resource and should be accessible by all users. Negatively impacting performance would affect all users on the system and will not be tolerated.

