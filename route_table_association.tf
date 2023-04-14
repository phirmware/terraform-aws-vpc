resource "aws_route_table_association" "my_vpc_public_rt_1a" {
  subnet_id      = aws_subnet.my_vpc_subnet_1a.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_route_table_association" "my_vpc_private_rt_1a" {
  subnet_id      = aws_subnet.my_vpc_private_subnet_1a.id
  route_table_id = aws_route_table.my_vpc_private_route_table.id
}

resource "aws_route_table_association" "my_vpc_public_rt_1b" {
  subnet_id      = aws_subnet.my_vpc_subnet_1b.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_route_table_association" "my_vpc_private_rt_1b" {
  subnet_id      = aws_subnet.my_vpc_private_subnet_1b.id
  route_table_id = aws_route_table.my_vpc_private_route_table.id
}

resource "aws_route_table_association" "my_vpc_public_rt_1c" {
  subnet_id      = aws_subnet.my_vpc_subnet_1c.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_route_table_association" "my_vpc_private_rt_1c" {
  subnet_id      = aws_subnet.my_vpc_private_subnet_1c.id
  route_table_id = aws_route_table.my_vpc_private_route_table.id
}
