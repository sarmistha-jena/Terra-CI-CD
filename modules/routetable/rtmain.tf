resource "aws_route_table" "rt_public" {
  vpc_id = var.vpcid
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igwId
  }
  tags = {
    Name = "Public route table ${var.build_name}"
  }
}

resource "aws_route_table" "rt_private" {
  vpc_id = var.vpcid
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = var.pubEc2NetworkInterfaceId
  }
    tags = {
      Name = "Private route table ${var.build_name}"
    }
}