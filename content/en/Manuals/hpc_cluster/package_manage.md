---
title: Package Management
linkTitle: Package Management
type: docs
weight: 5
aliases:
    - /manuals_linux-cluster_package-manage.html
    - /manuals_linux-cluster_package-manage
---

## Python
The scope of this manual is a brief introduction on how to manage Python packages.

### Python Versions
Different Python versions do not play nice with each other. It is best to only load one Python module at any given time.
The miniconda3 module for Python is the default version. This will enable users to leverage the conda installer, but with as few Python packages pre-installed as possible. This is to avoid conflicts with future needs of individuals.

#### Conda
We have several Conda software modules:
  1. miniconda3 - Basic Python 3 install (Default)
  2. anaconda  - Full Python 3 install
For more information regarding our module system please refer to [Environment Modules](/manuals/hpc_cluster/start/#modules).

The miniconda modules are very basic installs, however users can choose to unload this basic install for a fuller one (anaconda), like so:

```bash
module load miniconda
```

After loading anaconda, you will see that there are many more Python packages installed (ie. numpy, scipy, pandas, jupyter, etc...).
For a list of installed Python packages try the following:

```bash
pip list
```

#### Virtual Environments
Sometimes it is best to create your own environment in which you have full control over package installs.
Conda allows you to do this through virtual environments.

##### Initialize
Conda will now auto initialize when you load the corresponding module. No need to run the `conda init` or make any modifications to your `~/.bashrc` file.

##### Configure
Installing many packages can consume a large (ie. >20GB) amount of disk space, thus it is recommended to store conda environments under your bigdata space.
If you have bigdata, create the `.condarc` file (otherwise conda environments will be created under your home directory).

 Create the file `.condarc` in your home, with the following content:

```
channels:
  - defaults
pkgs_dirs:
  - ~/bigdata/.conda/pkgs
envs_dirs:
  - ~/bigdata/.conda/envs
auto_activate_base: false
```

> After changing the configuration, environments can be moved to the new bigdata location using `conda rename -n NAME NAME_tmp`, then `conda rename -N NAME_tmp NAME` to return it to it's original name. Replacing `NAME` with the name of the environment you wish to move.

Create a Python 3.10 conda environment, like so:

```bash
module load miniconda3  # Should already be auto-loaded during login
conda create -n NameForNewEnv python=3.10  # Many Python versions are available
```

##### Activating
Once your virtual environment has been created, you need to activate it before you can use it:

```bash
conda activate NameForNewEnv
```

With more modules being added as conda environments, it's sometimes requried to "stack" user environments on top of module-provided environments.
Running `conda activate` will deactivate the current environment before activating the new environment..
To counter this, the `--stack` flag can be used to effectively "combine" environments. For example `conda activate --stack NameForNewEnv`. Please see the conda page
on [Nested Activation](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#nested-activation) for more details.

##### Deactivating
In order to exit from your virtual environment, do the following:

```bash
conda deactivate
```

##### Installing packages

Before installing your packages, make sure you are on a computer node. This ensures your downloads to be done quickly and with less chance of running out of memory. This can be done using the following command:

```bash
srun -p short -c 4 --mem=10g --pty bash -l          # Adjust the resource request as needed
```

Here is a simple example for installing packages under your Python virtual environment via conda:

```bash
conda install -n NameForNewEnv PackageName
```

You may need to enable an additional channel to install the package (refer to your package's documentation):

```bash
conda install -n NameForNewEnv -c ChannelName PackageName
```

##### Cloning
It is possible for you to copy an existing environment into a new environment:

```bash
conda create --name AnotherNameForNewEnv --clone NameForNewEnv
```

##### Listing Environments
Run the following to get a list of currently installed conda evironments:

```bash
conda env list
```

##### Removing
If you wish to remove a conda environment run the following:

```bash
conda env remove --name myenv
```

#### More Info
For more information regarding conda please visit [Conda Docs](https://conda.io/docs/user-guide/).

### Jupyter
You can run jupyter as an interactive job or you can use the web instance, see [Jupyter Usage](https://hpcc.ucr.edu/manuals/linux_basics/text/#jupyter-server) for details.

#### Virtual Environment
In order to enable your conda virtual environemnt within the Jupyter web portal you will need to do the following:

```bash
# Create a virtual environment named "ipykernel_py3", if you don't already have one
# It can be named whatever you like, "ipykernel_py3" is just an example
conda create -n ipykernel_py3 python=3 ipykernel

# Load the new environment
conda activate ipykernel_py3

# Install kernel
python -m ipykernel install --user --name myenv --display-name "JupyterPy3"
```

Now when you visit [Jupyter-Hub](https://jupyter.hpcc.ucr.edu) you should see the option "JupyterPy3" when you click the "New" dropdown menu in the upper left corner of the home page.

To remove an unwanted kernel, use the following commands:

```bash
jupyter kernelspec list  # List available kernels
jupyter kernelspec uninstall UNWANTEDKERNEL
```
> Replace UNWANTEDKERNEL with the name of the kernel you wish to remove

#### R
For instructions on how to configure your R environment please visit [IRkernel](https://github.com/IRkernel/IRkernel).
Since we should already have IRkernel install in the latest version of R, you would only need to do the following within R:

```R
IRkernel::installspec(name = 'ir44', displayname = 'R 4.0.1')
```

## R
This section is regarding how to manage R packages.

### Current R Version

> NOTE: Please be aware that this version of R is built with `GCC/8.3.0`, which means that previously compiled modules may be incompatible.

Currently the default version of R is `R/4.3.0` and is loaded automatically for you.

When a new release of R is available, you should reinstall any local R packages, however keep in mind of the following:

  * Remove redundantly installed local R packages with the `RdupCheck` command.
  * Newer version of R packages are not backward compatible, once installed they only work for that specific version of `R`.

### Older R Versions

You can load other versions of R with the following:

```bash
module unload R
module avail R
module load R/VERSION
```

### Installing R Packages

The default version of `R` has many of the most popular `R` packages already installed and available.
It is also possible for you to install additional R packages in your local environment.

Only install packages if they are not already available, this will minimize issues later.
You can check the current version of `R` from the command line, like so:

```bash
Rscript -e "library('some-package-name')"
```

Or you can check from within `R`, like so:

```R
library('some-package-name')
```

If the package is not available, then proceed with installation.

#### Bioconductor Packages

To install from Bioconductor you can use the following method:

```R
BiocManager::install(c("package-to-install", "another-packages-to-install"))
Update all/some/none? [a/s/n]: n
```

For more information please visit [Bioconductor Install Page](https://www.bioconductor.org/install/).

#### GitHub Packages

```R
# Load devtools
library(devtools)

# Replace name with the GitHub account/repo
install_github("duncantl/RGoogleDocs")
```

#### Local Packages

```R
# Replace URL with your URL or local path to your .tar.gz file
install.packages("http://hartleys.github.io/QoRTs/QoRTs_LATEST.tar.gz",repos=NULL,type="source")
```

