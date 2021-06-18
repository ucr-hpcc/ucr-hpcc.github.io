---
layout: page
title: Security
permalink: manuals_linux-cluster_security.html
---

## Protection Levels and Classification
UCR protection levels, and data classifications are outlined by UCOP as a UC wide policy: [UCOP Institutional Information and IT Resource Classification](https://security.ucop.edu/policies/institutional-information-and-it-resource-classification.html)
According to the above documentation, there are 4 levels of protection for 4 classifications of data:

| Protection Level | Policy | Examples                                                                                                                               |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| P1 - Minimal     | IS-1   | Internet facing websites, press releases, anything intended for public use                                                             |
| P2 - Low         | IS-2   | Unpublished research work, intellectual property NOT classified as P3 or P4                                                            |
| P3 - Moderate    | IS-3   | Research information classified by an Institutional Review Board as P3 (ie. dbGaP from NIH)                                            |
| P4 - High        | IS-4   | Protected Health Information (PHI/HIPAA), patient records, sensitive identifiable human subject research data, Social Security Numbers |

The HPC cluster could be compliant with with other security polices (ie. NIH), however the policy must be reviewed by our security team.

At this time the HPC cluster is not a IS-4 (P4) compliant cluster. If you have needs for very sensitive data, it may be best to work with UCSD and their [Sherlock service](https://sherlock.sdsc.edu/).
Our cluster is IS-3 compliant, however there are several responsibilities that users will need to adhere to.

## General Guidelines
<span style="color:red">First, please contact us (support@hpcc.ucr.edu) before transferring any data to the cluster.
After we have reviewed your needs, data classification and appropriate protection level, then it may be possible to proceed to use the HPCC.</span>

Here are a few basic rules to keep in mind:

* Always be aware of access control methods (Unix permissions and ACLs), do not allow others to view the data (ie. chmod 400 filename)
* Do not make unnecessary copies of the data
* Do not transfer the data to insecure locations
* Encrypt data when/where possible
* Delete all data when it is no longer needed

## Access Controls
When sharing files with others, it is imperative that proper permission are used.
However, basic Unix permissions (user,group,other) may not be adequate.
It is better to use ACLs in order to allow fine grained access to sensitive files.

### GPFS ACLs
GPFS is used for most of our filesystems (/rhome and /bigdata) and it uses nfsv4 style ACLs.
Users are able to explicitly allow many individuals, or groups, access to specific files or directories.

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

For more information regarding GPFS ACLs refer to the following: [GPFS ACLs](https://www.ibm.com/support/knowledgecenter/en/STXKQY_4.2.3/com.ibm.spectrum.scale.v4r23.doc/bl1adm_nfsv4syn.htm)

### XFS ACLs
The XFS filesystem is used for the CentOS operating system and typical unix locations (/,/var,/tmp,etc), as well as /secure.
For more information on how to use ACLs under XFS, please refer to the following: [CentOS 7 XFS](https://vishmule.com/2015/06/11/access-control-list-acl-permissions-in-rhel7centos7/)

> Note: ACLs are not applicable to gocryptfs, which is a FUSE filesystem, not GPFS nor XFS.

## Encryption
Under the IS-3 policy, P3 data encryption is mandatory.
It is best if you get into the habit of doing encryption in transit, as well as encryption at rest.
This means, when you move the data (transit) or when the data is not in use (rest), it should be encrypted.

### In Transit
When transferring files make sure that files are encrypted in flight with one of the following transfer protocols:

* SCP
* SFTP
* RSYNC (via SSH)

The destination for sensitive data on the cluster must also be encrypted at rest under one of the follow secure locations:

* /dev/shm/ - This location is in RAM, so it does not exist at rest (ensure proper ACLs)
* /secure - This location is encrypted at rest with AES 256 key length (ensure proper ACLs)
* /run/user/$EUID/unencrypted - This location is manually managed, and should be created for access to unencrypted files.


It is also possible to encrypt your files with GPG ([GPG Example](https://kb.iu.edu/d/awio)), before they are transferred.
Thus, during transfer they will be GPG encrypted. However, decryption must occur in one of the secure locations mentioned above.

> Note: Never store passphrases/passwords/masterkeys in an unsecure location (ie. a plain text script under /rhome).

### At Rest
There are 3 methods available on the cluster for encryption at rest:
  1. GPG encryption of files via the command line [GPG Example](https://kb.iu.edu/d/awio), however you must ensure proper ACLs and decryption must occur in a secure location.
  2. The location "/secure" is encrypted and is mounted on the head nodes, however you must ensure proper ACLs.
  3. Create your own location with [gocryptfs](https://nuetzlich.net/gocryptfs/forward_mode_crypto/).

#### GocryptfsMgr

You can use `gocryptfs` directly or use the `gocryptfsmgr`, which automates a few steps in order to simplify things.

Here are the basics when using `gocryptfsmgr`:

```bash
# Create new encrypted data directory
gocryptfsmgr create bigdata privatedata1

# List all encrypted and unencrypted (access point) directories
gocryptfsmgr list

# Unencrypted privatedata1 (create access point)
gocryptfsmgr open bigdata privatedata1 rw

# Transfer files (ie. SCP,SFTP,RSYNC)
scp user@remote-server:sensitive_file.txt $UNENCRYPTED/privatedata1/sensitive_file.txt

# Remove access point (re-encrypt) privatedata1
gocryptfsmgr close privatedata1

# Remove all access points (re-encrypt all)
gocryptfsmgr quit
```

For subsequent access to the encrypted space, (ie. computation or analysis) the follow procedure is recommended:

```bash
# Request a 2hr interactive job on an exclusive node, resources can be adjusted as needed
srun -p short --exclusive=user --pty bash -l

# Unencrypted privatedata1 in read-only mode (create access point)
gocryptfsmgr open bigdata privatedata1 ro

# Read file contents from privatedata1 (simulating work or analysis)
cat $UNENCRYPTED/privatedata1/sensitive_file.txt

# List all encrypted and unencrypted (access points) directories
gocryptfsmgr list

# Make sure we re-encrypt (close access point) for privatedata1
gocryptfsmgr close privatedata1

# Exit from interactive job
exit
```

With the above methods you can create multiple encrypted directories and access points and move between them.

#### Gocryptfs

When using the `gocryptfs` directly, you will need to know a bit more details on how it works.
The `gocryptfs` module on the HPCC cluster uses these predefined variables:
  1. `HOME_ENCRYPTED` = `/rhome/$USER/encrypted` - Very small encrypted space, not recommended to use
  2. `BIGDATA_ENCRYPTED` = `/rhome/$USER/bigdata/encrypted` - Best encrypted space for private data sets
  3. `SHARED_ENCRYPTED` = `/rhome/$USER/shared/encrypted` - Encrypted space when intending to share data sets with group
  4. `UNENCRYPTED` = `/run/user/$UID/unencrypted` - Access directory where encrypted data will be viewed as unencrypted

Here is an example how to create an encrypted directory under the `BIGDATA_ENCRYPTED` location using `gocryptfs`:

```bash
# Load gocyptfs software
module load gocryptfs

# Create empty data directory
mkdir -p $BIGDATA_ENCRYPTED/privatedata1

# Then intialize empty directory and encrypt it
gocryptfs -aessiv -init $BIGDATA_ENCRYPTED/privatedata1

# Create access point directory where encrypted files will be viewed as unencrypted
mkdir -p $UNENCRYPTED/privatedata1

# After that mount the encrypted directory on the access point and open a new shell within it
gocryptfssh $BIGDATA_ENCRYPTED/privatedata1

# Transfer files (ie. SCP,SFTP,RSYNC)
scp user@remote-server:sensitive_file.txt $UNENCRYPTED/sensitive_file.txt

# Exiting this shell will automatically unmount the unencrypted directory
exit
```

For subsequent access to the encrypted space, (ie. computation or analysis) the follow procedure is recommended:

```bash
# Request a 2hr interactive job on an exclusive node, resources can be adjusted as needed
srun -p short --exclusive=user --pty bash -l

# Load cyptfs software
module load gocryptfs

# Create unencrypted directory
mkdir -p $UNENCRYPTED/privatedata1

# Mount encrypted filesystem as read-only and unmount idling for 1 hour
gocryptfs -ro -i 1h -sharedstorage $BIGDATA_ENCRYPTED/privatedata1 $UNENCRYPTED/privatedata1

# Read file contents (simulating work or analysis)
cat $UNENCRYPTED/privatedata1/sensitive_file.txt

# Manually close access point when analysis has completed
fusermount -u $UNENCRYPTED/privatedata1

# Delete old empty access point
rmdir $UNENCRYPTED/privatedata1
```

> WARNING: Avoid writing to the same file at the same time from different nodes. The encrypted file system cannot handle simultaneous writes and will corrupt the file. If simultaneous jobs are necessary then using write mode from a head node and read-only mode from compute nodes may be the best solution here.
 Also, be mindful of reamaining job time and make sure that you have unmounted the unencrypted directories before your job ends.

For another example on how to use gocrypfs on an HPC cluster: [Luxembourg HPC gocryptfs Example](https://hpc.uni.lu/blog/2018/sensitive-data-encryption-using-gocryptfs/)

## Deletion
To ensure the complete removal of data, it is best to `shred` files instead of removing them with `rm`. The `shred` program will overwrite the contents of a file with randomized data such that recovery of this file will be very difficult, if not impossible.

Instead of using the common `rm` command to delete something, please use the `shred` command, like so:
```
shred -u somefile
```
The above command will overwrite the file with random data, and then remove (unlink) it.

If we want to be even more secure, we can pass over the file seven times to ensure that reconstruction is nearly impossible, then remove it:

```
shred -v -n 6 -z -u somefile
```

