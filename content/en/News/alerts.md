---
title: User alerts for HPCC's computing resources
linkTitle: Alerts
type: docs
weight: 2
aliases:
    - /alerts.html
    - /alerts
---


## Unannounced exceptions

<!-- 
None currently observed.
-->
### 10-Apr-2023: Bigdata back

* 5:30 PM - Bigdata is back. Please be patience.

### 10-Apr-2023: Bigdata down

* 4:30 PM - Bigdata is currently down. Please be patient...

### 22-Dec-2022: Network outage

* 9:00 AM - Due to a network outage the cluster was inaccessible for several hours.

### 1-Nov-2022: Network router repair

* 9:00 PM - ITS had to repair a router in the Genomics Building. Around 4:00 AM 
  in the morning (Nov 2nd) network access to the Genomics Building became available 
  again. During the affected time window the cluster was not accessible (_e.g._ via ssh). 
  Processes running on the cluster were not affected.

### 25-Jun-2021: Bigdata storage repaired

* 5:00 PM - Server running our bigdata storage have been recovered, and all functions of bigdata directory is now back to normal.

### 25-Jun-2021: Bigdata storage failed

* 3:30 PM - Server running our bigdata storage crashed, and bigdata directory went down with it.

### 12-Jan-2020: AC unit repaired

* 5:00 PM - AC repairs have been completed. The reservation has been removed, and new Slurm jobs are now no longer suspended.

### 11-Jan-2020: AC unit failed

* 3:00 PM - One of our AC units is under emergency repairs. A Slurm reservation was put in place to suspend new jobs from running.

## Scheduled exceptions and downtimes
None currently scheduled.

## HPCC Operation During COVID-19 Crisis

Since the research computing infrastructure of the HPCC is designed to be
accessed remotely, we are currently not expecting any major downtimes or
restrictions for users due to the campus access restrictions caused by the
COVID-19 pandemic. However, even this may change depending on the extent of the
restrictions our university may have to implement. A few exceptions that are
currently in effect for the HPCC facility are the following: 

  + Our offices in 1208/1207 Genomics Building are closed. The HPCC staff will continue to work as usual but exclusively via remote access from home. 
  + All in person contacts such as office visits or in-person training events are not possible during the current COVID-19 crisis. Alternatively, we will be offering remote training sessions via video conferencing using Zoom. 

If users need to get in contact with us then please email your questions to [support@hpcc.ucr.edu](mailto:support@hpcc.ucr.edu). For immediate help, users can also post questions on Slack ([ucr-hpcc.slack.com](https://ucr-hpcc.slack.com)). For latest news and updates, please also visit us on [Twitter](https://twitter.com/UCR_HPCC). With some delay, updates will also be posted on this website's [News](/news/announce) and [Alerts](/news/alerts) pages.

## Standard Operating Procedures

### SOP for unscheduled outages

When unforeseen issues arise they are categorized by severity:

0. Green - Normal operation, no current issues
1. Yellow - Minor issue[s], likely not observed by users (ie. jobs are not affected)
2. Orange - Medium issue[s], likely observed by users but not fatal (ie. jobs may perform slower than usual)
3. Red - Critical issue[s], major service or entire cluster is not functioning as expected (ie. jobs have terminated prematurely)

Email notifications are only sent to users if there is a Red critical issue.

### SOP for scheduled shutdowns

The following outlines the timeline for advance email notifications on scheduled shutdowns of the HPCC cluster and other exceptions:

1. Four weeks advance notice
2. Followed by weekly reminders
3. Final reminder the day before the outage

## Twitter feed

For additional news and information, please consult the [HPCC Twitter
site](https://twitter.com/UCR_HPCC). Also see the Tweets window at the bottom
of this and other pages of the HPCC website. 

## Team collaborations with Slack

Sign up and use Slack Team Collaboration app here: [ucr-hpcc.slack](https://ucr-hpcc.slack.com)

## Past exceptions

__28-Oct-2020: Cluster jobs failed due to storage suspension__

* 3:00 PM - During a routine extension of the bigdata filesystem, there were some complications and disk i/o had to be suspended.
* 5:30 PM - We have repaired the issue, and everything should be functioning as usual. However, this means that all computing jobs running during timeframe were stopped and will need to be restarted.

__19-Aug-2020: Cluster inaccessible due to power outage in Genomics Bdg__

* 11:30 PM - All systems were restored by Jordan Hayes and are opterational again. 
* 10:30 PM - HPC systems admin Jordan Hayes is trying to restart the network, storage and cluster again.
* 10:00 PM - Facilities was able to bring up the power and cooling again.
* 8:30 PM - Facilities is investigating and trying to reactivate power and cooling.

__10-Aug-2020: Cluster inaccessible due to power outage in Genomics Bdg__

At 5:10 PM: Facilities has restored power and cooling systems in the server room. HPC systems admin Jordan Hayes is restarting the cluster and storage systems.
At 10:10 PM:  All HPCC services were restored (computing cluster, storage systems, web services).

__22-Mar-2020: Cluster inaccessible due to campus-wide network outage__

Due to a campus-wide network outage at UCR, many HPCC services were not accessible between 8:00 AM and 1:00 PM. 
Currently, most HPCC services are accessible again. Note, running jobs on the cluster should not have been affected by this disruption.
Updates about the current situations can be found [here](https://techalerts.ucr.edu/). 

__13-Mar-2020: Routine maintenance shutdown__

We have scheduled an HPCC Cluster Maintenance Shutdown for Friday, March 13th.
This will require a shutdown of ALL services: Slurm (queuing system), hosted websites, 
virtual environments/machines, storage systems, backup systems, and network services.
We ask that you please make sure that you do not have any jobs running in the queue, 
and that you completely logout of the cluster (pigeon, pelican, parrot) before the shutdown.

__08-Jan-2020: Storage outage__

We had some issues with our storage systems this evening that may have caused
disruptions in your work. These issues should be resolved. We're continuing to
monitor the situation to ensure everything is operational, and we apologize for
any inconveniences this may have caused. Please let us know at
support@hpcc.ucr.edu if you require any assistance regarding job status and
recovery.

__21-Nov-2019: Routine filesystem maintenance and diagnostics__

We have scheduled an HPCC Cluster Maintenance Shutdown for this Thursday, November 21st.
This will require a shutdown of ALL services: Slurm (queuing system), hosted websites, virtual environments/machines, storage systems, backup systems, and network services.
We ask that you please make sure that you do not have any jobs running in the queue, and that you completely logout of the cluster (pigeon, pelican, parrot) before the shutdown.

__23-Aug-2019: Routine maintenance shutdown__

We have scheduled an HPCC Cluster Maintenance Shutdown for Friday, Aug 23, 2019.
This will require a shutdown of ALL services: Slurm (queuing system), hosted
websites, virtual environments/machines, storage systems, backup systems, and
network services. We ask that you please make sure that you do not have any
jobs running in the queue, and that you completely logout of the cluster
(pigeon, pelican, globus) before the shutdown. Status: completed.
For user changes related to this maintenance please see [here](/changes).

__01-Mar-2019: Routine Maintenance Shutdown__

We have scheduled an HPCC Cluster Maintenance Shutdown for Friday, March 1st.
This will require a shutdown of ALL services: Slurm (queuing system), hosted
websites, virtual environments/machines, storage systems, backup systems, and
network services. We ask that you please make sure that you do not have any
jobs running in the queue, and that you completely logout of the cluster
(pigeon, pelican, globus) before the shutdown. Status: successfully completed.

__1:00 PM, 20-Dec-18: Outage due to AC failure__

All systems were down for 3 hours due to a failure of the AC units in our server
room. Electricians and AC technicians have repaired the units.

__2:30 PM, 11-Jul-18: Storage Issues__

For the past several weeks we have been observing slower storage access.
In some cases the /bigdata storage was inaccessible for several minutes and caused some jobs to terminate prematurely.
We have identified the issue and have taken steps to ensure that this problem does not reoccur.

__6:00 PM, 02-Jul-18: Storage Issues__

Storage issues on the afternoon of July 2, 2018 caused disruptions in some cluster services. The issues should be resolved, but we're continuing to monitor the situation for any other developments.

__12:00 AM, 31-Jan-18: routine maintenance shutdown__

For routine maintenance and upgrades we have scheduled an HPCC (Biocluster)
shutdown for 12:00AM, Jan-31-2018 to 12:00AM, Feb-01-2018. (complete) 

__12:00 AM, 05-Dec-17: NFS & SMB issues__

NFS and SMB services have been suspended temporarily.
This will cause many of our web services to not function properly.
These include, but not limited to:
  * https://rstudio.bioinfo.ucr.edu & https://rstudio2.bioinfo.ucr.edu
  * https://galaxy.bioinfo.ucr.edu
  * https://dashboard.bioinfo.ucr.edu
  * https://biocluster.ucr.edu/~username (.html directories)
  * mysql://bioclusterdb.int.bioinfo.ucr.edu (databases)

Note, this issue was resolved soon after it occurred. 

__11:00 AM, 13-Aug-17: Cooling problem__

Since Sat morning one of the HVAC units is not working properly. To avoid overheating, 
we have shut down most of the idle nodes (1:30PM, Sun). As soon as the HVAC unit 
is repaired we will power these nodes back on. Note, this issue was resolved on 17-Aug-17.
UCR facility services has repaired the broken HVAC unit and serviced the second one. 

__12:00 AM, 16-Jun-17 to 17-Jun-17: maintenance shutdown__

To sustain future growth, the power load in the HPCC server room needs to be
optimized. For this we have scheduled an HPCC (Biocluster) shutdown in four
weeks from now which will start at noon on June 16th and last until noon June 17th. This
will require a shutdown of ALL services: Slurm (queuing system), hosted
websites, virtual environments/machines, storage access, backup systems and
network services. We ask that you please make sure that you do not have any
jobs running in the queue, and that you completely logout of the cluster
(pigeon, owl, penguin, pelican, globus) before the shutdown. 

__10:02 AM, 13-Apr-17: UPS failure__

Our UPS unit went down some time last night causing a power failure on all systems. Jordan is bypassing the UPS to bring things back up in the next
few hours. Nationwide Power will come in asap to repair the UPS. Note, this failure has not resulted in any overheating problems since the AC units
are running on a different power cricuit.

__11:22 AM, 13-Apr-17: Cluster back up running__

Situation is resolved for now and things are working. We are currently discussing the situation with our electricians to avoid future instances.

