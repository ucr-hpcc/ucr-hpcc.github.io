## pre {

##   max-height: 300px;

##   overflow-y: auto;

## }

## 
## pre[class] {

##   max-height: 100px;

## }


## .scroll-100 {

##   max-height: 100px;

##   overflow-y: auto;

##   background-color: inherit;

## }


## Rscript -e "rmarkdown::render('ioslide_template.Rmd'); knitr::knit('ioslide_template.Rmd', tangle=TRUE)"


## ----eval=FALSE---------------------------------------------------------------
## z <- "dajfdfkfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
## z
## z
## z
## z
## z
## z
## z
## z
## z


## ----eval=TRUE, rows.print=75-------------------------------------------------
x <- cbind(iris, iris[,5:1])
x


## sinfo


## sbatch script_name.sh


## #!/bin/bash -l

## 
## #SBATCH --nodes=1

## #SBATCH --ntasks=1

## #SBATCH --cpus-per-task=1

## #SBATCH --mem-per-cpu=1G

## #SBATCH --time=1-00:15:00 # 1 day and 15 minutes

## #SBATCH --mail-user=useremail@address.com

## #SBATCH --mail-type=ALL

## #SBATCH --job-name="some_test"

## #SBATCH -p batch # Choose queue/parition from: intel, batch, highmem, gpu, short

## 
## myscript.sh


## srun --x11 --partition=short --mem=2gb --cpus-per-task 4 --ntasks 1 --time 1:00:00 --pty bash -l


## ----eval=TRUE----------------------------------------------------------------
library(DT)
datatable(iris)


## ----plyr_chaining1, eval=TRUE, message=FALSE, warning=FALSE------------------
library(dplyr); library(ggplot2); library(reshape2)
iris %>% 
    group_by(Species) %>% 
    summarize_all(mean) %>% 
    reshape2::melt(id.vars=c("Species"), variable.name = "Samples", value.name="Values") %>%
    ggplot(aes(Samples, Values, fill = Species)) + 
    geom_bar(position="dodge", stat="identity")

