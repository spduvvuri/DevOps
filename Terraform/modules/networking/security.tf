#6. Create Security Group to allow port 22, 80,443
resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #0.0.0.0/0 indicates any address can access it.
    cidr_blocks      = [var.open_to_all_cidr_block]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #0.0.0.0/0 indicates any address can access it.
    cidr_blocks      = [var.open_to_all_cidr_block]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    #0.0.0.0/0 indicates any address can access it.
    cidr_blocks      = [var.open_to_all_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.open_to_all_cidr_block]
    ipv6_cidr_blocks = [var.ipv6_cidr_block]
  }

  tags = {
    Name = "allow_web"
  }
}