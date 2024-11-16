provider "aws" {
}

resource "aws_instance" "new-ec2" {
  ami           = var.ami_id
  instance_type = var.instancetype
}
