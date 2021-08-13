---
title: CyVerse
linkTitle: CyVerse
type: docs
toc_hide: true
---

[CyVersae](https://cyverse.org) is a [NFS](https://nsf.gov/) funded web platorm that has many pre defined apps.
Mainly of the apps are for life sicence and can be very useful.

> NOTE: Not suitable for jobs that require more than 12 CPU cores (ie. MPI).

## Account

Go to [CyVerse](https://cyverse.org/) and click on `Create Account`.

There are a few steps, just fill in the fields accordingly and complete the forms.

After you have completed the form and submitted it, CyVerse will send you an email.
Within the email will contain a link to set your password.


## Data Management

There are a few ways to upload/download data, for example you can browse your files from the [Discovery Environment](https://de.cyverse.org/data).
However here we will focus on the command line method, since that is directly supported on the HPC cluster.
Please refer to [here](https://cyverse-data-store-quickstart.readthedocs-hosted.com/en/latest/) for additoinal methods.

First you will need to load the icommands tools:

```bash
module load icommands/4.1.10
```

Then you will need to initialize the connection to CyVerse:

```bash
iinit
```

When you run the above command it will ask a few questions about your connection:

host name        | port # | username       | zone   | password
---------------- |------- | -------------- | ------ |-----------------
data.cyverse.org | 1247   | CyVerse UserID | iplant | CyVerse Password

Once the `iinit` command has completed you are now able to list, push, get files and folders on CyVerse directlry from the HPCC.

### Upload

The basic format to push files to CyVerse is like so:

```bash
iput FileName CyVersePath
```

For example:

```bash
iput hg18.fasta .
```

Since you automatically start in your home directory from CyVerse, the `.` will just place the fasta file directly within your home.

Once that command completes, you can double check that the the does exist on CyVerse, by listing the files, like so:

```bash
ils
```

The `ils` and `iput` command will work with relative and absolute paths.

### Download

The download method is identical to the upload method, just repalce `iget` instead of `iput`:

```bash
iget hg18.fasta .
```

The above command will download the `hg18.fasta` file to your current directory on the cluster.

## Jobs

Jobs on CyVerse are deployed via apps that you launch through the GUI [here](https://de.cyverse.org/apps).
[Here](https://www.youtube.com/watch?v=ZFKYH_Cm7So) is s video explaining how to create a docker image on the CyVerse system as well as configure a custom app to use it.

Please contact [support](mailto:support@hpcc.ucr.edu) for help creating a custom app, or any other questions.

