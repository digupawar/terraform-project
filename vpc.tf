resource "aws_vpc" "dsp-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "dsp-vpc"
  }
}

resource "aws_subnet" "dsp-sub1" {
  vpc_id     = aws_vpc.dsp-vpc.id
  cidr_block = var.subnet_cidr1
  map_public_ip_on_launch = true

  tags = {
    Name = "dsp-sub1"
  }
}

resource "aws_subnet" "dsp-sub2" {
  vpc_id     = aws_vpc.dsp-vpc.id
  cidr_block = var.subnet_cidr2
  map_public_ip_on_launch = true

  tags = {
    Name = "dsp-sub2"
  }
}

resource "aws_internet_gateway" "dsp-igw" {
  vpc_id = aws_vpc.dsp-vpc.id

  tags = {
    Name = "dsp-igw"
  }
}

resource "aws_route_table" "dsp-RT" {
  vpc_id = aws_vpc.dsp-vpc.id

  tags = {
    Name = "dsp-RT"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dsp-igw.id
  }
}

resource "aws_route_table_association" "dsp-RTA1" {
  subnet_id      = aws_subnet.dsp-sub1.id
  route_table_id = aws_route_table.dsp-RT.id
}

resource "aws_route_table_association" "dsp-RTA2" {
  subnet_id      = aws_subnet.dsp-sub2.id
  route_table_id = aws_route_table.dsp-RT.id
}
