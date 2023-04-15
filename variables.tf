variable "peer_owner_id" {
  description = "Account owner of the VPC resource"
  type        = string
  default     = "863801874088"
}

variable "peer_vpc_id" {
  description = "VPC id of peer VPC"
  type        = string
  default     = "vpc-0109cfc8499bef103"
}

variable "peer_vpc_cidr" {
  description = "cidr of peer VPC"
  type        = string
  default     = "10.0.0.0/16"
}
