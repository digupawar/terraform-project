output "public-ip1" {
  value = aws_instance.dsp-ec2-1.public_ip
}

output "public-ip2" {
  value = aws_instance.dsp-ec2-2.public_ip
}

output "loadbalancerdns" {
  value = aws_lb.dsp-alb.dns_name
}
