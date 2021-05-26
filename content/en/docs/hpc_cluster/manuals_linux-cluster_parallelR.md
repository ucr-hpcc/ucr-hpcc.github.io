---
layout: page
title: Parallel Evaluations in R 
permalink: manuals_linux-cluster_parallelR.html
---

# Overview
R provides a variety of packages for parallel computations. One of the most
comprehensive parallel computing environments for R is [`batchtools`](https://mllg.github.io/batchtools/articles/batchtools.html) 
(formerly `BatchJobs`). It supports both multi-core and multi-node computations with and
without schedulers. By making use of cluster template files, most schedulers
and queueing systems are also supported (e.g. Torque, Sun Grid Engine, Slurm). 

## R code of this section

To simplify the evaluation of the R code of this page, the corresponding text version 
is available for download from [here](https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/_support_docs/tutorials/batchtools_test.R).

## Parallelization with batchtools 

The following introduces the usage of `batchtools` for a computer cluster using SLURM as scheduler (workload manager).

## Set up working directory for SLURM
First login to your cluster account, open R and execute the following lines. This will
create a test directory (here `mytestdir`), redirect R into this directory and then download
the required files: 

+ [`slurm.tmpl`](https://github.com/ucr-hpcc/ucr-hpcc.github.io/blob/master/_support_docs/tutorials/slurm.tmpl)
+ [`.batchtools.conf.R`](https://github.com/ucr-hpcc/ucr-hpcc.github.io/blob/master/_support_docs/tutorials/.batchtools.conf.R)

```r
dir.create("mytestdir")
setwd("mytestdir")
download.file("https://goo.gl/tLMddb", "slurm.tmpl")
download.file("https://goo.gl/5HrYkE", ".batchtools.conf.R")
```

## Load package and define some custom function

This is the test function (here toy example) that will be run on the cluster for demonstration
purposes. It subsets the `iris` data frame by rows, and appends the host name and R version of each
node where the function was executed. The R version to be used on each node can be
specified in the `slurm.tmpl` file (under `module load`).

```r
library('RenvModule')
module('load','slurm') # Loads slurm among other modules

library(batchtools)
myFct <- function(x) {
	result <- cbind(iris[x, 1:4,],
	Node=system("hostname", intern=TRUE),
	Rversion=paste(R.Version()[6:7], collapse="."))
}
```

## Submit jobs from R to cluster

The following creates a `batchtools` registry, defines the number of jobs and resource requests, and then submits the jobs to the cluster
via SLURM.

```r
reg <- makeRegistry(file.dir="myregdir", conf.file=".batchtools.conf.R")
Njobs <- 1:4 # Define number of jobs (here 4)
ids <- batchMap(fun=myFct, x=Njobs) 
done <- submitJobs(ids, reg=reg, resources=list(partition="short", walltime=60, ntasks=1, ncpus=1, memory=1024))
waitForJobs() # Wait until jobs are completed
```

## Summarize job status 
After the jobs are completed one instect their status as follows.

```r
getStatus() # Summarize job status
showLog(Njobs[1])
# killJobs(Njobs) # # Possible from within R or outside with scancel
```

## Access/assemble results

The results are stored as `.rds` files in the registry directory (here `myregdir`). One
can access them manually via `readRDS` or use various convenience utilities provided
by the `batchtools` package.

```r
readRDS("myregdir/results/1.rds") # reads from rds file first result chunk
loadResult(1) 
lapply(Njobs, loadResult)
reduceResults(rbind) # Assemble result chunks in single data.frame
do.call("rbind", lapply(Njobs, loadResult))
```

## Remove registry directory from file system

By default existing registries will not be overwritten. If required one can exlicitly
clean and delete them with the following functions. 

```r
clearRegistry() # Clear registry in R session
removeRegistry(wait=0, reg=reg) # Delete registry directory
# unlink("myregdir", recursive=TRUE) # Same as previous line
```

## Load registry into R 

Loading a registry can be useful when accessing the results at a later state or 
after moving them to a local system. 

```r
from_file <- loadRegistry("myregdir", conf.file=".batchtools.conf.R")
reduceResults(rbind)
```


