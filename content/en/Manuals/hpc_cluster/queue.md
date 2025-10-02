---
title: Queue Policies
linkTitle: Queue Policies
type: docs
weight: 4
aliases:
    - /manuals_linux-cluster_queue.html
    - /manuals_linux-cluster_queue
---

## Start Times
Start times are a great way to track your jobs:
```bash
squeue -u $USER --start
```
Start times are rough estimates based on the current state of the queue.

## Partition Quotas

Each partition has a specific usecase. Below outlines each partition, it's usecase, as well as any job/user/group limits that are in place.
Empty boxes imply no limit, but is still limited by the next higher limit. Job limits are capped by user limits, and user limits are capped by group limits.

| Partition Name   | Usecase                                                   | Per-User Limit             | Per-Job Limit                             | Max Job Time |
|------------------|-----------------------------------------------------------|----------------------------|-------------------------------------------|--------------|
| epyc (2021 CPU), intel (2016 CPU), batch (2012 CPU)  | CPU Intensive Workloads, Multithreaded, MPI, OpenMP       | 384 Cores, 1TB memory [^7] | 64GB memory per Core [^1],[^4]            | 30 Days      |
| batch (2012 CPU) | CPU Intensive Workloads, Multithreaded, MPI, OpenMP       | 384 Cores, 1TB memory [^7] | 64GB memory per Core [^1],[^2]            | 30 Days      |
| short            | Short CPU Intensive Workloads, Multithreaded, MPI, OpenMP | 384 Cores, 1TB memory      | 64GB memory per Core, 2-hour time limit   | 2 Hours      |
| highmem          | Memory Intensive Workloads                                | 32 Cores, 2TB memory       |                                           | 30 Days      |
| highclock        | Low Parallelism Workloads                                 | 32 Cores, 256GB memory       |                                           | 30 Days      |
| gpu              | GPU-Enabled Workloads                                     | 4 GPUs[^6],48 Cores, 512GB memory | 16 Cores, 256GB memory [^1],[^5]          | 7 Days      |

 [^1]: A 64GB-per-core limit is placed to prevent over allocating memory compared to CPUs. If more than a 64GB-per-core ratio is requested, the core count will be increased to match.  
 [^2]: Allocatable memory per-node in the **batch** partition is limited to **~500GB** to allow for system overhead.  
 [^3]: Allocatable memory per-node in the **intel** partition is limited to **~450GB** to allow for system overhead.  
 [^4]: Allocatable memory per-node in the **epyc** partition is limited to **~950GB** to allow for system overhead.  
 [^5]: Allocatable memory per-node in the **gpu** partition is dependent on the node. 115GB for gpu[01-02], 500GB for gpu[03-04], 200GB for gpu05, 922GB for gpu06, 950GB for gpu[07-08]  
 [^6]: If a user needs more than 4 GPUs, please contact support@hpcc.ucr.edu with a short justification for a temporary increase.
 [^7]: The 384 core/1TB limit is per-user across all CPU compute partitions (epyc, intel, and batch). Attempting to run more then 384 cores, even if across multiple CPU compute partitions, will be queued until resources become available. Specialized partitions (eg. short, highmem, gpu) will not count against the CPU compute partition's quotas.

In addition to the above limits, there is:
- A 768 core group limit that spans across all users in a group across all partitions.
- A 8 GPU group limit that spans across all users in a group across all GPU-enabled partitions.

For more detailed information on node hardware, see our [Node List](https://docs.google.com/spreadsheets/d/1SVH1-c1i075vjt-B0wNPiK87wmLkPltWJlIPgLkmoqU/) spreadsheet.

Attempting to allocate more member than a node can support, eg 500GB on an Intel node, will cause the job to immediately fail. Limits are for actively running jobs,
and any newly queued job that exceeds a limit will be queued until resources become available. If you require additional
resourced beyond the listed limits, please see the "[Additional Resource Request](#additional-resource-request)" section below.

Partition quotas can also be viewed on the cluster using the `slurm_limits` command.

Additionally, users can have up to 5000 jobs in queue/running at the same time. Attempting to queue more than 5000 jobs will cause jobs submissions to fail with the reason "MaxSubmitJobLimit".

### External Labs

Labs external to UCR will have reduced resource limits as follows:
- Labs will have a CPU quota of 256 cores across all lab users across all partitions
- Per user CPU quotas on epyc, intel, batch, and short will be 128 cores
- Per user CPU quotas on highmem will be 16
- GPU quotas on the gpu partition will be 4 per-lab, and 2 per-user
- CPU quotas on the gpu partition will be 24 per-user and 8 per-job

### Private Node Ownership

Labs have the ability to purchase nodes and connect them to the cluster for increased quotas. More information can be found in the [Ownership Model](https://hpcc.ucr.edu/about/overview/access/#ownership-models) section of our Access page.

### Additional Resource Request

Sometimes, whether it be due to deadlines or technical limitations, more resources might be needed than are supplied by default. If you require
a temporary increase in quotas, please reach out to support@hpcc.ucr.edu with a complete "[Justification for Quota Exception](https://docs.google.com/document/d/1Ate2yOdmaYrwzcjNp8S4-8VeAuH2WYwAuyVxAv0FDfo/)" form.
The following are typical circumstances that could justify increased quotas:
 - **Urgent Deadlines**: ie. Grant submissions, conference presentations, paper deadlines
 - **Special Technical Needs**: The limits do not meet the technical requirements for the program(s) that are trying to be ran.

The amount of additional resources, the length of time that the resources are needed, and the frequency of the requests are all factors that determine whether your request
will be accepted. It also must be within the capacity of the HPCC's infrastructure while also ensuring minimal disruption to other users. The final decision of approving
exception requests, and how many extra resources to provide, will be decided by the HPCC Staff, the Director, and in exceptional cases the HPCC Oversight Committee.

Requests limited by unoptimized code/datasets or strictly for the sake of convenience will be denied.

Additionally at this time we are unable to grant additional resource requests for external labs due to how our cluster is partially subsidized by our campus. We appologize for this,
and suggest looking into national computing facilities or cloud offerings to fill the gap in compute.

### Example Scenarios

#### Per-Job Limit

A job is submitted on the gpu partition. The job requests 32 cores.

> This job will not be able to be submitted, as 32 cores is above the partition's 16 core per-job limit.

#### Per-User Limit

You submit a job the highmem partition, requesting 32 cores.

> This job will start successfully, as it is within the partition's core limit.

You submit a second job while the first job is still running. The new job is requesting 32 cores.

> Because you are at your per-user core limit on the highmem partition, the second job will be queued until the first job finishes.

#### Per-Lab Limit

User A submits a job requesting 384 cores. User B submits a job requesting 384 cores.

> Because each user is within their per-user limits and the lab is within their limit, the jobs will run in parallel.

User C submits a job, requesting 16 cores.

> Because User A and User B are using all 768 cores within the lab, User C's job will be queued until either User A's or User B's jobs finishes.

## Changing Partitions

In `srun` commands and `sbatch` scripts, the `-p` or `--partition` flag controls which partition/queue a job will run on. For example,
using `-p epyc` will have your job queued and ran on the `epyc` partition. For more examples and information on running jobs,
see the [Managing Jobs](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/) page of our documentation.

## Fair-Share
Users that have not submitted any jobs in a long time usually have a higher priority over others that have ran jobs recently.
Thus the estimated start times can be extended to allow everyone their fair share of the system.
This prevents a few large groups from dominating the queuing system for long periods of time.

You can see with the `sqmore` command what priority your job has (list is sorted from lowest to highest priority).
You can also check to see how your group's priority is compared to other groups on the cluster with the "sshare" command.

For example:
```bash
sshare
```

It may also be useful to see your entire group's fairshare score and who has used the most shares:
```bash
sshare -A $GROUP --all
```

Lastley, if you only want to see your own fairshare score:
```bash
sshare -A $GROUP -u $USER
```

The fairshare score is a number between 0 and 1. The best score being 1, and the worst being 0.
The fairshare score approches zero the more resource you (or your group) consume.
Your individual consumption of resources (usage) does affect your entire group's fiarshare score.
The affects of your running/completed jobs on your fairshare score are halved each day (half-life).
Thus, after waiting several days without running any jobs, you should see an improvment in your fairshare score.

Here is a very good [explaination of fairshare](https://www.rc.fas.harvard.edu/fairshare/).

## Priority
The fairshare score and jobs queue wait time is used to calculate your job's priority.
You can use the `sprio` command to check the priority of your jobs:

```
sprio -u $USER
```

Even if your group has a lower fairshare score, your job may still have a very high priority.
This would be likely due to the job's queue wait time, and it should start as soon as possible regardless of fairshare score.
You can use the `sqmore` command to see a list of all jobs sorted by priority.

## Backfill
Some small jobs may start before yours, only if they can complete before yours starts and thus not negatively affecting your start time.

## Priority Partition
Some groups on our system have purchased additional hardware. These nodes will not be affected by the fairshare score.
This is because jobs submitted to the group's partition will be evaluated first before any other jobs that have been submitted to those nodes from a different partition.


## Using the Preempt Partitions (TENATIVE)

**NOTE** The full release of the preempt partition is planned for future release and **is not** yet available!

This guide assumes that you know how to run Interactive and Batch jobs through Slurm. If you do not, then please see the [Managing Jobs](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/) page of our documentation.

There are two partitions that will have preemption enabled: "preempt" for CPU jobs, and "preempt_gpu" for GPU jobs.

To fully take advantage of preemption, your jobs must be be able to tolerate being cancelled at a random time and restarted at some later point in the future. When your job is preempted, it will be cancelled and requeued. When the job is elegible to start again, it will start from the beginning of the sbatch script as if it were newly run.

Your job is only guaranteed **1 minute** of uninterrupted runtime after it starts before it is elegible to be preempted by higher priority jobs.

### Job Limitations

#### Time

As mentioned above, jobs can be killed at any time after the 1 minute grace period. Jobs should be set up such that any initialization steps that cannot tolerate being randomly killed happen within that first minute. The max walltime of a job is currently set to 1 day (24 hours).

#### Resources

Currently, users are allowed to use an equal number of CPU cores as their current per-partition CPU limit. If you're currently allowed to use 384 cores on the epyc partition, then you can use 384 cores on the preempt partition. The same applies to memory. For the GPU partition, users are currently allowed to use 1 GPU on the "preempt_gpu" partition.

### Starting a job

Similar to other partitions, you must specifically queue jobs to the `preempt` partition. One special thing that is required is to also specify the `preempt` account using `-A preempt`. Jobs started on the preempt partition **do not** count against your lab's CPU quota.

#### Interactive Example

To start a CPU preemptable interactive job, you can build off of the following command:
```bash
srun -A preempt -p preempt -c 8 --mem 8GB --pty bash -l
```

This will start a job with 8 cores and 8GB of memory on the `preempt` partition under the `preempt` account. Jobs that do not explicitly state `-A preempt` will fail to start. Note that because this is a preemptable job, your session can be terminated at any moment without notice after the 1 minute grace period.

To start a GPU preemptable interactive job, you can build off of the following command:
```bash
srun -A preempt -p preempt_gpu --gres=gpu:1 -c 8 --mem 8GB --pty bash -l
```

#### Non-interactive (batch) Example

As with all preemptable jobs, batch jobs can be cancelled at any time without notice and your programs/scripts *must* be able to tolerate this. Jobs that have been preempted will automatically be requeued to resume running at a later time when resources become available. The `$SLURM_RESTART_COUNT` environment variable can be used to check if the job has been preempted and restarted to allow you to recover and resume running.

To start a batch job, you can build off of the following sbatch file:
```
#!/bin/bash -l

#SBATCH -A preempt
#SBATCH -p preempt
#SBATCH -c 8
#SBATCH --mem 8GB
#SBATCH --time 1-00:00:00

# Check if this is the first run or a resumed job
if [ "$SLURM_RESTART_COUNT" -eq 0 ]; then
    echo "This is the first time running the job"
    # Put the code for the first run here
    # Example: initializing data or setting up environment
    # Remember that a job only has 1 minute of guaranteed runtime. Keep
    # any initialization/recovery short otherwise it might be interrupted
else
    echo "The job is being resumed after a preemption"
    # Put the code for a resumed job here
    # Example: resuming from a checkpoint or continuing work
    # Remember that a job only has 1 minute of guaranteed runtime. Keep
    # any initialization/recovery short otherwise it might be interrupted
fi

# Common job code that runs regardless of first run or resume
echo "Running main job tasks..."
# Put your main job code here
```

Jobs that do not explicitly state `#SBATCH -A preempt` will fail to start. Note that because this is a preemptable job, your job can be cancelled at any moment without notice.

#### Selecting Resources

Similar to the Short partition, the Preempt partition is a union of all public and private machines, excluding specialty partitions like highmem, highclock, GPU, etc. This means that if you do not specify any restrictions, your job can run on nodes in the batch, intel, or epyc partition. If a certain architecture is required for your job, then you can use the `--constraint` flag.

For example, if you want your job to run on an Intel machine, you can include `#SBATCH --constraint=intel` in your sbatch script, or `--constraint=intel` in your srun command. If you want either an Intel or Epyc Rome machine, then you could use `#SBATCH --constraint=intel|rome` in your sbatch script, or `constraint=intel|rome` in your srun command. More information on constraints is available in the [Slurm Documentation](https://slurm.schedmd.com/sbatch.html#OPT_constraint). 

To view which nodes contain which features, see the Feature Constraints listed on the [Feature Constraints](https://hpcc.ucr.edu/manuals/hpc_cluster/jobs/#feature-constraints) page
