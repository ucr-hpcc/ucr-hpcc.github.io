---
title: Visualization
linkTitle: Visualization
type: docs
weight: 14
aliases:
    - /manuals_linux-cluster_visual.html
    - /manuals_linux-cluster_visual
---

## Compute Node

We support running graphical programs on the cluster using `VNC`. For more information refer to [Desktop Environments](/manuals/hpc_cluster/jobs/#desktop-environments).

Additionally X11 forwarding is enable to allow for programs to run on the cluster but be rendered on your machine. To do this, make sure that you connect to the cluster with X11 forwarding enabled, then start a job on a compute node and be sure to use the `--x11` flag. For example:
```
# Local Machine
ssh -XY username@cluster.hpcc.ucr.edu

# Cluster (Head node)
xeyes  # Use this to test that x11 forwarding is working on a head node before going to a compute node.
srun -p epyc -c 8 --mem 16GB --x11 --pty bash -l

# Cluster (Compute node)
xeyes  # Verify x11 forwarding is still working on a compute node.
```
