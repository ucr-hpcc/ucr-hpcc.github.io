---
title: Cluster Operation
linkTitle: Cluster Operation
type: docs
weight: 5
aliases:
    - /manuals_hpcc-aws-cluster_operation.html
    - /manuals_hpcc-aws-cluster_operation
---

## Login to HPCC

```bash
ssh username@cluster.hpcc.ucr.edu
```

## Create a Cluster

```bash
hpcc_cloud create <NameForYourCluster>
```

## Show status of a Cluster

```bash
hpcc_cloud status <NameForYourCluster>
```

Output:

```bash
Status: cfncluster-new-cluster - CREATE_COMPLETE                                
Output:"MasterPublicIP"="52.52.227.148"
Output:"MasterPrivateIP"="172.31.24.51"
Output:"GangliaPublicURL"="http://52.52.227.148/ganglia/"
Output:"GangliaPrivateURL"="http://172.31.24.51/ganglia/"
```

Note the "MasterPublicIP" Address from the output.
Use this IP Address when connecting to the cluster via "ssh" or uploading and downloading via "scp".

## Show running Clusters

```bash
hcpp_cloud list
```

## Delete cluster

```bash
hpcc_cloud delete <NameForYourCluster>
```

## Connecting to your cluster

Note - /path/to/your/key-file.pem = where you saved your AWS account key file

MasterPublicIP = Master Public IP address from the cluster status

```bash
ssh -i /path/to/your/key-file.pem centos@<MasterPublicIP>
```

## Uploading data to your cluster

This will transfer the local files to your home directory on the cluster.

```bash
scp -i /path/to/your/key-file.pem <local-files-to-copy> centos@<MasterPublicIP>:.
```

## Downloading data/results

This would be called from the HPCC cluster and it will download the specified remote files to your current directory.

```bash
scp -i /path/to/your/key-file.pem centos@<MasterPublicIP>:./<files-to-download> .
```

## Running a job on your cluster

This will show all the steps needed to create a cluster and run a simple batch job

### 1. Start a new cluster

```bash
hpcc_cloud create new-cluster
```

### 2. Get the IP address of the new cluster

Once the cluster build is complete you will be presented with the status informatiom.
Note the "MasterPublicIP" Address from the output.
Use this IP Address when connecting to the cluster via "ssh" or uploading and downloading via "scp".

Output:

```bash
hpcc_cloud create new-cluster
Beginning cluster creation for cluster: new-cluster
Creating stack named: cfncluster-new-cluster
Status: cfncluster-new-cluster - CREATE_COMPLETE                                
Output:"MasterPublicIP"="52.52.227.148"
Output:"MasterPrivateIP"="172.31.24.51"
Output:"GangliaPublicURL"="http://52.52.227.148/ganglia/"
Output:"GangliaPrivateURL"="http://172.31.24.51/ganglia/"
```
Find the "MasterPublicIP"

### 3. Upload your input files and slurm submission script

This will transfer the local files to your home directory on the cluster.

```bash
scp -i /path/to/your/key-file.pem <local-files-to-copy> centos@<MasterPublicIP>:.
```

### 4. SSH to your new cluster

```bash
ssh -i /path/to/your/key-file.pem centos@<MasterPublicIP>
```

### 5. Submit your job to the cluster

```bash
sbatch slurm-submission-script.sh
```

### 6. Monitor your job

```bash
squeue
```

### 7. Download results

This command would be called from the HPCC cluster and it will download the specified remote files to your current directory.

```bash
scp -i /path/to/your/key-file.pem centos@<MasterPublicIP>:./<results-to-download> .
```

### 8. Delete cluster

```bash
hpcc_cloud delete new-cluster 
```

## Start sample cluster walk through (sped up)

<script id="asciicast-lKXf3g9tVdJZiJVqoaDMVIvMY" src="https://asciinema.org/a/lKXf3g9tVdJZiJVqoaDMVIvMY.js" async data-autoplay="false" data-size="small" data-speed="5"></script>
