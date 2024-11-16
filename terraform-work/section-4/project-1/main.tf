module "ec2-module" {
  source = "../modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
}
