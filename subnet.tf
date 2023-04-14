resource "aws_subnet" "my_vpc_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.0.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public_subnet_1a"
  }
}

resource "aws_subnet" "my_vpc_private_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.16.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "private_subnet_1a"
  }
}

resource "aws_subnet" "my_vpc_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.32.0/20"
  availability_zone = "us-west-2b"

  tags = {
    Name = "public_subnet_1b"
  }
}

resource "aws_subnet" "my_vpc_private_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.48.0/20"
  availability_zone = "us-west-2b"

  tags = {
    Name = "private_subnet_1b"
  }
}

resource "aws_subnet" "my_vpc_subnet_1c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.64.0/20"
  availability_zone = "us-west-2c"

  tags = {
    Name = "public_subnet_1c"
  }
}

resource "aws_subnet" "my_vpc_private_subnet_1c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.80.0/20"
  availability_zone = "us-west-2c"

  tags = {
    Name = "private_subnet_1c"
  }
}
