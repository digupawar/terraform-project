variable "instance_type" {
  type = map(string)
  default = {
    dev = "t2.micro"
    prod = "t3.micro"
  }
}
