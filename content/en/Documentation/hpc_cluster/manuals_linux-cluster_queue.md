---
type: docs
linkTitle: Queue Policies
title: Queue Policies
permalink: manuals_linux-cluster_queue.html
---

## Start Times
Start times are a great way to track your jobs:
```bash
squeue -u $USER --start
```
Start times are rough estimates based on the current state of the queue.

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
