---
type: docs
linkTitle: Updates for HPCC Users
title: Updates for HPCC Users
Summary: information on changes to the HPCC.
---

## User-facing Changes Implemented on 23-Aug-2019 

### Domain Names
The old domain names `biocluster.ucr.edu` and `bioinfo.ucr.edu` have finally been discontinued. As a result, users need to use the new `hpcc.ucr.edu` 
name for the following services:
+ _ssh/scp/ftp/http_: `cluster.hpcc.ucr.edu` instead of `biocluster.ucr.edu` 
+ _RStudio Server_: `rstudio.hpcc.ucr.edu` instead of `rstudio.bioinfo.ucr.edu` 
+ _Jupyter_: `jupyter.hpcc.ucr.edu` instead of `jupyter.bioinfo.ucr.edu`
+ _Email Support_: `support@hpcc.ucr.edu` instead of `support@biocluster.ucr.edu`

In addition, URLs containing `biocluster.ucr.edu` need to be updated to `cluster.hpcc.ucr.edu`.

### Password Reset
After the upgrade on Aug 23, 2019, all HPCC users have been emailed a temporary
password with instructions how to change it. This email was sent to the address
we have on file for each user. In case you missed the corresponding email
notification and/or you are not able to log into the cluster, please email us
at [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu) to receive a new password.

### Updated OpenMPI
If you have compiled or use software that was compiled with OpenMPI, then it will need to be recompiled.
If you are running into any issues, please email us at [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu).

