---
title: Visualization
linkTitle: Visualization
type: docs
weight: 13
aliases:
    - /manuals_linux-cluster_jobs.html
    - /manuals_linux-cluster_jobs
---

## Compute Node

We support running graphical programs on the cluster using `VNC`. For more information refer to [Desktop Environments](/manuals/hpc_cluster/jobs/#desktop-environments).

## GPU Workstation

If a remote compute node does not fit your needs then we also have a GPU workstation specifically designed for rendering high resolution 3D graphics.

### Hardware
* Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
* DDR4 256GB @ 2400 MHz
* NVIDIA Corporation GM204GL [Quadro M5000]
* 1TB RAID 1 HDD

### Software
The GPU workstation is uniquely configured to be an extension of the HPCC cluster. Thus, all software available to the cluster is also available on the GPU workstation through [Environment Modules](manuals_linux-cluster_start.html#modules).

### Access
The GPU workstation is currently located in the Genomics building room 1208. Please check ahead of time to make sure the machine is available [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).
Once you have access to the GPU workstation, login with your cluster credentials. If your username does not appear in the list, you may need to click `Not listed?` at the bottom of the screen so that you are able to type in your username.

#### Usage
There are 2 ways to use the GPU workstation:
  1. Local - Run processes directly on the GPU workstation hardware
  2. Remote - Run processes remotely on the GPU cluster hardware

  **Local**

Local usage is very simple. Open a terminal and use the [Environment Modules](manuals_linux-cluster_start.html#modules) to load the desired software, then run your software from the terminal.
  For example:

```bash
module load amira
Amira
```

**Remotely**

Open a terminal and submit a job. This is to reserve the time on the remote GPU node. Then once your job has started connect to the remote GPU node via ssh and forward the graphics back to the GPU workstation.
For example:

1. Submit a job for March 28th, 2018 at 9:30am for a duration of 24 hours, 4 cpus, 100GB memory:

   ```bash
   sbatch --begin=2018-03-28T09:30:00 --time=24:00:00 -p gpu --gres=gpu:1 --mem=100g --cpus-per-task=4 --wrap='echo ${CUDA_VISIBLE_DEVICES} > ~/.CUDA_VISIBLE_DEVICES; sleep infinity'
   ```

   Read about [GPU jobs](manuals_linux-cluster_jobs.html#gpu-jobs) for more information regarding the above.

2. Run the VirtualGL client in order to receive 3D graphics from the remove GPU node:

   ```bash
   vglclient &
   ```

3. Wait for the job to start, and then check where your job is running:

   ```bash
   GPU_NODE=$(squeue -h -p gpu -u $USER -o '%N'); echo $GPU_NODE
   ```

4. The above command should result in a GPU node name, which you then need to SSH directly into with the following:

   ```bash
   ssh -XY $GPU_NODE
   ```

5. Once you have SSH'ed into the remote GPU node, run setup the environment and run your software:

   ```bash
   export NO_AT_BRIDGE=1
   module load amira
   vglrun -display :$(head -1 ~/.CUDA_VISIBLE_DEVICES) Amira
   ```

