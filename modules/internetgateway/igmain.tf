resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpcid
  tags   = {
    Name = "TF-IGW ${var.build_name}"
  }
}