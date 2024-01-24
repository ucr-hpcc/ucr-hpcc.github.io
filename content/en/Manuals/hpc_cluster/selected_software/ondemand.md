---
linkTitle: "Open OnDemand"
title: "Open OnDemand Usage"
type: docs
weight: 1
---

## What is OnDemand?

OnDemand allows users to access our cluster resources purely through a web browser. No additional client software is required. OnDemand gives users the ability to launch "Interactive Apps" such as Jupyter, RStudio, Matlab, Mathematica, and VSCode and connect to them through your browser.

User's also have the ability to upload/download files to/from the cluster, connect to the cluster via SSH, and create batch job templates.

The sections below go over using OnDemand, as well as a couple pieces of popular software.


## Accessing OnDemand

Our OnDemand instance is located here: [https://ondemand.hpcc.ucr.edu/](https://ondemand.hpcc.ucr.edu/). Log in with your **cluster** login details and verify your login with Duo's two-factor authentication.


## Jupyter on OnDemand

After logging in, select "Jupyter Notebook" from the "Interactive Apps" tab from the menu bar.

![jupytermenu](/img/ondemand_jupyter1.png)

From there, select the resources you need, time you want, partition to run the job on, and click "Launch".

![jupyterparams](/img/ondemand_jupyter2.png)

Your job will then be queued and eventually start running.

![jupyterqueue1](/img/ondemand_jupyter3.png)

![jupyterqueue2](/img/ondemand_jupyter4.png)

Click "Connect to Jupyter" to open a new window containing Jupyter and start working!

## RStudio on OnDemand

The process of launching RStudio is almost identical to that of starting Jupyter, but selecting "RStudio Server" instead of "Jupyter Notebook" from the menu.

![rstudiomenu](/img/ondemand_rstudio1.png)

Please see the Jupyter section for selecting resources and opening the RStudio window.


## Desktop Session on OnDemand

A Desktop session is a Virtual Desktop that is running on the cluster. It will allow you to run programs that require GUIs without going through the steps of forwarding X11 sessions.

![rstudiomenu](/img/ondemand_desktop2.png)

Similar to Jupyter and RStudio, a Desktop Session can be started by selecting "HPCC Desktop" from the menu dropdown.

![rstudiomenu](/img/ondemand_desktop1.png)

Please see the Jupyter section for selecting resources and opening the Desktop Window.

