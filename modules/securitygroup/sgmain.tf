resource "aws_security_group" "sg" {
  vpc_id = var.vpcid
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.fromport
    protocol    = var.protocol
    to_port     = var.toport
    cidr_blocks = [var.cidrblock]
  }
  tags = {
    Name = "Public SG - ${var.build_name}"
  }
}
