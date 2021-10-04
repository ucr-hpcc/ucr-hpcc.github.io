#################################################
## Test code for batchtools with SLURM cluster ##
#################################################
## Author: Thomas Girke
## Date: 15-Jun-20

## Set up working directory for SLURM
dir.create("mytestdir")
setwd("mytestdir")
download.file("https://goo.gl/tLMddb", "slurm.tmpl")
download.file("https://goo.gl/5HrYkE", ".batchtools.conf.R")

## Load package and define some custom function
library('RenvModule')
module('load','slurm') # Loads slurm among other modules

library(batchtools)
myFct <- function(x) {
	result <- cbind(iris[x, 1:4,], 
			Node=system("hostname", intern=TRUE), 
			Rversion=paste(R.Version()[6:7], collapse="."))
	return(result)
}

## Submit jobs from R to cluster
reg <- makeRegistry(file.dir="myregdir", conf.file=".batchtools.conf.R")
Njobs <- 1:4 # Define number of jobs (here 4)
ids <- batchMap(fun=myFct, x=Njobs) 
done <- submitJobs(ids, reg=reg, resources=list(partition="short", walltime=60, ntasks=1, ncpus=1, memory=1024))
waitForJobs() # Wait until jobs are completed

## Summarize job status 
getStatus() # Summarize job status
showLog(Njobs[1])
# killJobs(Njobs) # Possible from within or outside of R

## Access/assemble results
readRDS("myregdir/results/1.rds") # reads from rds file first result chunk
loadResult(1) 
lapply(Njobs, loadResult)
reduceResults(rbind) # Assemble result chunks in single data.frame
do.call("rbind", lapply(Njobs, loadResult))

## Remove registry directory from file system
clearRegistry() # Clear registry in R session
removeRegistry(wait=0, reg=reg) # Delete registry directory
# unlink("myregdir", recursive=TRUE) # Same as previous line

## Load registry into R 
from_file <- loadRegistry("myregdir", conf.file=".batchtools.conf.R")
reduceResults(rbind)


