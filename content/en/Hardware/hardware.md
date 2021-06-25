---
layout: page
title: Hardware Details
---

## Storage
* Four enterprise class HPC storage systems
* Approximately 2 PB (2048 TB) of network storage
* GPFS (NFS and SAMBA via GPFS)
* Automatic snapshots and archival backups

## Network
* Ethernet
    * 5 x 1 Gb/s switch
    * 5 x 1 Gb/s switch 10 Gig uplink
    * 1 x 10 Gb/s switch for campus high performance research network
    * Redundant, load balanced, robust mesh topology
* Interconnect
    * 56 Gb/s InfiniBand (FDR)

## Head Nodes
All users should access the cluster via SSH through `cluster.hpcc.ucr.edu`. This address will automatically balance traffic to one of the available head nodes.

* Pigeon
    * Resources: 16 cores, 128 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Pelican
    * Resources: 32 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Penguin
    * Resources: 8 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs
* Parrot
    * Resources: 32 cores, 32 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 30 % RAM) sample jobs

## Worker Nodes
* Batch
    * c01-c48: each with 64 AMD cores and 512 GB memory
* Highmem
    * h01-h06: each with 32 Intel cores and 1024 GB memory
* GPU
    * gpu01-gpu02: each with 32 (HT) cores Intel Haswell CPUs and 2 x NVIDIA Tesla K80 GPUs (~10000 CUDA cores) and 128 GB memory
    * gpu03-gpu04: each with 48 (HT) cores Intel Broadwell CPUs and 4 x NVIDIA Tesla K80 GPUs (~20000 CUDA cores) and 512 GB memory
    * gpu05: with 64 (HT) cores Intel Broadwell CPUs and 2 x NVIDIA Tesla P100 GPUs (~5200 CUDA cores) and 256 GB memory
* Intel
    * i01-i54: each with 32 Intel Broadwell cores and 256-512 GB memory
