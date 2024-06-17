resource "aws_instance" "dsp-ec2-1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.dsp-sub1.id
  key_name      = var.key
  vpc_security_group_ids = [aws_security_group.dsp-sg.id]
  user_data              = base64encode(file("userdata.sh"))

  tags = {
   Name = "dsp-ec2-1"
  }
}

resource "aws_instance" "dsp-ec2-2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.dsp-sub2.id
  key_name      = var.key
  vpc_security_group_ids = [aws_security_group.dsp-sg.id]
  user_data              = base64encode(file("userdata1.sh"))

  tags = {
   Name = "dsp-ec2-2"
  }
}

resource "aws_security_group" "dsp-sg" {
  name        = "Allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.dsp-vpc.id

  tags = {
    Name = "dsp-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "dsp-ingress" {
  security_group_id = aws_security_group.dsp-sg.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "dsp-ingress2" {
  security_group_id = aws_security_group.dsp-sg.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "dsp-egress" {
  security_group_id = aws_security_group.dsp-sg.id
  cidr_ipv4         = var.sg_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
}

