variable "region" {}
variable "aws_access_key" {}
variable "aws_secret_key"  {}
variable "aws_ami" {}
variable "userdata" {
  default = "<<HEREDOC
  #!/bin/bash
  sudo yum install docker -y
  sudo usermod -aG docker $USER
  sudo service docker restart
  sudo sysctl vm.max_map_count=262144
  sudo docker run -it -d -p 5601:5601 -p 9200:9200 -p 5044:5044 --name elkstack --ulimit nofile=65536:65536 --memory=2048m sebp/elk
  HEREDOC"
}
variable "aws_instance_type" {}
