provider "aws" {}

resource "aws_instance" "web" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = var.instance_type[terraform.workspace]

  #tags = {
  #  Name = "dev"
 # }
}
