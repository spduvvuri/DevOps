#9.Create aws instance.
resource "aws_instance" "web-server-instance" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  availability_zone = var.availability_zone

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.web-server-nic.id
  }
}