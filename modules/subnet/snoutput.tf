output "subnetid" {
  value = aws_subnet.demo1_subnet.id
}
output "subnetcidr" {
  value = aws_subnet.demo1_subnet.cidr_block
}