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

__21-Jun-2024: Network Outage__

Starting 5:15 PM the network connection to the HPCC server room is down. This might be related to a larger network problem on campus, see [here](https://techalerts.ucr.edu/).


<! ––
## Scheduled exceptions and downtimes

None currently observed.

## Unannounced exceptions

None currently observed.

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

-->

## Team collaborations with Slack

Sign up and use Slack Team Collaboration app here: [ucr-hpcc.slack](https://ucr-hpcc.slack.com)

## Past exceptions

__CANCELLED: June 14th Shutdown Ahead of Genomics Electrical Maintenance__

Starting on Friday, June 14th at 8am and extending to Saturday, June 15th at 11pm UCR HPCC will be powering down the cluster ahead of a scheduled electrical shutdown of the UCR Genomics Building. To make the most of this downtime, HPCC will offline the cluster on the 14th in order to install routine software updates and perform other minor maintenance tasks. During the shutdown, most of our online services hosted from the UCR Genomics Building will be unavailable including, but is not limited to: SSH, Slurm, Rstudio, JupyterHub, OnDemand, and web file access. Please save your work on any of these services before the maintenance window. E-mail support may be temporarily interrupted, but should otherwise remain online. We recommend checking our [Slack channel](https://ucr-hpcc.slack.com/) for any minor status updates during the shutdown.

If you submit a Slurm or OnDemand job that extends into the maintenance window, you will receive an error containing "ReqNodeNotAvail". Your job will queue, but will not start, until maintenance is over. If you want your job to start sooner, cancel the job request, and resubmit your job with a shorter --time duration, such that your job will finish before the maintenance window begins.

We apologize for the disruption to your research and teaching workflows. Thanks for your understanding.

__7-May-2024: AC Unit Repairs, Slurm Paused__

After investigating a High Temperature warning on one of our AC units, campus Facilities determined a component in one of the AC units appears to be faulty and needs to be replaced. They are planning on receiving the replacement part the morning of the 8th, but in order to do the replacement both AC units will need to be taken offline. We've began putting nodes into a "draining" state in an attempt to bring the load on the cluster as low as possible to best manage heat in the server room. Existing jobs will continue to run, but newly scheduled jobs will be put in the queue until we can confirm that the repair has been completed and the AC units are online again. We know this is disruptive to your research and teaching, and we apologize for this development.

**Update 1:** Facilities was unable to complete the job in their time allotted for today, and will continue work tomorrow the morning (May 9th).

**Update 2:** While performing the repair, facilities identified a leak which needs to be patched before refilling the refrigerant, otherwise any refrigerant would immediately escape. The ETA for this repair, as given to us by facilities, is May 10th.

**Update 3:** Facilities has contacted us to say that they are finishing up the repairs and that we can begin to start loading the servers again. As such we've released ~50% of the nodes to begin running jobs again.

**Update 4:** Facilities has completed the repairs, and all nodes have been released.

__08-Mar-2024 AC Unit Refrigerant Leak, Queue Paused__

The UCR HPCC Slurm queue has been paused due to another AC malfunction in the server room. Earlier on Thursday (March 7th) afternoon, UCR Facilities was called in to check an AC alarm and determined that one of our AC units had low refrigerant. While attempting to recharge the AC refrigerant a leak occurred, forcing personnel to evacuate the room for their own safety. They intend to start the repair first thing on Friday (March 8th) morning. But because that AC unit is still not running at full capacity, cooling is limited. As such, the Slurm queue has been paused as a precaution to keep the room within a safe temperature. We understand that this will be disruptive to your work, and we apologize for this development.

Update 1: After speaking with the person performing the repair, they said that the repair could take all day. We will make further announcements as we receive updates.

Update 2: The repair has been completed and the Slurm queue has been released.

__22-Feb-2023: Upgrades of OS and GPFS__

Starting Thursday, February 22nd at 8:00am and lasting until Friday, February 23rd at 8:00pm, the cluster will be unavailable due 
to an upgrade of the Operating System as well as our central storage system. Any submitted jobs that overlap with the shutdown time will
be queued with the reason "ReqNodeNotAvail" and will need to be requeued with a shorter time or wait until the maintenance is over
at which point they will automatically start.

During the shutdown services will be unavailable including, but not limited to: SSH, RStudio, JupyterHub, OnDemand, and web-based file access.
If you need additional information or help, you can reach us at our [Slack](https://ucr-hpcc.slack.com/) or outside of the shutdown through
email (support@hpcc.ucr.edu).

**Update**: The shutdown had finished and the Slurm queue has been reopened.

__19-Jan-2024: AC Unit Repair Followup__

Due to followup maintenance required following the January 17th repairs, the
slurm queue will once again need to be haulted in order to manage heat output
in the server room. Maintenance should only take a few hours, after which the
queue will be released again.

**Update**: The repair has been completed. Nodes will be resumed and queue opened.

__17-Jan-2024: AC Unit repair__

The AC units in the HPCC server room are experiencing issues. To keep the
operating temperature within safe limits, the job queue has been halted. New
and pending jobs will stay queued, while currently running jobs will be allowed
to finish. We apologize for the inconvenience.

**Update**: The maintenance has completed, but a followup repair will be required in
order to return to 100% operation of the AC units.

__14 Aug, 2023: Login and GPFS storage issues__

* The login service on the primary headnode failed on Monday afternoon. A new headnode with updated software is now
  online, so users may access their files and do some light work. The GPFS cluster file system also exhibited some
  performance stalls. The Slurm scheduler has been paused until this issue subsides.

__4-Aug-2023: Upgrades of OS, GPFS, Slurm, Head Nodes and Power Distribution__

* HPCC staff will be performing maintenance work on Aug 4th to Aug 5th that will require a shut down of the HPCC cluster. 
  Objectives for this event include the following upgrades: GPFS, Slurm, OS upgrade to Rocky Linux 8.8, 
  electrical reconfiguration of PDUs, and various other maintenance tasks.

* Update Aug 6th: Due to underestimated workload on planned maintenance tasks, services are still offline.
  Basic functionality should be restored by the end of the day.

* Update Aug 7th: Maintenance is still ongoing. Currently, we are redeploying computer nodes and other services. 
  User login is restricted until the central data storage system has been re-mounted.

* Update Aug 8th: SSH login has been restored. Users can access their data and perform light work on the head nodes
  until access to a larger number of compute nodes has been restored. In addition, web-based file sharing and JupyterHub are available again.
  RStudio Server will be restored next. 

- Update Aug 9th: Slurm has been redployed and is operational. A larger number of computer nodes have been redeployed and are available 
  to users again.

- Final update Aug 11th: All remaining services are available again. The maintenance is complete. This includes remaining CPU and GPU nodes, etc. 
  We apologize for the extended time it took us to bring all services online again. Thank you for your understanding.

__17-18 Jul, 2023: Slurm halted__

* Facilities had to perform maintenance on the AC units due to the formation of condensation water by the AC units,
  possibly caused by hot summer days. During the maintenance Slurm jobs had to be halted to avoid overheating.
  Running jobs will be allowed to continue, provided that the server room does not get too hot.

__10-Apr-2023: Bigdata back__

* 5:30 PM - Bigdata is back. Thank for for your patience.

__10-Apr-2023: Bigdata down__

* 4:30 PM - Bigdata is currently down. Please be patient...

__22-Dec-2022: Network outage__

* 9:00 AM - Due to a network outage the cluster was inaccessible for several hours.

__1-Nov-2022: Network router repair__

* 9:00 PM - ITS had to repair a router in the Genomics Building. Around 4:00 AM
  in the morning (Nov 2nd) network access to the Genomics Building became available
  again. During the affected time window the cluster was not accessible (_e.g._ via ssh).
  Processes running on the cluster were not affected.

__25-Jun-2021: Bigdata storage repaired__

* 5:00 PM - Server running our bigdata storage have been recovered, and all functions of bigdata directory is now back to normal.

__25-Jun-2021: Bigdata storage failed__

* 3:30 PM - Server running our bigdata storage crashed, and bigdata directory went down with it.

__12-Jan-2020: AC unit repaired__

* 5:00 PM - AC repairs have been completed. The reservation has been removed, and new Slurm jobs are now no longer suspended.

__11-Jan-2020: AC unit failed__

* 3:00 PM - One of our AC units is under emergency repairs. A Slurm reservation was put in place to suspend new jobs from running.

__5-6 May, 2023: Maintenance and Electrical Power Upgrades in Server Room__

* UCR Facilities Services will be upgrading our electrical capacity in the Genomics server room. To take advantage
of the unavoidable system downtime, the HPCC will perform general maintenance and various upgrades on the cluster. The
shutdown is expected to last 2 days. It has been scheduled during a weekend to minimize disruptions for users.

* Update: since Sat/Sun night, most systems are back online again. If users notice any missing functionality, please
let us know at support@hpcc.ucr.edu, or at our Slack channel (https://ucr-hpcc.slack.com). Thanks you for your
patience and understanding.

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

