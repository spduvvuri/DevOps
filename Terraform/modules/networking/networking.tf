#1 Create a VPC
resource "aws_vpc" "prod-vpc" {
  cidr_block = var.cidr_block
}

#2 Create internet Gateway
resource "aws_internet_gateway" "prod-gw" {
  vpc_id = aws_vpc.prod-vpc.id
}

#3 Create Custom Route Table
resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    # This is default route. All traffic is sent to the internet.
    cidr_block = var.default_route_cidr_block
    gateway_id = aws_internet_gateway.prod-gw.id
  }

  route {
    ipv6_cidr_block = var.ipv6_cidr_block
    gateway_id      = aws_internet_gateway.prod-gw.id
  }
}

#4 Create a Subnet
resource "aws_subnet" "prod-subnet-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

#5. Associate with Route Table
resource "aws_route_table_association" "prod-route-subnet-assoc" {
  subnet_id      = aws_subnet.prod-subnet-1.id
  route_table_id = aws_route_table.prod-route-table.id
}