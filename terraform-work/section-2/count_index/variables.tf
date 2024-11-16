variable "elb_names" {
  default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
  type = list
}

variable "ami_id" {
  default = "ami-079db87dc4c10ac91"
  type = string
}
