resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "ipg-a" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "igw-a" }
}

resource "aws_subnet" "public" {
  count             = 4
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = "us-east-1a" 
  map_public_ip_on_launch = true
}

resource "aws_route_table" "RT-public" {
  count = 4
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ipg-a.id
  }
  tags = { Name = "RT-bucket" }
}

resource "aws_route_table_association" "RT-public-SN" {
  count = 4
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.RT-public[count.index].id
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}

output "vpc_id"{
  value = aws_vpc.main.id
}