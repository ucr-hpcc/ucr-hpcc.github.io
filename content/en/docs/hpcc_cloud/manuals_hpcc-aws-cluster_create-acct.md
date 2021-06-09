---
layout: page
title: Account Creation
permalink: manuals_hpcc-aws-cluster_create-acct.html
---

## Introduction
The scope of this manual section is am an introduction on how to get started using the Amazon cloud AWS to quickly create an on-demand cluster private to you.

## Login to your Main/Master AWS account

* Click this <a href="https://console.aws.amazon.com/console/home" target="_blank"> Link </a>

<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-login-1.png" title="Master Account Login" alt="Master Account Login">

* Click Sign In

## Enter your two-factor authentication code 
* Enter Auth code
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-2fauth.png" title="Two Factor Auth" alt="Two Factor Auth">
* Click Sign In

## Identity and Access Managemenet (IAM) 
* Naviagte to the <a href="https://console.aws.amazon.com/iam/home?region=us-west-1#/home" target="_blank"> IAM Page </a>
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-iam-page.png" title="IAM page" alt="IAM page">
* Click on Users

## Add User 
* This is the user managment page
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-users-page.png" title="User Page" alt="User Page">
* Click Add user

## Account creation wizard
* Create a new account for creating clusters
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-add-user-account.png" title="User Account" alt="User Account">
* Fill out the user name and the access type (Programmatic access should be all that's needed for users of a lab).
* Click Next: Permissions.

## Assign Permissions to the new account
* Permissions are assigned to groups and users are organized into those groups.
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-add-user-permissions.png" title="User Permissions" alt="User Permissions">
* If you do not have any existing groups create an admin group
* Choose what group you would like the new user to below too.
* You can create a new group here also.
* Click Next: Review

## Account creation review 
* Review account choices before creation
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-add-user-review.png" title="User Review" alt="User Review">
* Click Create user.

## Account creation complete.
* The account has been created and here are the credentials
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-add-user-complete.png" title="User Complete" alt="User Complete">
* Ensure you click on Download.csv! (this contains the Access key ID and Secret key for this account and is needed later)
* Save this file.
* Click on Close.

## Naviagte to the AWS EC2 Console
* Click this <a href="https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#Home" target="_blank"> Link </a>
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-console.png" title="AWS Console" alt="AWS Console">
* Click Key Pairs

## Key Pair management page
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-key-pair-page.png" title="Key Pair Page" alt="Key Pair Page">

* Click Create Key Pair

## Name new Key Pair
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-key-pair-name.png" title="Key Pair Name" alt="Key Pair Page">

* Give it a name representing the new user.
* Click Create
* You will be prompted to save the new key file. Note where you save this file.


## Send credentials and key file to the new user
* Send an email to the new user with the credentials file and the key file attached.
* Any other private form of file transfer can also be used to distribute the files to the new user.


You now have all the information needed for a user to create their own cluster.

Next step:
Setup and create a new cluster.


