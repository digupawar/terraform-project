provider "aws" {
  region     = "ap-southeast-1"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    #values = ["al2023-ami-*"]
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "instance-1" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"

    tags = {
    Name = "web"
  }
}

output "instance_ip_add" {
  value = aws_instance.instance-1.private_dns
}
