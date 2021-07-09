---
title: Cost Control and Billing
linkTitle: Cost Control and Billing
type: docs
weight: 5
aliases:
    - /manuals_hpcc-aws-cluster_billing.html
    - /manuals_hpcc-aws-cluster_billing
---

## Introduction
This page will talk about AWS costs and billing along with setting some controls for them.

## Costs

AWS Costs come from each and every type of resources you consume on AWS.

Some Examples:

* Node Utilization (How many computers and of what type you use for how long)
* Storage
* Backend services such as network traffic, security groups, and API transactions. (These costs are relatively very small)

Node Utilization and Storage are the two biggest contributors to cost. So when controlling costs focus here.
This can be done by only uploading and downloading the data you need, and deleting your cluster when your not using it.
There are also some saving to be realized by choosing the best type of compute node for the type of work you plan on doing.
It is easy to change the compute type and HPCC can help you to make the best decision for your work.
You can also simply use HPCCs default configuration.

As a practical example: (~$0.43 cents per hour to run in default configuration)

* Using the most common cluster configuration - One headnode and one 8 core compute node with 16G Ram.
* Without using spot pricing.
* Assuming 25GB of input and/or output data.

HPCC can help with cost projection if you need it.

### AWS Costs Calculator

Here is a link to the <a href="https://calculator.s3.amazonaws.com/index.html" target="_blank"> AWS Costs Calculator </a>.

This calculator is very comprehensive and can be difficult to navigate at first. (If you have questions you can ask HPCC)

## Billing

Billing is done my Amazon on a monthly basis and is calculated from the previous months usage. This billing is done via PO associated with a FAU.

<a href="https://console.aws.amazon.com/billing/home#/" target="_blank">AWS Billing & Cost Management Dashboard</a> is a important webpage to have bookmarked.
It will be your main interface for the billing aspects AWS.

Billing access is allowed for the main AWS account only. If you have sub accounts for lab members all their activity is accumulated and reported back through the main aws account.


##  Budgets Controls/Alerts

It is possable to configure budget alerts. This allows you to get notified if you are spending or are projected to spend more that you would like.

There are many different options to customize.

## Basic and practical control example:

This will alert you if you are projected to spend more than $50 in a givien month so you can take action on it.

### Billing Dashboard
* Navigate to the <a href="https://console.aws.amazon.com/billing/home#/" target="_blank">AWS Billing & Cost Management Dashboard</a> 
* All aspects of billing are controlled from here
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-billing-dashboard.png" title="Dashboard" alt="Dashboard">
* Click Budget from the left

### Budgets
* This is the budget control page
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-billing-budget1.png" title="Budget" alt="Budget">
* Click Create Budget

### Define budget and alerts
* This is the budget definition page
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-billing-budget2.png" title="Budget Config 1" alt="Budget Config 1">
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-billing-budget3.png" title="Budget Config 2" alt="Budget Config 2">
* Fill out the Name field (what ever you would like to call it)
* Fill out the Period (Monthly is preffered)
* Fill out the Budgeted Amount (Limit we are interested in, in this example its $50)
* The "Refine your Budget" section can be left as is
* Fill out the "Notify me when" fields as shown
* Fill out your main email address in the "Email contacts" section.
* Click Create


### Budget created
* We are back to the budget page
<img style="box-shadow:5px 5px 5px 5px grey" src="/img/cloud-aws-billing-budget-done.png" title="Budget Done" alt="Budget Done">
* Notice the new budget defined
* You will now be notified it your speding is projected to exceed your budget
* Complete 



