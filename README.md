# Terraform ELK Stack module
Terraform module using ELK Stack in Docker.

This module creates an EC2 instance with the ELK Stack installed in a container.\
You can access Kibana from http://YOUREC2ADDRESS:5601.

# Required Inputs
These variables must be set in the module block when using this module.

## aws_access_key
**Description:** AWS IAM user access key
## aws_ami
**Description:** AMI ID to use\
**Example:** `ami-047bb4163c506cd98`
## aws_instance_type
**Description:** AWS instance type (`t2.medium` minimum is recommended)
## aws_private_key_name
**Description:** AWS private key for authentication\
You have to create a private key first in order to use it.
## aws_secret_key
**Description:** AWS IAM user secret key
## region
**Description:** AWS region to use\
**Example:** `eu-west-1`
# Optional Inputs
These variables have default values and don't have to be set to use this module.\
You may set these variables to override their default values.
## userdata
**Description:** Script to install Docker and run ELK in a container.\
Modify this if you want to change any arguments. Otherwise it should work correctly.
