variable "username" {
  type = number
}

variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}

variable "ami_id" {
  type = string
}

variable "list" {
  type = list
  default = ["m5.large","m5.xlarge"]
}

variable "types" {
  type = map(string)
  default = {
    us-east-1 = "t2.micro"
    us-west-1 = "t2.nano"
  }
}
