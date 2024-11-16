resource "aws_security_group" "allow_tls" {
  name        = "terra-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
 # vpc_id      = aws_vpc.main.id

  tags = {
    Name = "terra-sg"
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = ["sg-05a6510c7c9d8fa6e"]
    
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#data "aws_security_group" "sg_id" {
#  id = sg-05a6510c7c9d8fa6e
#}

#resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#  security_group_id = aws_security_group.allow_tls.id
#  cidr_ipv4         = "0.0.0.0/0"
#  from_port         = 443
#  ip_protocol       = "tcp"
#  to_port           = 443
#}

#resource "aws_vpc_security_group_ingress_rule" "allow_sg" {
#  security_group_id = aws_security_group.allow_tls.id
#  security_groups = data.aws_security_group.sg_id
#  from_port         = 80 
#  ip_protocol       = "tcp"
#  to_port           = 80
#}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
