---
title: News and announcements
linkTitle: Announcements
type: docs
weight: 1
aliases:
    - /news.html
    - /news
---

Note: for the most current information on exceptions on HPCC's cluster please
consult its [Alerts](/news/alerts) or [Twitter](https://twitter.com/UCR_HPCC) pages.

### May 2025
* The HPCC is proud to announce the deployment of a new high-memory node (h07) as well as 4 "high clock" nodes (hz01-hz04). The high memory node is equipt with 3TB of memory as well as a modern Intel Xeon Max 9468 CPU. Since this node is a part of the normal "highmem" partition, to access it you can use the `--constraint=sapphire` flag. More info on Slurm constraints can be found on our documentation [here](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#feature-constraints). The high clock machines are available to use in the "highclock" partition and are equipt with Intel Xeon Gold 6558Q processors capable of boosting up to 4.1GHz. Quotas for the "highclock" partition can be found on our [Queue Policies](https://hpcc.ucr.edu/manuals/hpc_cluster/queue/#partition-quotas) page.

### Mar 2025
* Finally the HPCC will be moving its computing infrastructure from Genomics to the newly renovated and much larger server room in the SOM-ED1 building. Details are provided [here](https://hpcc.ucr.edu/news/alerts/#scheduled-exceptions-and-downtimes). 

### Oct 2024
* To allow for more users to gain access our GPUs, we have reduced the per-user GPU limit from 8 to 4. Additionally, we have reduced the maximum job runtime for the GPU partition from 30 days down to 7. Should you need an increase in the time limit or number of GPUs you can use in parallel, please email support@hpcc.ucr.edu (please also CC your PI) with a short justification and timeline for the increase.

### Oct 2023
* The new NSF-MRI funded cluster is now available to users. It includes 2 head (called `bluejay` and `skylark`) and 20 compute nodes, each with two 64-core AMD EPYC CPUs and 1TB of RAM. In total this adds 2,816 CPU cores to our HPC infrastructure. In addition, 2 powerful GPU nodes were installed, each with 8x A100 GPUs and two AMD EPYC CPUs. Combined with our existing 8x A100 GPU HGX system, this gives us a total of 24x A100 GPUs which are some of the most powerful GPUs on the market. The new CPU and GPU nodes are connected via the latest NDR Infiniband network (400-800Gb/s). 
* The new CPU nodes can be accessed via a newly added partition (queue) called “epyc”. The A100 GPU nodes (`gpu[07-08]`) can be accessed via the “gpu” partition. Additional details on using the new partitions and user quota can be found [here](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/) and [here](https://hpcc.ucr.edu/manuals/hpc_cluster/queue/). 

### Sep 2023
* Stata 17 has been superseded with Stata 18. Please update scripts relying on the stata/17 module to use the stata/18 module instead.

### Aug 2022
* In August 2022 we were awarded an MRI equipment grant ([#2215705](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2215705&HistoricalAwards=false)) by NSF for the acquisition of a Big Data HPC Cluster in the total amount of $942,829. 

### Feb/Mar 2022
* Rollout of Rocky and DUO: Feb 18 through Mar 17, 2022. For details see [here](https://hpcc.ucr.edu/changes/).

### Mar 2021
* Viet Pham joins HPCC as HPC systems administrator. - Welcome Viet!

### May/Jun 2020
* Melody Asghari joins HPCC as HPC systems administrator assistant. - Welcome Melody!

### Mar/Apr 2020

* For updates on HPCC's operation during the COVID-19 crisis please visit the [Alerts](/news/alerts#hpcc-operation-during-covid-19-crisis) page of this site.

### Sep 2019

* Travis Nasser joins HPCC as HPC systems administrator assistant. - Welcome Travis!
* Major updates applied. - Check here for important [changes](/changes).

### Aug 2019

* Charles Forsyth left the position of HPC systems administrator and has moved on to new opportunities. - Good luck Chuck!

### Apr 2018

* Abraham Park joins HPCC as HPC systems administrator assistant. - Welcome Abe!

### Jun 2017

* Charles Forsyth joins HPCC as new full-time HPC systems administrator. - Welcome Chuck!

### Feb 2017

With funding provided by Michael Pazzani's office (RED) we were able to purchase and install major hardware upgrades. This included the following hardware resources:

* Added 28 Intel nodes with a total of 896 CPU cores (or 1,792 logical CPU cores) and 512 GB of RAM per node
* Added 8 NVIDIA K80 GPUs increasing total number of cuda cores in GPU queue to 59,904
* Redesign of Infiniband network to support new computer nodes and enhance future scalabilty of IB network to over 1000 nodes

### Dec 2016

* UCR approval of plans to form HPC Center 

### Sept 2016

* Expansion of GPFS storage system: 2 disk enclosures for 120 8TB drives
* Expansion of high-memory queue: 4 nodes
* Install of new Intel batch queue: 12 nodes

### Mar 2016

* Expansion of batch queues: 14 nodes

### Apr 2015 

* Deployment of new FDR IB network @ 56Gbs
* Deployment of 28 AMD nodes (2,048 AMD cores), funded by NSF-MRI-2014
* Deployment of high-memory Intel nodes (each with 1TB RAM)
* Deployment of GPU nodes (NVIDIA K80)
* Deployment of big data GPFS disk storage system, funded by NIH-S10-2014

### May 2014

Award of equipment grants from NSF and NIH

* NIH-S10-2014 (1S10OD016290-01A1): $652,816
* NSF-MRI-2014 (MRI-1429826): $783,537

