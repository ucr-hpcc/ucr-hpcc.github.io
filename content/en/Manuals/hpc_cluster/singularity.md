---
title: Singularity Jobs
linkTitle: Singularity Jobs
type: docs
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

Currently we are not supporting Slurm jobs bening submitted from within a container.
If you load the container `centos/7.9` and try to submit a job from within it will fail.
Please contact support in order to work around this issue.

## How to use Singularity

`Singularity` is easy to use.
You can run `singularity` in an interactive mode by calling a shell, or you can run `singularity` in a non-interactive mode and just pass it a script.
This 2 modes are very similar to job submission on the cluster; `srun` is used for interactive, while `sbatch` is used for non-interactive.


### Interactive Singularity

When running singularity you need to provide the path to a `singularity` image file.
For example, this would be the most basic way to get a shell within your container:

```bash
module load singularity
singularity shell /path/to/singularity/image
```

Typically when we install `singularity` enabled software, we will also create an environment variable which holds the location of the `singularity` image file.
For example, this would be how we would use the `centos` module:

```bash
module load centos
singularity shell $CENTOS7_SING
```

There is a special shortcut for the `centos` module that allows us to run the above more simply, as:

```bash
module load centos
centos.sh
```

Here is a another example that utilizes an interactive job:

```
module load centos
srun -p batch --mem=1g -c 4 --time=2:00:00 --pty centos.sh
```

### Non-Interactive Singularity

When running singularity as non-interactive, the same basic rules apply, we need a path to our `singularity` image file as well as a command.
For example, here is the basic syntax:

```bash
module load singularity
singularity exec /path/to/singularity/image someCommand
```

Using `centos` as an example, you can execute an abitraty command like so:

```bash
module load singularity
singularity exec $CENTOS7_SING cat /etc/redhat-release
```

Now using the `centos` shortcut:

```bash
module load centos
centos.sh "cat /etc/redhat-release"
```

Here is a more complex example with modules:

```bash
module load centos
centos.sh "module load samtools; samtools --help"
```

Here is an even more complex example within a job:

```bash
module load centos
sbatch -p batch --wrap="centos.sh 'module load samtools; samtools --help'"
```
