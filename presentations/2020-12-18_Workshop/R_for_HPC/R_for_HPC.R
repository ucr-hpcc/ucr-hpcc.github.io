## pre {

##   max-height: 300px;

##   overflow-y: auto;

## }

## 
## pre[class] {

##   max-height: 300px;

## }


## .scroll-300 {

##   max-height: 300px;

##   overflow-y: auto;

##   background-color: inherit;

## }


## nvim myfile.txt # for neovim (or 'vim myfile.txt' for vim)


## install_nvimRtmux


## tmux # starts a new tmux session

## tmux a # attaches to an existing session


## nvim myscript.R # or *.Rmd file


## srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l


## wget https://raw.githubusercontent.com/ucr-hpcc/ucr-hpcc.github.io/master/presentations/2020-12-18_Workshop/R_for_HPC/demo_files/R_for_HPC_demo.R


## ----nvim-r-tmux-demo_show, eval=FALSE, message=FALSE, warning=FALSE----------
## library(tidyverse)
## write_tsv(iris, "iris.txt") # Creates sample file
## read_tsv("iris.txt") %>% # Import with read_tbv from readr package
##     as_tibble() %>%
##     group_by(Species) %>%
##     summarize_all(mean) %>%
##     reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%
##     ggplot(aes(Samples, Values, fill = Species)) +
##     geom_bar(position="dodge", stat="identity")


## ----nvim-r-tmux-demo_run, echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE----
library(tidyverse)                                                                                                                                                            
write_tsv(iris, "iris.txt") # Creates sample file                                                                                                                             
read_tsv("iris.txt") %>% # Import with read_tbv from readr package                                                                                                            
    as_tibble() %>%                                                                                                                                                           
    group_by(Species) %>%                                                                                                                                                     
    summarize_all(mean) %>%                                                                                                                                                   
    reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%                                                                                  
    ggplot(aes(Samples, Values, fill = Species)) +                                                                                                                            
    geom_bar(position="dodge", stat="identity")


## module avail R


## module load R/4.0.1


## module list


## #!/bin/bash -l

## #SBATCH --nodes=1

## #SBATCH --ntasks=1

## #SBATCH --cpus-per-task=1

## #SBATCH --mem-per-cpu=1G

## #SBATCH --time=1-00:15:00 # 1 day and 15 minutes

## #SBATCH --mail-user=useremail@address.com

## #SBATCH --mail-type=ALL

## #SBATCH --job-name="some_test"

## #SBATCH -p short # Choose queue/partition from: intel, batch, highmem, gpu, short

## 
## Rscript my_script.R


## sbatch script_name.sh


## ----working_env, eval=FALSE--------------------------------------------------
## dir.create("mytestdir")
## setwd("mytestdir")
## download.file("https://bit.ly/3gZJBsy", "slurm.tmpl")
## download.file("https://bit.ly/3nvSNHA", ".batchtools.conf.R")


## ----load_pkgs, eval=FALSE----------------------------------------------------
## library('RenvModule')
## module('load','slurm') # Loads slurm among other modules
## 
## library(batchtools)
## myFct <- function(x) {
##     Sys.sleep(10) # to see job in queue, pause for 10 sec
## 	result <- cbind(iris[x, 1:4,],
##         Node=system("hostname", intern=TRUE),
## 	    Rversion=paste(R.Version()[6:7], collapse="."))
## }


## ----submit_jobs, eval=FALSE--------------------------------------------------
## reg <- makeRegistry(file.dir="myregdir", conf.file=".batchtools.conf.R")
## Njobs <- 1:4 # Define number of jobs (here 4)
## ids <- batchMap(fun=myFct, x=Njobs)
## done <- submitJobs(ids, reg=reg, resources=list(partition="short", walltime=120, ntasks=1, ncpus=1, memory=1024))
## waitForJobs() # Wait until jobs are completed


## ----job_status, eval=FALSE---------------------------------------------------
## getStatus() # Summarize job status
## showLog(Njobs[1])
## # killJobs(Njobs) # # Possible from within R or outside with scancel


## ----assemble_results, eval=FALSE---------------------------------------------
## readRDS("myregdir/results/1.rds") # reads from rds file first result chunk
## loadResult(1)
## lapply(Njobs, loadResult)
## reduceResults(rbind) # Assemble result chunks in single data.frame
## do.call("rbind", lapply(Njobs, loadResult))


## ----clear_delete_registry, eval=FALSE----------------------------------------
## clearRegistry() # Clear registry in R session
## removeRegistry(wait=0, reg=reg) # Delete registry directory
## # unlink("myregdir", recursive=TRUE) # Same as previous line


## ----load_registry, eval=FALSE------------------------------------------------
## from_file <- loadRegistry("myregdir", conf.file=".batchtools.conf.R")
## reduceResults(rbind)

