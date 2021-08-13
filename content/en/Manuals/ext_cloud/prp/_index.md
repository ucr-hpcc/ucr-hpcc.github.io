---
title: PRP
linkTitle: PRP
type: docs
toc_hide: true
---

> CAVEATS:
>
> A fair amount of resources must be manually calculated from the [currently available](https://nautilus.optiputer.net/resources).
>
> Also, it seems like a beta feature would repalce what I did here:
>
> https://kubernetes.io/blog/2021/04/19/introducing-indexed-jobs/
>

The `PRP` (Pacific Research Platform) is a [NSF](https://nsf.gov/) funded Kubernetes infrastructure and therefore requires the use of a Kubernetes interface.
The command line Kubernetes interface `kubectl` is what is used from the HPC cluster.

## Account

Follow the guides on the `PRP` website posted [here](https://pacificresearchplatform.org/userdocs/start/toc-start/).
There is a link called `Get access`, depending on your role, you can request a `admin` account or a `user` account.

## Install

Once you have an account, and you have read all of the docs [here](https://pacificresearchplatform.org/userdocs/start/toc-start/), you can proceed to install.
Submitting jobs, checking states, getting logs as well as interactive sessions can all be done from the HPCC.

However, running these operations directly from your laptop/workstation can be faster.
In order to run these actions locally you will need to install `kubectl` on your local laptop/workstation.

You can install `kubectl` via `conda`, like so:

```bash
conda create -n kube -c anaconda-platform kubectl
```

If you do not yet have `conda` installed, follow these [instructions](https://conda.io/projects/conda/en/latest/user-guide/install/index.html#regular-installation).

## Config

For `kubectl` to function, it requires your `config` file provdied by `PRP`.
In order to get the `PRP` Kubernetes `config` file, do the following:
  1. Visit [Nautilus Portal](https://nautilus.optiputer.net/)
  2. Click on `Login` in upper right coner.
  3. Login using CILogon credentials (A.K.A UCR `netID`).
  4. Once authenticated, click on the `Get config` in the upper right conner.
  5. This takes a while to dynamically generate, just wait and eventually your browser will present you a download prompt.
  6. Place this file in your `~/.kube` directory.

Next set the namespace, or else you will have to append the `-n ucr-hpcc` flag to every Kubernetes command.
You may be under the `ucr-hpcc` namespace if you are testing, otherwise you should have your own namespace:

```bash
kubectl config set-context nautilus --namespace=ucr-hpcc
```

## Usage

Here is an example of an array style job on utilizing redis to track job numbers, and the dockerfile stored within the [PRP GitLab repository](https://gitlab.nrp-nautilus.io/ucr-hpcc/ucr-hpcc-queue).

1. First copy `scripts/*` files from the repo to your code base. Make sure that your analysis workflow is started within the `worker.py` script.

2. Create `redis` service and deployment

```bash
kubectl create -f hpcc-redis.yml
```

3. Log into `Redis` pod and manually add items

```bash
# Get into pod
kubectl exec -it redis-master -- /bin/bash

# Add 10 items to list "job2"
echo lpush job2 {1..10} | redis-cli -h redis --pipe

# Print all items in "job2"
redis-cli -h redis lrange job2 0 -1
```

4. Submit job

```bash
kubectl create -f hpcc-job.yml
```

## Egress

The `PRP` has `fail2ban` blocking rapid SSH connections, so copying files within a loop would fail.
It is best to try and copy all needed files with a single `rsync` command, like so:

```bash
nohup rsync -rvP --include='*/spades.log.gz' --include='*/scaffolds.fasta' --exclude='*/*' /output/ cluster.hpcc.ucr.edu:~/output &> rsync_spades.log
```

The above `rsync` command looks into the sub-directories within `/output` and will copy only the `spades.log.gz` and `scaffolds.fasta` files from each onto the HPCC cluster.

## Trouble

From pod list, check log:

```bash
kubectl logs hpcc-pod
```

Jobs and pods will expire after 1 week, however you can alter this with the following:

```yml
ttlSecondsAfterFinished=604800
```

Check on the pod details:

```bash
kubectl describe pod hpcc-pod
```

Delete job if you want to rerun, this will also delete associated pods:

```bash
kubectl delete pods hpcc-pod
```

For updating your repo to the lastest HPCC changes, you can sync like so:

```
# Add upstream
git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git

# Get branchs
git fetch upstream

# Sync local files with master branch
git pull upstream master
```

## Links

* Help - https://element.nrp-nautilus.io
* Resources - https://nautilus.optiputer.net/resources
* Monitoring - https://grafana.nautilus.optiputer.net

