provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm-1" {
  instance_type = "t2.micro"
  ami           = "ami-08a0d1e16fc3f61ea"

  tags = {
    Name = "vm-1"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
}
