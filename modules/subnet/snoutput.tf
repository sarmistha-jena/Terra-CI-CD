output "subnetid" {
  value = aws_subnet.demo1_subnet
}
output "subnetcidr" {
  value = aws_subnet.demo1_subnet.cidr_block
}