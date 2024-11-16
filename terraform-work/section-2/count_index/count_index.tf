provider "aws" {}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = "t2.micro"
  count = 2
}
