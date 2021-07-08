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
The miniconda2 module for Python is the default version. This will enable users to leverage the conda installer, but with as few Python packages pre-installed as possible. This is to avoid conflicts with future needs of individuals.

#### Conda
We have several Conda software modules:
  1. miniconda2 - Basic Python 2 install (default)
  2. miniconda3 - Basic Python 3 install
  3. anaconda2  - Full Python 2 install
  4. anaconda3  - Full Python 3 install
For more information regarding our module system please refer to [Environment Modules](manuals_linux-cluster_start.html#modules).

The miniconda modules are very basic installs, however users can choose to unload this basic install for a fuller one (anaconda), like so:

```bash
module load miniconda2 #This is the default
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

Then create your Python 2 conda environment, like so:

```bash
conda create -n NameForNewEnv python=2.7.14 # Many Python versions are available
```

For Python 3, please use the miniconda3, like so:

```bash
module unload miniconda2
module load miniconda3
conda create -n NameForNewEnv python=3.6.4 # Many Python versions are available
```

##### Activating
Once your virtual environment has been created, you need to activate it before you can use it:

```bash
conda activate NameForNewEnv
```

##### Deactivating
In order to exit from your virtual environment, do the following:

```bash
conda deactivate
```

##### Installing packages
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
You can run jupyter as an interactive job using [tunneling](manuals_linux-cluster_jobs.html#web-browser-access), or you can use the web portal [Jupyter-Hub](https://jupyter.hpcc.ucr.edu).

#### Virtual Environment
In order to enable your conda virtual environemnt within the Jupyter web portal you will need to do the following:

```bash
# Create a virtual environment, if you don't already have one
conda create -n ipykernel_py2 python=2 ipykernel

# Load the new environment
conda activate ipykernel_py2

# Install kernel
python -m ipykernel install --user --name myenv --display-name "JupyterPy2"
```

Now when you visit [Jupyter-Hub](https://jupyter.hpcc.ucr.edu) you should see the option "JupyterPy2" when you click the "New" dropdown menu in the upper left corner of the home page.

#### R
For instructions on how to configure your R environment please visit [IRkernel](https://github.com/IRkernel/IRkernel).
Since we should already have IRkernel install in the latest version of R, you would only need to do the following within R:

```R
IRkernel::installspec(name = 'ir44', displayname = 'R 4.0.1')
```

## R
This section is regarding how to manage R packages.

### Current R Version
Currently the default version of R is 4.0.1 and is loaded automatically for you.
This can be seen by running:

```bash
module list
```

### Older R Versions
You can load older versions of R with the following:

```bash
module unload R
module load R/3.4.2
```

### Installing R Packages
The default version of R has many of the most popular R packages available already installed.
It is also possible for you to install additional R packages in your local environments. 

#### Bioconductor Packages
To install from Bioconductor you can use the following method:

```R
BiocManager::install(c("package-to-install", "another-packages-to-install"))
Update all/some/none? [a/s/n]: n
```

For more information please visit [Bioconductor Install Page](https://www.bioconductor.org/install/).

#### GitHub Packages

```R
library(devtools)
install_github("duncantl/RGoogleDocs") # replace name with the GitHub account/repo
```

#### Local Packages

```R
install.packages("http://hartleys.github.io/QoRTs/QoRTs_LATEST.tar.gz",repos=NULL,type="source") # replace URL with your URL or local path to your .tar.gz file
```

