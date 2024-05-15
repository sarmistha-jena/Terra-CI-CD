
resource "aws_network_acl" "nacl" {
  vpc_id     = var.vpcid
  subnet_ids = [var.subnetid]
  ingress {
    action    = "allow"
    from_port = 22
    protocol  = "tcp"
    rule_no   = 100
    to_port   = 22
    cidr_block = var.subnetcidr
  }
  ingress {
    action    = "allow"
    from_port = 8080
    protocol  = "tcp"
    rule_no   = 200
    to_port   = 8080
    cidr_block = var.subnetcidr
  }

  ingress {
    action    = "deny"
    from_port = 8081
    protocol  = "tcp"
    rule_no   = 300
    to_port   = 8081
    cidr_block = var.subnetcidr
  }
  tags = {
    Name = "Custom_NACL ${var.build_name}"
  }
}