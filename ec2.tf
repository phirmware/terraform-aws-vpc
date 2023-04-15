data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

// TODO: create security group
resource "aws_security_group" "public_instance_sg" {
  name   = "my_vpc_public_sg"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow only public SSH access"
  }

  ingress {
    cidr_blocks = [var.peer_vpc_cidr]
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outgoing public communication"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

resource "aws_security_group" "private_instance_sg" {
  name   = "my_vpc_private_sg"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    // cidr_blocks       = [aws_vpc.my_vpc.cidr_block]
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_instance_sg.id]
    description     = "Allow SSH access from public sg"
  }

  // create NAT gateway for this and configure the route table
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outgoing public communication"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

// Acting as a bastion server to the instance in the private subnet
resource "aws_instance" "public_subnet_instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.my_vpc_subnet_1a.id
  security_groups             = [aws_security_group.public_instance_sg.id]
  key_name                    = "triggr-test"


  tags = {
    "Name" = "my_vpc_public_instance"
  }
}

resource "aws_instance" "private_subnet_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.my_vpc_private_subnet_1a.id
  security_groups = [aws_security_group.private_instance_sg.id]
  key_name        = "triggr-test"

  tags = {
    "Name" = "my_vpc_private_instance"
  }
}
