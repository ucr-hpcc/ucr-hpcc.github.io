---
title: "Linux basics"
author: Abraham Park
date: December 18, 2020
output: 
  ioslides_presentation:
    keep_md: yes
    widescreen: yes
    df_print: paged
    smaller: true
subtitle: "Permissions and Data Transfers" 
---
<!--
- ioslides manual: 
   https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html

- Compile from command-line
jupyter nbconvert Cluster_Usage.ipynb --to markdown && Rscript -e "rmarkdown::render('Cluster_Usage.md'); knitr::knit('Cluster_Usage.md', tangle=TRUE)"

- Jupyter formats
#jupyter nbextension enable splitcell/splitcell
#jupyter nbconvert HPCC_Intro.ipynb --to slides --reveal-prefix reveal.js
#jupyter nbconvert HPCC_Intro.ipynb --to slides --reveal-prefix "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0"
-->

## Summary

* File Permissions
  * Basic Permissions
  * Managing Permissions
  * Advanced Permissions

* Data Transfers
  * Filezilla
  * scp command
  * rsync command
  
<hr style='clear:both;'>

## File Permissions: Basic Permissions

Every file and directory has permissions:

* User: read/write/execute
* Group: read/write/execute
* Other: read/write/execute

Permissions are given in the following format:

```bash
drwxrwxrwx 1 user group size date filename
```

<hr style='clear:both;'>

## File Permissions: Managing Permissions

Change the permissions of a file:

```bash
chmod u+x file_name
```

```bash
chmod g+w file_name
```

```bash
chmod o-r file_name
```

Change the group association of a file:

```bash
chgrp groupname file_name
```

<hr style='clear:both;'>

## File Permissions: Advanced Permissions

__GPFS ACLs__ 

ACLs provide greater control over file permissions

```bash
# Get current permissions and store in acls file
mmgetacl /path/to/file > ~/acls.txt

# Edit acls file containing permissions
vim ~/acls.txt

# Apply new permissions to file
mmputacl -i ~/acls.txt /path/to/file

# Delete acls file
rm ~/acls.txt
```

[https://hpcc.ucr.edu/manuals/hpc_cluster/security/#gpfs-acls](/manuals/hpc_cluster/security/#gpfs-acls)
<hr style='clear:both;'>

## Data Transfers: Filezilla

<img width='900px' src='images/filezilla_empty.png'/>

<hr style='clear:both;'>

## Data Transfers: Filezilla (cont)

<img width='900px' src='images/filezilla_empty1.png'/>

<hr style='clear:both;'>

## Data Transfers: scp command

Using scp on the command line:

__Transferring file to the cluster__
```bash
scp local_file username@cluster.hpcc.ucr.edu:~/directory_name/local_file
```

__Transferring file from the cluster__
```bash
scp username@cluster.hpcc.ucr.edu:~/directory_name/local_file local_file
```

<hr style='clear:both;'>

## Data Transfers: rsync command

Using rsync on the command line:

__Transferring file to the cluster__
```bash
rsync -av --progress FOLDER_A/ username@cluster.hpcc.ucr.edu:~/FOLDER_A/
```

__Transferring file from the cluster__
```bash
rsync -av --progress username@cluster.hpcc.ucr.edu:~/FOLDER_A/ FOLDER_A/
```
<hr style='clear:both;'>
