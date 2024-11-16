provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-079db87dc4c10ac91"
    instance_type = "t2.micro"

    tags = {
      Name = "terraform-ec2"
  }
}

#resource "aws_iam_user" "tf_iam" {
#  name = "terra-user"
#}
