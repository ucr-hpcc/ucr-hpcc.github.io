---
linkTitle: "Open OnDemand"
title: "Open OnDemand Usage"
type: docs
weight: 1
---

## What is OnDemand?

[Open OnDemand](https://openondemand.org/) allows users to access our cluster resources purely through a web browser. No additional client software is required. OnDemand gives users the ability to launch "Interactive Apps" such as Jupyter, RStudio, Matlab, Mathematica, and VSCode and connect to them through your browser.

User's also have the ability to upload/download files to/from the cluster, connect to the cluster via SSH, and create batch job templates.

The sections below go over using OnDemand, as well as a couple pieces of popular software.


## Accessing OnDemand

Our OnDemand instance is located here: [https://ondemand.hpcc.ucr.edu/](https://ondemand.hpcc.ucr.edu/). Log in with your **cluster** login details and verify your login with Duo's two-factor authentication.


## Jupyter on OnDemand

After logging in, select "Jupyter Notebook" from the "Interactive Apps" tab from the menu bar.

![jupytermenu](/img/ondemand_jupyter1.png)

From there, select the resources you need, time you want, partition to run the job on, and click "Launch".

![jupyterparams](/img/ondemand_jupyter2.png)

Your job will then be queued and eventually start running.

![jupyterqueue1](/img/ondemand_jupyter3.png)

![jupyterqueue2](/img/ondemand_jupyter4.png)

Click "Connect to Jupyter" to open a new window containing Jupyter and start working!

### Using Remote Kernels in VSCode

VSCode allows you to run your code using a remote kernel. They provide some instructions [here](https://code.visualstudio.com/docs/datascience/jupyter-notebooks#_connect-to-a-remote-jupyter-server). Using the OnDemand Jupyter requires a couple of additional extra steps.

When you start a new Jupyter session on OnDemand, it should provide you with a command to set up an [SSH Tunnel](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#tunneling). This command should be run **on your local machine** and *not* on the cluster. Note that numbers and node name will likely be different!

![jupyterqueue2](/img/ondemand_jupyter5.png)


At this point, you should be able to navigate to the provided URL along with the provided password to access your Jupyter session.

To connect within VSCode you'll need the [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) extension installed. Within a `.ipynb` file, find the "Select Kernel" option in the top right of your screen, select "Existing Jupyter Server", and paste the URL provided by OnDemand. When asked for a password, use the one provided by OnDemand.

From there you should be able to select the kernel that you would like to run.


## RStudio on OnDemand

The process of launching RStudio is almost identical to that of starting Jupyter, but selecting "RStudio Server" instead of "Jupyter Notebook" from the menu.

![rstudiomenu](/img/ondemand_rstudio1.png)

Please see the Jupyter section for selecting resources and opening the RStudio window.


## Desktop Session on OnDemand

A Desktop session is a Virtual Desktop that is running on the cluster. It will allow you to run programs that require GUIs without going through the steps of forwarding X11 sessions.

![rstudiomenu](/img/ondemand_desktop2.png)

Similar to Jupyter and RStudio, a Desktop Session can be started by selecting "HPCC Desktop" from the menu dropdown.

![rstudiomenu](/img/ondemand_desktop1.png)

Please see the Jupyter section for selecting resources and opening the Desktop Window.


## Using GPUs on OnDemand

In many of the interactive session launch pages, the "Additional Slurm Arguments" option is available.

![GPU Menu1](/img/ondemand_use_gpu.png)

To select a GPU, you can use the same `--gres` argument as you would with the `srun` command or in `sbatch` scripts.

For example, to get 1x A100 GPU for a job, be sure to select the `gpu` partition and enter `--gres=gpu:a100:1` in the Additional SLurm Arguments box.


## Troubleshooting Jobs

### RStudio Crashes

![jupyterqueue2](/img/ondemand_r_crash.png)

If your RStudio session crashes with an error similar to the following, first try increasing the memory allocated to your job. If your R program attempts to allocate too much memory it will be killed by Slurm, causing an error similar to the one pictured.

To confirm whether or not this is the problem you are encountering:
1. Copy the Job ID from OnDemand
2. Delete the job (This will remove the dialog, so make sure you copy the JobID first)
3. Using a terminal, run `sacct -j ####`

If one of the job steps existed with the reason "OUT_OF_MEM", then you need to allocate more memory to RStudio.

![jupyterqueue2](/img/ondemand_r_crash2.png)
