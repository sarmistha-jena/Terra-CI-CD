resource "aws_vpc" "demo1_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags                 = {
    Name = "Terraform VPC - ${var.build_name}"
  }

}