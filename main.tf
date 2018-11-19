resource "aws_instance" "web" {
  ami = "${var.aws_ami}"
  instance_type = "${var.aws_instance_type}"
  key_name = "elkstack"
  security_groups = ["terraform-elk"]
  user_data = "${var.userdata}"
 
  tags {
    Name = "ELK Stack"
  }
}

resource "aws_security_group" "terraform-elk" {
  name = "terraform-elk"
  ingress {
    from_port = "5601"
    to_port = "5601"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "9200"
    to_port = "9200"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "5044"
    to_port = "5044"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

  tags {
    Name = "Terraform ELK"
  }
}
