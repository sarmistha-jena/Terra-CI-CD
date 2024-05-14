output "pubEc2Id" {
  value = aws_instance.ec2.id
}

output "pubEc2NetworkInterfaceId" {
  value = aws_instance.ec2.primary_network_interface_id
}