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

The initial login brings users into the cluster head node (i.e. jay, lark). From there, users can submit jobs via `srun`/`sbatch` to the compute nodes to perform intensive tests.
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
------------------------ /opt/linux/rocky/8.x/x86_64/modules -------------------------
AAFTF/0.5.0                                           workspace/scratch <aL>  
abyss/2.3.4                                           wtdbg2/2.5              
almabte/1.3.2                                         xpdf/4.03               
alphafold/2.3.0                                       xsv/0.13.0              
amber/22_mpi_cuda                                     yq/4.35.1               
amptk/1.6                                             zoem/21-341
...
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

### CPU and Memory

Please refer to our [Queue Policies](https://hpcc.ucr.edu/manuals/hpc_cluster/queue/) page for details regarding CPU and Memory limits.

### Data Storage

A standard user account has a storage quota of 20GB. Much more storage space, in the range of many TBs, can be made available in a user account's bigdata directory. The amount of storage space available in bigdata depends on a user group's annual subscription. The pricing for extending the storage space in the bigdata directory is available [here](/about/overview/access/).


## What's Next?

You should now know the following:

1. Basic orginization of the cluster
2. How to login to the cluster
3. How to use the Module system to gain access to the cluster software
4. CPU, storage, and memory limitations (quotas and hardware limits)

Now you can start using the cluster.

The HPCC cluster uses the Slurm queuing system and thus the recommended way to run your jobs (scripts, pipelines, experiments, etc...) is to submit them to this queuing system by using `sbatch`.
Please **DO NOT RUN ANY** computationally intensive tasks on any head node (i.e. jay, lark). If this policy is violated, your process will either run very slow or be killed automatically.
The head nodes (login nodes) are a shared resource and should be accessible by all users. Negatively impacting performance would affect all users on the system and will not be tolerated.

