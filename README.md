# devops test

## Goals

Evaluate understanding of cloud computing concepts, networking and operations best-practices

## Instructions

1. Fork this repository

2. Setup the following infrastructure using Terraform and shell scripts. 

3. Submit a pull request containing a brief description of your technical decisions and points where you may have struggled.

4. Feel free to go beyond the requirements list and add stuff that is you feel that is missing.

## Requirements

- Setup a [managed instance group](https://cloud.google.com/compute/docs/instance-groups) with at least 3 instances.

    > How would you manage scale up and down of the managed instance group of topic 1?

- For each instance, there must be a NGINX reverse proxy listening at port 80. It should be configured to forward every single request to the Flask application in the app folder of this repository.

    > 💡 Tip: Flask developers recommend that you should deploy a WSGI compliant HTTP server in front of it in production scenarios. [Gunicorn](https://gunicorn.org/) is a popular choice.

- The instances from managed instance group must not be directly reached from internet. In order to prevent this you must (1) deploy them without a public IP address and (2) backed by a [HTTP load balancer](https://cloud.google.com/load-balancing/docs/https).

- 💰 **Bonus point**: Your load balancer should be of HTTPS type and host a public domain like yourname.tk. Check [Freenom](freenom.com) for a free .tk domain and host its DNS under your GCP project, then map it to your load balancer public IP.

- How would you monitor both the instances and the applications? Which metrics/logs do you define as "please don't ever deploy without this"?

- 💰 **Bonus point**: Deploy a monitoring stack using either Datadog or Stackdriver
