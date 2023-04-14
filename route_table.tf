// cidr block of vpc pointing to local is inferred by default
resource "aws_route_table" "my_vpc_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_vpc_gw.id
  }

  tags = {
    Name = "my_vpc_rt"
  }
}

resource "aws_route_table" "my_vpc_private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_vpc_private_rt"
  }
}
