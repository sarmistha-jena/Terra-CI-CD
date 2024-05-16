data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_subnet" "demo1_subnet" {
  vpc_id                  = var.vpc_id
  //availability_zone       = var.subnet_az
  //cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = var.map_public_ip

  count             = length(data.aws_availability_zones.azs.names)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  //count      = length(var.public_subnet_cidrs)
  cidr_block        = element(var.list_subnet_cidrs, count.index)
  //cidr_block = "10.20.${10+count.index}.0/24"
  tags                    = {
    Name   = "Terra-${var.subnetname}-subnet ${var.build_name}- ${count.index + 1}"
    Role   = "${var.subnetname}"
    Subnet = "${var.subnetname} subnet"
  }
}
