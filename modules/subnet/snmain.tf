
resource "aws_subnet" "demo1_subnet" {
  vpc_id = var.vpc_id
  availability_zone = var.subnet_az
  cidr_block = var.subnet_cidr
  tags = {
    Name = "Terra-${var.subnetname}-subnet ${var.build_name}"
    Role = "${var.subnetname}"
    Subnet = "${var.subnetname} subnet"
  }
}
