---
type: docs
linkTitle: Details
title: Hardware Details
weight: 2
aliases:
    - /hardware.html
    - /hardware
---

## Storage
* Four enterprise class HPC storage systems
* Approximately 3 PB production and 3 PB backup storage (total 6 PB or 6,144 TB)
* GPFS (NFS and SAMBA via GPFS)
* Automatic snapshots and monthly backups

## Network
* Ethernet
    * 2 x 40 Gb/s switch for campus high performance research network
    * 1 x 10 Gb/s connection to public internet
    * Redundant, load balanced, robust mesh topology
* Interconnect
    * 56/200/400 Gb/s InfiniBand (FDR/HDR/NDR)

## Head Nodes
All users should access the cluster via SSH through `cluster.hpcc.ucr.edu`. This address will automatically balance traffic to one of the available head nodes.

* bluejay, skylark
    * Resources: 256 cores, 512 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 0.5 GB RAM) sample jobs

## Worker Nodes
* Batch
    * c01-c48: each with 64x AMD cores (AMD Opteron 6376) and 512 GB memory
* Intel
    * i[01-02,17-40]: each with 32 Intel cores (Intel Xeon E5-2683 v4) and 512 GB memory
* Epyc
    * r21-r38: each with 256 AMD cores (AMD EPYC 7713) and 1 TB memory
* Highmem
    * h01-h06: each with 32x Intel cores (Intel Xeon E5-4620 v2) and 1024 GB memory
    * h07: 192x Intel Cores (Xeon Max 9468) and 3TB of memory
* Highclock
    * hz01-hz04: each with 64x Intel cores (Xeon Gold 6558Q) and 1024 GB memory
* GPU
    * gpu01-gpu02: each with dual 8c/16t Intel E5-2630 v3 Haswell CPUs and 2 x NVIDIA Tesla K80 GPUs (12GB and 2496 CUDA cores per GPU) and 128 GB memory
    * gpu03-gpu04: each with dual 12c/24t Intel E5-2650 v4 Intel Broadwell CPUs and 4 x NVIDIA Tesla K80 GPUs (12GB and 2496 CUDA cores per GPU) and 512 GB memory
    * gpu05: with dual 16c/32t Intel E5-2683 v4 Broadwell CPUs and 2 x NVIDIA Tesla P100 GPUs (16GB and 3584 CUDA cores per GPU) and 256 GB memory
    * gpu06-gpu08: with dual 32c/32t AMD EPYC 7543 CPUs and 8 x NVIDIA A100 GPUs (80GB and 6912 CUDA cores per GPU) and 1,024 GB memory
