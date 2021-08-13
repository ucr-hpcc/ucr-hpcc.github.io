---
title: HPCC cfnCluster Setup 
linkTitle: HPCC cfnCluster Setup 
type: docs
weight: 4
aliases:
    - /manuals_hpcc-aws-cluster_setup.html
    - /manuals_hpcc-aws-cluster_setup
---

## HPCC cfnCluster Setup.
This will show how to use your HPCC account to configure cfnCluster; allowing you to create and control your own clusters.

## 1. Login to the HPCC Cluster

```bash
ssh -X username@cluster.hpcc.ucr.edu
```

### From Windows
Please refer to the login instructions of our [Linux Basics manual](/manuals/linux_basics/intro/#windows).


## 2. Run hpcc_cloud configure

```bash
hpcc_cloud configure
```

* Cluster Template
  * Just hit enter to choose the default template
* AWS Access Key ID
  * YOUR-aws_access_key_id (found in your credentials file)
* AWS Secret Access Key ID 
  * YOUR-aws_secret_access_key (found in your credentials file)
* AWS Region ID
  * us-west-1
* VPC Name
  * Just hit enter to choose the default public
* Key Name
  * Choose your Key Name from the list
* VPC ID
  * Choose any of the available options
* Master Subnet ID
  * Choose any of the available options
* IAM User Name 
  * Choose your IAM User Name from the list


## 3. Setup complete

Now that your config file is setup correctly. You can begin to create and interact with your own cluster (described in the Cluster Control and Operation section [Link](/manuals/hpcc_cloud/aws/operation/))

## Setup Walk Through

<script id="asciicast-ewZjGbJkX0ZpE2sla5BoZ9aRq" src="https://asciinema.org/a/ewZjGbJkX0ZpE2sla5BoZ9aRq.js" async data-autoplay="false" data-size="small" data-speed="3"></script>