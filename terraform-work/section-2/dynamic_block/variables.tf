variable "sg_ports" {
  type        = list(number)
  description = "list of ingress & egress ports"
  default     = [8200, 8201,8300, 9200, 9500]
}
