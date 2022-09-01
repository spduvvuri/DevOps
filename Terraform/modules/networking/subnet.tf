#4 Create a Subnet
resource "aws_subnet" "prod-subnet-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
}