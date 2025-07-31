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
    * 2 x 40 Gb/s redundant connections to the campus high performance research network
    * 1 x 10 Gb/s connection to the public internet
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
For a full list of nodes, please see our [Node List](https://docs.google.com/spreadsheets/d/1SVH1-c1i075vjt-B0wNPiK87wmLkPltWJlIPgLkmoqU/) sheet. This contains info on all nodes (public and private) that we have. This includes CPU, memory, and GPU specs, as well as any features that the nodes have.

For more info about queueing jobs see the [Managing Jobs](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/) page. For queueing jobs to nodes with specific features, see the [Feature Constraints](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#feature-constraints) section.
