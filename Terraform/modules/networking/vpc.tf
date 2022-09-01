#1 Create a VPC
resource "aws_vpc" "prod-vpc" {
  cidr_block = var.cidr_block
}