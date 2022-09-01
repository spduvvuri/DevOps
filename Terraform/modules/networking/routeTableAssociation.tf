#5. Associate with Route Table
resource "aws_route_table_association" "prod-route-subnet-assoc" {
  subnet_id      = aws_subnet.prod-subnet-1.id
  route_table_id = aws_route_table.prod-route-table.id
}