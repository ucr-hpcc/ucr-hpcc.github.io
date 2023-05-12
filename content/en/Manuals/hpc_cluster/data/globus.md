---
title: Globus Connect Personal
linkTitle: Globus Connect Personal
type: docs
---

## Overview

Globus is a file sharing and transfer service used by many research facilities worldwide. It aides collaboration by
simplifying the process of securely sharing research data.

File transfers are accomplished by running the Globus client (Globus Connect Personal, GCP) on the HPCC cluster,
and using a web browser on another computer to initiate the transactions.

## Setup

This page explains how to setup the GCP client on the HPCC cluster. For setting up GCP on your personal computer,
please follow the official documentation:

https://docs.globus.org/globus-connect-personal/

### Load the GCP module

HPCC provides a module with the GCP software. Load it with the following command:

```bash
module load globusconnect
```

### Create a new personal HPCC endpoint

In order to create an endpoint on the HPCC cluster, you'll need to log into Globus. Because of UCR's Duo two-factor
authentication system, the login process will need to be done in a web browser. You should use the web browser on
your local device rather than launching a browser on the cluster. (External users: depending on your home institution's
login system, you may be able to log into Globus directly on the cluster. The following steps should still work with a
few modifications).

Start the login process with the following command:

```bash
globusconnect -setup
```

You will be given a long URL to open in your browser, followed by a prompt for an auth code:

```
Globus Connect Personal needs you to log in to continue the setup process.

We will display a login URL. Copy it into any browser and log in to get a
single-use code. Return to this command with the code to continue setup.

Login here:
-----
https://auth.globus.org/v2/oauth2/authorize?client_id=...
-----
Enter the auth code:
```

Copy-paste the URL into your browser. Select the appropriate organization name:

![globus_org](/img/globus_org.png)

Complete the UCR login and Duo process:

![globus_ucr_login](/img/globus_ucr_login.png)

![globus_duo](/img/globus_duo.png)

Review the requested permissions, and the Globus Terms of Service. You'll need to accept them to use the service. Edit
the "label for future reference" if you'd like.

![globus_tos](/img/globus_tos.png)

You'll be given the auth code. Copy-paste the code back into the prompt on the cluster terminal:

![globus_code](/img/globus_code.png)

```
Enter the auth code: SFyA**************************
```

Finally, give the endpoint a name, such as "ucr-hpcc":

```
== starting endpoint setup


Input a value for the Endpoint Name: ucr-hpcc
registered new endpoint, id: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
setup completed successfully
```

At this point, Globus will now recognize your HPCC cluster storage as an endpoint. You may now launch the GCP client
without having to tediously log in.

### Running the GCP client

The GCP client must be running on the endpoint in order to send or receive files there. It is recommended to run the
client in the background (the ampersand at the end creates a background process):

```bash
globusconnect -start &
```

### Locating your new endpoint in the Globus Web App

Login to Globus in your web browser. Open the "File Manager".

Click on "Search" in the "Collection" text box.

![globus_filemgr](/img/globus_filemgr.png)

Click on "Your Collections". Your personal endpoint should be listed here.

![globus_collections](/img/globus_collections.png)

### Stopping the GCP client

When you are done with your Globus session, you should stop the client:

```bash
globusconnect -stop
```
