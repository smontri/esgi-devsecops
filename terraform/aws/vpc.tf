resource "aws_vpc" "ci-cd_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ci-cd VPC"
  }
}

resource "aws_subnet" "ci-cd_subnet" {
  vpc_id            = aws_vpc.ci-cd_vpc.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "ci-cd Subnet"
  }
}

resource "aws_internet_gateway" "ci-cd_ig" {
  vpc_id = aws_vpc.ci-cd_vpc.id

  tags = {
    Name = "ci-cd Internet Gateway"
  }
}

resource "aws_route_table" "ci-cd_rt" {
  vpc_id = aws_vpc.ci-cd_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ci-cd_ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.ci-cd_subnet.id
  route_table_id = aws_route_table.ci-cd_rt.id
}