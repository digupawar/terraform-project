provider "aws" {}

locals {
  common_tags = {
    owner = "Digvijay"
    team  = "DevOps"
  }
}

resource "aws_instance" "dev" {
  ami           = var.ami_id
  instance_type = var.dev_instance_type
  count         = var.istest == true ? 1 : 0
  tags          = local.common_tags
}

resource "aws_instance" "prod" {
  ami           = var.ami_id
  instance_type = var.prod_instance_type
  count         = var.istest == false ? 1 : 0
  tags          = local.common_tags
}


