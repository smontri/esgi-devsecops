resource "aws_vpc" "jpetstore_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "JPetStore VPC"
  }
}

resource "aws_subnet" "jpetstore_subnet" {
  vpc_id            = aws_vpc.jpetstore_vpc.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "JPetStore Subnet"
  }
}

resource "aws_internet_gateway" "jpetstore_ig" {
  vpc_id = aws_vpc.jpetstore_vpc.id

  tags = {
    Name = "JPetStore Internet Gateway"
  }
}

resource "aws_route_table" "jpetstore_rt" {
  vpc_id = aws_vpc.jpetstore_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jpetstore_ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.jpetstore_subnet.id
  route_table_id = aws_route_table.jpetstore_rt.id
}