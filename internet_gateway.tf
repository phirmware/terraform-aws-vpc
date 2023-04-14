resource "aws_internet_gateway" "my_vpc_gw" {
  vpc_id = aws_vpc.my_vpc.id
}

// configure egress communication for the private
// subnet using NAT and Elastic IP
resource "aws_eip" "my_vpc_eip" {
  vpc = true
}
resource "aws_nat_gateway" "my_vpc_nat_gw" {
  allocation_id = aws_eip.my_vpc_eip.id
  subnet_id     = aws_subnet.my_vpc_subnet_1a.id

  tags = {
    Name = "my_vpc_NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.my_vpc_gw]
}
