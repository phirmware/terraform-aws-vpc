terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_internet_gateway" "my_vpc_gw" {
  vpc_id = aws_vpc.my_vpc.id
}

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

// subnet pair for us-west-2a AZ
resource "aws_subnet" "my_vpc_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.0.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public_subnet_1a"
  }
}
resource "aws_route_table_association" "my_vpc_public_rt_1a" {
  subnet_id      = aws_subnet.my_vpc_subnet_1a.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_subnet" "my_vpc_private_subnet_1a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.16.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "private_subnet_1a"
  }
}
resource "aws_route_table_association" "my_vpc_private_rt_1a" {
  subnet_id      = aws_subnet.my_vpc_private_subnet_1a.id
  route_table_id = aws_route_table.my_vpc_private_route_table.id
}
// subnet pair for us-west-2a AZ


// subnet pair for us-west-2b AZ
resource "aws_subnet" "my_vpc_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.32.0/20"
  availability_zone = "us-west-2b"

  tags = {
    Name = "public_subnet_1b"
  }
}
resource "aws_route_table_association" "my_vpc_public_rt_1b" {
  subnet_id      = aws_subnet.my_vpc_subnet_1b.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_subnet" "my_vpc_private_subnet_1b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.48.0/20"
  availability_zone = "us-west-2b"

  tags = {
    Name = "private_subnet_1b"
  }
}
resource "aws_route_table_association" "my_vpc_private_rt_1b" {
  subnet_id      = aws_subnet.my_vpc_private_subnet_1b.id
  route_table_id = aws_route_table.my_vpc_private_route_table.id
}
// subnet pair for us-west-2b AZ

// subnet pair for us-west-2c AZ
resource "aws_subnet" "my_vpc_subnet_1c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.64.0/20"
  availability_zone = "us-west-2c"

  tags = {
    Name = "public_subnet_1c"
  }
}
resource "aws_route_table_association" "my_vpc_public_rt_1c" {
  subnet_id      = aws_subnet.my_vpc_subnet_1c.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_subnet" "my_vpc_private_subnet_1c" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.1.80.0/20"
  availability_zone = "us-west-2c"

  tags = {
    Name = "private_subnet_1c"
  }
}
resource "aws_route_table_association" "my_vpc_private_rt_1c" {
  subnet_id      = aws_subnet.my_vpc_private_subnet_1c.id
  route_table_id = aws_route_table.my_vpc_private_route_table.id
}
// subnet pair for us-west-2c AZ
