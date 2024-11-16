data "http" "myip" {
  url = "https://ifconfig.me/ip"
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  ingress {
      from_port = 80
      to_port   = 80
      protocol    = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]   #chomp() method to remove any trailing space or new line which comes with body.
  }

  dynamic "egress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
   Name = "Dynamic-SG"
  }
}
