variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr1" {
  type = string
  default = "10.0.0.0/24"
}

variable "subnet_cidr2" {
  type = string
  default = "10.0.1.0/24"
}

variable "ami_id" {
  type = string
  default = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key" {
  type = string
  default = "terraform-key"
}

variable "sg_cidr" {
  type = string
   default = "0.0.0.0/0"
}



