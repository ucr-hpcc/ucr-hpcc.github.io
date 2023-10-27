---
title: Introduction
linkTitle: Introduction
type: docs
weight: 1
aliases:
    - /index.html
    - /index
---

## Introduction
This manual provides an introduction to the usage of the HPCC cluster.
All servers and compute resources of the HPCC cluster are available to researchers from all departments and colleges at UC Riverside for a minimal recharge fee [(see rates)](/about/facility/rates).
To request an account, please email [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).
The latest hardware/facility description for grant applications is available [here](https://goo.gl/43eOwQ).

## Overview

### Storage
* Four enterprise class HPC storage systems
* Approximately 6 PB of total network storage (3,072 TB production and 3,072 TB backup) 
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

* Jay
    * Resources: 64 cores, 512 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 1 GB RAM) sample jobs
* Lark
    * Resources: 64 cores, 512 GB memory
    * Primary function: submitting jobs to the queuing system
    * Secondary function: development; code editing and running small (under 50 % CPU and under 1 GB RAM) sample jobs

### Worker Nodes
* Batch
    * c01-c48: each with 64 AMD cores and 512 GB memory
* Intel
    * i01-i40: each with 32 Intel Broadwell cores and 512 GB memory
* Epyc
    * r21-r38: each with 64 AMD EPYC cores and 1 TB memory
* Highmem
    * h01-h06: each with 32 Intel cores and 1024 GB memory
* GPU
    * gpu01-gpu02: each with 32 (HT) cores Intel Haswell CPUs and 2 x NVIDIA Kepler K80 GPUs (12GB and 2496 CUDA cores per GPU) and 128 GB memory
    * gpu03-gpu04: each with 48 (HT) cores Intel Broadwell CPUs and 4 x NVIDIA Kepler K80 GPUs (12GB and 2496 CUDA cores per GPU) and 512 GB memory
    * gpu05: 64 (HT) cores Intel Broadwell CPUs and 2 x NVIDIA Pascal P100 GPUs (16GB and 3584 CUDA cores per GPU) and 256 GB memory
    * gpu06-gpu08: with 64-128 (HT) cores AMD CPUs and 8 x NVIDIA A100 GPUs (80GB and 6912 CUDA cores per GPU) and 1,024 GB memory

