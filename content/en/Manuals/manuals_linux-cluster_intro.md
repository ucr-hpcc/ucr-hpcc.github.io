---
layout: page
title: Linux Cluster - Introduction
permalink: manuals_linux-cluster_intro.html
---

## Introduction
This manual provides an introduction to the usage of the HPCC cluster.
All servers and compute resources of the HPCC cluster are available to researchers from all departments and colleges at UC Riverside for a minimal recharge fee [(see rates)](/#rates).
To request an account, please email [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).
The latest hardware/facility description for grant applications is available [here](https://goo.gl/43eOwQ).

## Overview

### Storage
* Four enterprise class HPC storage systems
* Approximately 2 PB (2048 TB) of network storage
* GPFS (NFS and SAMBA via GPFS)
* Automatic snapshots and archival backups

### Network
* Ethernet
    * 1 Gb/s switch x 5
    * 1 Gb/s switch 10 Gig uplink
    * 10 Gb/s switch for Campus wide Science DMZ
    * redundant, load balanced, robust mesh topology
* Interconnect
    * 56 Gb/s InfiniBand (FDR)

### Head Nodes
All users should access the cluster via ssh through cluster.hpcc.ucr.edu, this address will automatically balance traffic to one of the available head nodes.

* Penguin
    * Resources: 8 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 1 GB RAM) sample jobs
* Pigeon
    * Resources: 16 cores, 128 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 1 GB RAM) sample jobs
* Pelican
    * Resources: 32 cores, 64 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 1 GB RAM) sample jobs
* Parrot
    * Resources: 32 cores, 32 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 1 GB RAM) sample jobs

### Worker Nodes
* Batch
    * c01-c48: each with 64 AMD cores and 512 GB memory
* Highmem
    * h01-h06: each with 32 Intel cores and 1024 GB memory
* GPU
    * gpu01-gpu02: each with 32 (HT) cores Intel Haswell CPUs and 2 x NVIDIA Tesla K80 GPUs (~10000 CUDA cores each) and 128 GB memory
    * gpu03-gpu04: each with 32 (HT) cores Intel Haswell CPUs and 4 x NVIDIA Tesla K80 GPUs (~10000 CUDA cores each) and 128 GB memory
* Intel
    * i01-i40: each with 32 Intel Broadwell cores and  512 GB memory

