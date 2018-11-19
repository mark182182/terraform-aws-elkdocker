variable "region" {
  description = "AWS region to use"
}
variable "aws_access_key" {
  description = "AWS IAM user access key"
}
variable "aws_secret_key"  {
  description = "AWS IAM user secret key"
}
variable "aws_private_key_name" {
  description = "AWS private key for authentication"
}
variable "aws_ami" {
  description = "AMI ID to use"
}
variable "userdata" {
  description = "Script to install Docker and run ELK in a container (with 2048MB RAM for the container)"
  default = <<HEREDOC
  #!/bin/bash
  sudo yum install docker -y
  sudo usermod -aG docker $USER
  sudo service docker restart
  sudo sysctl vm.max_map_count=262144
  sudo docker run -it -d -p 5601:5601 -p 9200:9200 -p 5044:5044 --name elkstack --ulimit nofile=65536:65536 --memory=2048m sebp/elk
  HEREDOC
}
variable "aws_instance_type" {
  description = "AWS instance type (t2.small minimum is recommended)"
}
