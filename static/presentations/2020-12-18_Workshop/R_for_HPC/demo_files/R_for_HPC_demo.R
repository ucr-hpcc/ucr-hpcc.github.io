##########################
## Nvim-R Demo (R code) ##
##########################
## Author: Thomas Girke
## Last update: 17-Dec-2020

## Optional: run in interactive session on node with:
# srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l

## Start Nvim-connected R session with \rf and then send code by pressing space bar
library(tidyverse)                                                                                                                                                            
write_tsv(iris, "iris.txt") # Creates sample file                                                                                                                             
read_tsv("iris.txt") %>% # Import with read_tbv from readr package                                                                                                            
    as_tibble() %>%                                                                                                                                                           
    group_by(Species) %>%                                                                                                                                                     
    summarize_all(mean) %>%                                                                                                                                                   
    reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%                                                                                  
    ggplot(aes(Samples, Values, fill = Species)) +                                                                                                                            
    geom_bar(position="dodge", stat="identity")

R.version.string
sessionInfo()

###########################################
## Module management (command-line code) ##
###########################################

## List R versions
# module avail R

## Load R version
# module load R/4.0.1

## List modules loaded in a session
# module list


##############################
## batchtools demo (R Code) ##
##############################
dir.create("mytestdir")
setwd("mytestdir")
download.file("https://bit.ly/3Oh9dRO", "slurm.tmpl")
download.file("https://bit.ly/3KPBwou", ".batchtools.conf.R")

## Load packages and modules
library('RenvModule')
module('load','slurm') # Loads slurm among other modules

## Define toy function for testing
library(batchtools)
myFct <- function(x) {
	Sys.sleep(10) # to see job in queue, pause for 10 sec
	result <- cbind(iris[x, 1:4,],
	    Node=system("hostname", intern=TRUE),
	    Rversion=paste(R.Version()[6:7], collapse="."))
}

## Submit jobs from R to cluster 
reg <- makeRegistry(file.dir="myregdir", conf.file=".batchtools.conf.R")
Njobs <- 1:4 # Define number of jobs (here 4); values will be assigned to x in myFct()
ids <- batchMap(fun=myFct, x=Njobs)
done <- submitJobs(ids, reg=reg, resources=list(partition="short", walltime=60, ntasks=1, ncpus=1, memory=1024))
waitForJobs() # Wait until jobs are completed


## Summarize job status
getStatus() # Summarize job status
showLog(Njobs[1])
# killJobs(Njobs) # # Possible from within R or outside with scancel


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

