---
title: "Cluster Usage"
author: Jordan Hayes
date: December 18, 2020
output: 
  ioslides_presentation:
    keep_md: yes
    widescreen: yes
    df_print: paged
    smaller: true
subtitle: "Just the Basics...mostly" 
---
<!--
- ioslides manual: 
   https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html

- Compile from command-line
jupyter nbconvert Cluster_Usage.ipynb --to markdown && Rscript -e "rmarkdown::render('Cluster_Usage.md'); knitr::knit('Cluster_Usage.md', tangle=TRUE)"

- Jupyter formats
#jupyter nbextension enable splitcell/splitcell
#jupyter nbconvert HPCC_Intro.ipynb --to slides --reveal-prefix reveal.js
#jupyter nbconvert HPCC_Intro.ipynb --to slides --reveal-prefix "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0"
-->

## Summary

* Filesystem
  * Paths
  * Quotas
  * Usage

* Software
  * Module System
  * Installs
  * Management
  
* Job Scheduling
  * Node
  * Partition
  * Limits
  * Jobs
  
<hr style='clear:both;'>

## Filesystem: Paths

__RoadMap__

<img src="https://docs.google.com/drawings/d/e/2PACX-1vRjaVs9P2GF9oXUem-NNRH6gUD-VQ_N03wKYYHlJ373Qrqb9KPd_oZuFkTzHVFUawNX9ShIHW4u-u2l/pub?w=936&amp;h=380">

<hr style='clear:both;'>

## Filesystem: Paths

  * Symlink (<span style='color:blue;'>dotted lines</span>) - A shortcut to another directory or file
  
  * Mount (<span style='color:green;'>Local</span>/<span style='color:red;'>Shared</span>) - An entry point to a disk or storage device (ie. `'C:/'` or `Google Drive`)
  
<hr style='clear:both;'>

## Filesystem: Paths

__Case sensitive__

All paths and commands are case sensitive, an uppercase letter is not the same as a lowercase letter.

__Path Types__

  * Absolute path - Full path from root to current working directory
  
  ```
  /rhome/username/workshop_dir/
  ```

  * Relative path - Partial path or non-absolute path (current directory implied)
  
  ```
  workshop_dir/
  ```
  
<hr style='clear:both;'>

## Filesystem: Quotas

All storage has limits.

* <span style='font-weight:bold;color:green;'>Local Storage</span> (ie. laptop hard drive)

  Only exists on a single machine (node) and is limited by disk size.


* <span style='font-weight:bold;color:red;'>Shared Storage</span> (ie. Google Drive)

  Exists accross all machines (nodes) and is limited by a quota.
  
<hr style='clear:both;'>

## Filesystem: Usage

Make workshop directory, if it does not already exist:


```bash
mkdir -p ~/workshop_dir
```

Check <span style='font-weight:bold;color:black;'>directory</span> size:


```bash
du -hs ~/workshop_dir
```

Check <span style='font-weight:bold;color:green;'>local</span> node storage:


```bash
df -h /tmp
```


```bash
df -h /scratch
```

<hr style='clear:both;'>

## Filesystem: Usage

Check <span style='font-weight:bold;color:red;'>GPFS</span> storage, _"blocks"_ is used space and available space is _"quota"_:


```bash
check_quota home
```


```bash
check_quota bigdata
```

[https://hpcc.ucr.edu/manuals_linux-cluster_storage](https://hpcc.ucr.edu/manuals_linux-cluster_storage)

<hr style='clear:both;'>

## Software: Module System

This system allows multiple versions of software to be loaded and unloaded.

To view software that is available:


```bash
module avail
```

To search for a specific software:


```bash
module avail samtools
# OR
hpcc-software samtools
```

<hr style='clear:both;'>

## Software: Module System

Load software into current environment:


```bash
module load samtools
```

List currently loaded software modules:


```bash
module list
```

Remove software from current environment:


```bash
module unload samtools
```

[https://hpcc.ucr.edu/manuals_linux-cluster_start#modules](https://hpcc.ucr.edu/manuals_linux-cluster_start#modules)


<hr style='clear:both;'>

## Software: Installs

__Python__

For a basic `Python` package ([pypi](https://pypi.org/)) you can use `pip` to install it:

```bash
pip install PKGNAME --user
```

For example, here is how you would install the `camelcase` package:

```bash
pip install camelcase --user
```

<hr style='clear:both;'>

## Software: Installs

__R__

For an `R` package you can use the install fuction ([CRAN](https://cran.r-project.org/)):

```bash
R
```

```r
install.packages('PKGNAME')
```

Or you can use the install function from [BiocManager](https://www.bioconductor.org/):

```bash
R
```

```r
BiocManager::install('PKGNAME')
```

[https://hpcc.ucr.edu/manuals_linux-cluster_package-manage.html#r-1](https://hpcc.ucr.edu/manuals_linux-cluster_package-manage.html#r-1)

<hr style='clear:both;'>

## Software: Management

  * <span style='font-weight:bold;color:green;'>Conda</span> - A software management system that allows you to install thousands of software packages and tools, including `R` and `Python` languages.

  Full instructions regarding conda setup can be found [here](https://hpcc.ucr.edu/manuals_linux-cluster_package-manage.html).
  

  * <span style='font-weight:bold;color:red;'>Singularity</span> - A Linux container system (similar to Docker) which allows users to prepare a Linux environment from scratch.
  
  Some singularity examples can be found [here](https://github.com/ucr-hpcc/hpcc_slurm_examples/tree/master/singularity).

A previous workshop regarding custom software installs utilizing the above technologies can be found [here](https://bit.ly/2PXGWEq).

<hr style='clear:both;'>

## Software: Management

__Conda__

List current conda virtual environments:


```bash
conda env list
```

Create a `Python` 3 environment named `python3`:


```bash
conda create -n python3 python=3
```

Install Python package with conda:


```bash
conda install -n python3 numpy
```

> __Note:__ If package fails to be found, search on the [Anaconda Website](https://anaconda.org/). After searching click on one of the results and the command for installing will be provided. Remember to add your `-n python3` environment name.

<hr style='clear:both;'>

## Software: Management

__Conda__

After the conda environment is setup and `numpy` is installed, we can test it with the following:


```bash
conda activate python3
python -c 'import numpy as np; a = np.arange(15).reshape(3, 5); print(a)'
```

<hr style='clear:both;'>

## Software: Management

__Singularity__

> __Warning:__ This is a demo, should be used for advanced projects

You may need a singularity image if...

  * You may want to build/control your own Linux environment
  * Your software requires older, or newer, libraries
  * Installation instructions are for `Ubuntu`

<hr style='clear:both;'>

## Software: Management

__Singularity__

First you must get your own Linux machine, and install Singularity.
Perhaps the easiest way to do this is mentioned [here](https://sylabs.io/guides/3.7/admin-guide/installation.html#installation-on-windows-or-mac).

After this you can use __pre-built__ images or try to build a __custom__ singularity image:

__Pre-Built__

```
singularity exec docker://ubuntu:latest echo "Hello Dinosaur!"
```

__Custom__

1. Create a Singularity definition file
2. Build container image based on definition file
3. Run shell inside image to test

<hr style='clear:both;'>

## Software Management

__Definition File__

Make file `myLinuxEnv.def` with the following content:

```
bootstrap: docker
From: ubuntu:latest

%post
  apt update
  apt install httpd
```

<hr style='clear:both;'>

## Software Management

__Build Container Image__

Run the following command using defenition file:


```bash
singularity build myLinuxEnv.sing myLinuxEnv.def
```

<hr style='clear:both;'>

## Software Management

__Test__

Test the image buy going inside it:


```bash
singularity shell myLinuxEnv.sing
```

Once the `Singularity` image is tested, transfer it to the cluster (SCP/SFTP), and execute it within a job like so:


```bash
module load singularity
singularity exec myLinuxEnv.sing 'cat /etc/lsb-release'
```

<hr style='clear:both;'>

## Job Scheduling: Slurm

<img src="https://docs.google.com/drawings/d/e/2PACX-1vQWU7EGfVNGIhebu953CqTx3y-jufY-0ja6zcV65LN3KWLX5hBY7R2mEavvy34Gbq9fnDQeT80jEqfT/pub?w=933&amp;h=401">

[https://slurm.schedmd.com/archive/slurm-19.05.0/](https://slurm.schedmd.com/archive/slurm-19.05.0/)

<hr style='clear:both;'>

## Job Scheduling: Node

__What is a Compute Node?__

<img src="https://docs.google.com/drawings/d/e/2PACX-1vQuTFQYXJmcIXx4873q1TlH0-44-yf1GwZicu6t7l5UrVnww08cMxD_ubYc0mpkfZ0Gsku43TT90DY0/pub?w=941&amp;h=250">

[https://hpcc.ucr.edu/hardware](https://hpcc.ucr.edu/hardware)

<hr style='clear:both;'>

## Job Scheduling: Partitions

<img style="float:right;" width='350px' src="https://docs.google.com/drawings/d/e/2PACX-1vQcl8tr-Tsi6TlUrUMREbrEk5ygkhllfoq82ZzrItDF13uqY-FmPwLpUqcpRGBTE7VajnpgDBwgox-v/pub?w=417&amp;h=551">

__What is a Partition?__

Logical groups of nodes, to allow more efficient allocation and managment of resources.

__Intel Partition__

* CPU  - 2 cores Default, 256 Cores Max
* RAM - 1GB Default, 1TB Max
* Time - 7 days Default, 30 Days Max

<div style='clear:both'><a href='https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#partitions'>https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#partitions</a></div>

<hr style='clear:both;'>

## Job Scheduling: Partitions


* __Default?__

  Fallback to this value if not explicitly provided.
  

* __Maximum?__

  Upper limit of what can be requested.


For more details regarding our partitions, please review our [Cluster Jobs: Partitions](https://hpcc.ucr.edu/manuals_linux-cluster_jobs#partitions) manual page.

<hr style='clear:both;'>

## Job Scheduling: Status

List all jobs owned by you and status:


```bash
squeue -u $USER
```

List all group jobs and status:


```bash
squeue -A $GROUP
```

<hr style='clear:both;'>

## Job Scheduling: Limits

List current Slurm limits:


```bash
slurm_limits
```

List CPUs currently used by you:


```bash
user_cpus
```

List CPUs currently used by entire group (primary):


```bash
group_cpus
```

<hr style='clear:both;'>

## Job Scheduling: Jobs

__Submission__

Move into workshop directory:


```bash
cd ~/workshop_dir
```

Download example job submission script:


```bash
# Non-Stats
wget -O basic_job.sh https://bit.ly/33rozLX

# Stats Department
wget -O basic_job.sh https://bit.ly/2KBaIOs
```

Check job submission script contents (use arrow keys to navigate and `ctrl+x` to quit):


```bash
nano basic_job.sh
```

<hr style='clear:both;'>

## Job Scheduling: Jobs

__Submission__

Submit as non-interactive job:


```bash
sbatch basic_job.sh
```

Submit interactive job:

```bash
srun -p short --pty bash -l

# OR

srun -p statsdept --pty bash -l
```

<hr style='clear:both;'>

## Job Scheduling: Jobs

__Status__

Check job status:


```bash
squeue -u $USER
```

Check results:


```bash
cat slurm-2909103.out
```

[https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#submitting-jobs](https://hpcc.ucr.edu/manuals_linux-cluster_jobs.html#submitting-jobs)

<hr style='clear:both;'>
