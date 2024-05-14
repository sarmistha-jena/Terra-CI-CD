resource "aws_instance" "ec2" {
  ami                         = var.ami
  security_groups             = [var.sg]
  associate_public_ip_address = var.ip_association
  subnet_id                   = var.subnet
  instance_type               = var.instancetype
  key_name                    = var.keyname
  user_data                   = var.userdata
  tags                        = {
    Name = "Server ${var.build_name}"
  }
}