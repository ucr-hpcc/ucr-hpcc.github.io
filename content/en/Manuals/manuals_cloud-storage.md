---
type: docs
title: Cloud Storage
linkTitle: Cloud Storage
permalink: manuals_cloud-storage.html
---

# Google Drive
We use [Grive](https://github.com/vitalif/grive2) as a sync'ing tool to and from Google drive accounts.

## Install
This software is already installed as a module, and you can load it like so:

```bash
module load grive
```

However, you can download and compile this yourself, if you wish:

```bash
git clone https://github.com/vitalif/grive2.git
cd grive2
mkdir build
cd build
module load cmake
cmake ../
make -j4
```

## Auth
There are a series of steps in order to grant grive access to your own Google Drive API.

1 - Go to https://console.developers.google.com/apis/library. Login with your Google account and create a new project on Google Cloud Platform. You can also use an existing one.
2 - Search for Google Drive API and enable it.
3 - Create Project. Give it a name.
4 - Create consent screen.
4 - Go to API Credentials page (https://console.developers.google.com/apis/credentials)
5 - Create a new OAuth Client credential. You will be provided with a id and a secret. Save both because you will need it for grive2.

Then run the following from within a directory you wish to sync:

```bash
mkdir google_drive
cd google_drive
grive -a --id [client id] --secret [client secret]
```

# AWS S3
First you will need to configure an AWS account and setup your credentials with cfncluster config.
You will also need to create an S3 bucket.

Then you should be able to use the cfncluster module, which contains `aws` sync tool, like so:

```
# Unload all version of Python
module unload python miniconda2 miniconda3 anaconda2 anaconda3

# Load software
module load cfncluster

# S3 Bucket Name
S3Name=MyS3BucketName

# Transfer to S3 bucket
aws s3 sync my_folder s3://${S3NAME}/my_folder
```
