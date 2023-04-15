resource "aws_vpc_peering_connection" "my_vpc_peering" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = aws_vpc.my_vpc.id
}
