provider "aws" {}

resource "aws_key_pair" "dsp-keypair" {
  key_name = "dsp-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "vm-1" {
  instance_type = "t2.micro"
  ami           = "ami-08a0d1e16fc3f61ea"
  key_name = aws_key_pair.dsp-keypair.key_name
  vpc_security_group_ids = ["sg-05a6510c7c9d8fa6e"]

  tags = {
    Name = "vm-1"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

  provisioner "file" {
    source      = "sample.txt"
    destination = "/home/ec2-user/sample.txt"
 }
}
