---
title: Singularity Jobs
linkTitle: Singularity Jobs
type: docs
weight: 15
---

## What is Singularity

In short, `Singularity` is a program that will allow a user to run code or command, within a customized environment.
We will refer to this customized environment as a `container`.
This type of container system is common, the more popular one being [Docker](https://www.docker.com/).
Since `Docker` requires root access and HPC users are not typically granted these permissions, we use Singularity instead.
`Docker` containers can be used via `Singularity`, with varying compatibility.

`Singularity` is forking into 2 branches:

* [Singularity-CE](https://sylabs.io/) - Community Edition from Sylabs.io
* [Apptainer](https://apptainer.org/) - Original Sinularity open source project

We will be using `Apptainer` when it is ready for production use.
However, in the meantime, `singularity-ce` is currently availble on the cluster.

## Limitations

Currently we are not supporting Slurm jobs being submitted from within a container.
If you load the container `centos/7.9` and try to submit a job from within it will fail.
Please contact support in order to work around this issue.

Additionally, the building of Singularity contains on the cluster is not possible due to the steps requiring elevated permissions. If custom containers are required, you will need to build them on a machine that you have root/`sudo` access on (such as your local machine) or use a [Remote Builder](https://cloud.sylabs.io/builder).

## How to use Singularity

You can use Singularity by running `module load singularity`.
You can run `singularity` in an interactive mode by calling a shell, or you can run `singularity` in a non-interactive mode and just pass it a script/program to run.
These 2 modes are very similar to job submission on the cluster; `srun` is used for interactive, while `sbatch` is used for non-interactive.


### Pulling Container Images

The first step in using Singularity is to get a container to run inside of. Containers can be custom built, pulled from [Docker Hub](https://hub.docker.com/) or from [SyLabs Container Library](https://cloud.sylabs.io/).

For example, if you wanted to run your program within an Ubuntu environment you could use the following command to pull the Ubuntu 22.04:
```bash
# From Singularity Library:
singularity pull library://library/default/ubuntu:22.04

# From Docker Hub:
singularity pull docker://ubuntu:22.04
```

Note that the environment within these containers will be limited, mainly you lose the ability to use the module system. This is expected, as the environment (and the operating system) within the container will be different than the one we are running on our nodes. Even if you are able to get the modules mounted within the container, compatability can not be guatanteed as different libraries versions and packages might be present within the container that the modules were not compiled with.

> NOTE: If you get an error similar to "unexpected HTTP status: 401", make sure your [project](https://cloud.sylabs.io/dashboard#projects) on the Container Builder website is set to "Public".

#### HPCC Provided Images

In an attempt to preserve some legacy software, we created a CentOS 7 image that integrates with the old CentOS 7 modules. Access to the CentOS 7 container can be granted by running `module load centos/7.9`. This will set the `CENTOS7_SING` environment variable, which is the location of the CentOS 7 container image. Usage examples of the CentOS 7 image are in the below sections.

### Building Container Images

In order to build a custom image, you must use a machine you have `sudo` access on or use a [Remote Builder](https://cloud.sylabs.io/builder).

#### Local/Sudo Machine

Installing Singularity is outside of the scope for this tutorial. Please see the [Installing SingularityCE](https://docs.sylabs.io/guides/3.9/admin-guide/installation.html) steps.

Once Singularity is installed, you must create a definition (def) file. More details on creating a definition file can be found on the Singularity [The Definition File](https://docs.sylabs.io/guides/3.9/user-guide/definition_files.html) documentation, but a simple definition file of a Debian container that installs Python3 is the following:

```
BootStrap: docker    
From: debian:12    
    
%post    
  apt-get update -y    
  apt-get install -y python3
```

If the above file was named "debian.def", then an image could be build using `singularity build debian.sif debian.def`. This will create an image called `debian.sif` that can be ran using the sections below.

#### Remote Builder

After signing up for the [remote builder ](https://cloud.sylabs.io/builder), log in using the steps from `singularity remote login`.

After logging in, you must create a definition file. We can use the same "debian.sif" file from the "Local/Sudo Machine" section. With the definition file, build the container image using `singularity build --remote debian.sif debian.def`. After the image has been built and downloaded, you can run it using the sections below.

### Interactive Singularity

When running singularity you need to provide the path to a `singularity` image file.
For example, this would be the most basic way to get a shell within your container:

```bash
module load singularity
singularity pull library://library/default/ubuntu:22.04
singularity shell ubuntu_22.04.sif
cat /etc/os-release  # Inside Container
> PRETTY_NAME="Ubuntu 22.04.4 LTS"
> NAME="Ubuntu"
> VERSION_ID="22.04"
```

To run the CentOS 7 container:

```bash
module load centos
singularity shell $CENTOS7_SING
```

Additionally, there is a special shortcut for the `centos` module that allows us to run the above more simply, as:

```bash
module load centos
centos.sh
```

While running containers on a head node is technically possible, compute resources are still limited. You can use the following commands to run a job on a compute node:

Ubuntu:
```bash
module load singularity
singularity pull library://library/default/ubuntu:22.04
singularity shell ubuntu_22.04.sif
srun -p epyc --mem=1g -c 4 --time=2:00:00 --pty singularity shell ubuntu_22.04.sif
hostname  # Inside container
> r21
cat /etc/os-release  # Inside container
> PRETTY_NAME="Ubuntu 22.04.4 LTS"
> NAME="Ubuntu"
> VERSION_ID="22.04
```

CentOS 7:
```bash
module load centos
srun -p epyc --mem=1g -c 4 --time=2:00:00 --pty centos.sh
cat /etc/os-release  # Inside container
> PRETTY_NAME="CentOS Linux 7 (Core)"
> NAME="CentOS Linux"
> VERSION_ID="7"
```

### Non-Interactive Singularity

When running singularity non-interactivly, the same basic rules apply. We need a path to our `singularity` image file as well as a command to run.

#### Basics

For example, here is the basic syntax:

```bash
module load singularity
singularity exec /path/to/singularity/image someCommand
```

Using `ubuntu.sif` as an example, you can execute an abitraty command like so:
```bash
module load singularity
singularity pull library://library/default/ubuntu:22.04
singularity exec ubuntu_22.04.sif cat /etc/os-release
```

And using our CentOS 7 image:
```bash
module load singularity
singularity exec $CENTOS7_SING cat /etc/redhat-release
```

#### Shortcuts

Using the `centos.sh` shortcut that we provide for CentOS 7:

```bash
module load centos
centos.sh "cat /etc/redhat-release"
```

Here is a more complex example with modules:

```bash
module load centos
centos.sh "module load samtools; samtools --help"
```

#### Jobs
Here is an example job submitted using an Ubuntu container:
```bash
module load singularity
singularity pull library://library/default/ubuntu:22.04
sbatch -p epyc --wrap="singularity exec ubuntu_22.04.sif cat /etc/os-release; whoami; date"
```

Here is an example submitted as a job using the CentOS 7 container:

```bash
module load centos
sbatch -p epyc --wrap="centos.sh 'module load samtools; samtools --help'"
```

#### Variables

Here is an example with passing environment variables:

```bash
export SINGULARITYENV_SOMETHING='stuff'
centos.sh 'echo $SOMETHING'
```

> Notice: Just add the `SINGULARITYENV_` prefix to pass any varibales to the centos container.

#### Enable GPUs

First review how to submit a GPU job from [here](/manuals/hpc_cluster/jobs/#gpu-jobs).
Then request an interactive GPU job, or embed one of the following within your submission script.

In order to enable GPUs within your container you need to add the `--nv` option to the singularity command:

```bash
module load centos
singularity exec -nv $CENTOS7_SING cat /etc/redhat-release
```

However, when using the `centos` shortcut it is easier to just set the following environment variable then run `centos.sh` as usual:

```bash
module load centos
export SINGULARITY_NV=1
centos.sh
```

## Singularity Usecases

In addition to using Singularity to run operating system containers (Debian, Ubuntu, CentOS, etc), it can also be used to run certain software on the cluster.

The most prominent example of this is AlphaFold. If you are interested in using AlphaFold on the cluster, see the [AlphaFold Usage on HPCC](https://hpcc.ucr.edu/manuals/hpc_cluster/selected_software/alphafold/) page of our documentation. In addition to AlphaFold, we also offer `freefem` and `prymetime` through singularity, available by using `module load freefem` and `module load prymetime` respectively, and runnable with using `singularity shell $FREEFEM_SING` and `singularity shell $PRYMETIME_SING`.
