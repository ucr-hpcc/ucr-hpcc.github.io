---
linkTitle: "JupyterLab"
title: "JupyterLab Usage on HPCC"
type: docs
weight: 1
---

## Introduction

The JupyterLab servers hosted by HPCC are shared machines, meaning that they are prone to a single user monopolizing resources. To combat this, we can run an instance of JupyterLab on a compute node, giving dedicated resources to the process. This also opens the door to using GPUs when ran on a GPU-enabled server.

## Steps

First, start an interactive session on a compute node

```
srun -p batch -t 4:00:00 -c 4 --mem=10GB --pty bash -l    # Customize as needed
```

After your job has been scheduled, activate the jupyterlab module and start the server.

```
module load jupyterlab/
start-jupyter.sh
```

When running `start-jupyter.sh`, it will prompt you for a password. Enter a password that you would like to use to access the notebook.
NOTE: Text will not show up when you type your password, this is expected.

![jupyter start](/img/jupyter1.png)

After entering a password, it will print some text guiding you on creating a tunnel.

![jupyter info](/img/jupyter2.png)

**NOTE: The port and node will likely be different than pictured. This is expected, and unique to each session.**

As the text suggests, enter the `ssh -NL` command in your terminal or setup MobaXTerm with the supplied details. If using the `ssh` method, the **terminal is expected to hang after logging in and no further output should be generated.**

After a few seconds the server will start. At this point you can navigate to "http://127.0.0.1:PORT/lab" on your local machine, **replacing PORT with the port assigned when running the `start-jupyter.sh` command (9345 in the example above).

## Logging In

After navigating to the login page, you will be prompted for the password you originally gave the notebook.

After logging in, you can use the notebook as you would on our hosted JupyterLab server.
