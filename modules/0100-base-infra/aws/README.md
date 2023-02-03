# Base Infrastructure setup on AWS

This folder contains the Terraform configuration for the base infrastructure on AWS. The base infrastructure is the cloud dependent layer of our infrastructure that creates the cloud specific components and brings up kubenertes cluster. The specification of this infrastructure is in the [../0000-infra-SPEC](../0000-infra-SPEC/README.md).


## What are the modules in this folder?

The modules in this folder are:

- [0100-vpc](0100-vpc/README.md) - This module creates an S3 bucket to be used as a backend for Terraform state.
