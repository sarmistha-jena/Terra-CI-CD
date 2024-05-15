resource "aws_network_acl" "nacl" {
  vpc_id     = var.vpcid
  subnet_ids = [var.subnetid]
  ingress {
    action    = "allow"
    from_port = 22
    protocol  = "tcp"
    rule_no   = 100
    to_port   = 22
  }
  ingress {
    action    = "allow"
    from_port = 8080
    protocol  = "tcp"
    rule_no   = 200
    to_port   = 8080
  }

  ingress {
    action    = "deny"
    from_port = 8081
    protocol  = "tcp"
    rule_no   = 300
    to_port   = 8081
  }
  tags = {
    Name = "Custom_NACL ${var.build_name}"
  }
}