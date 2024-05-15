module "vpc" {
  source     = "./modules/vpc"
  build_name = var.build_name
}

module "public_subnet" {
  source      = "./modules/subnet"
  #subnet_az = data.aws_availability_zones.azs.id[0]
  vpc_id      = module.vpc.vpc_id
  build_name  = var.build_name
  subnet_cidr = "12.0.16.0/20"
  subnetname  = "public"
  #count = length(data.aws_availability_zones.azs.names)
  subnet_az   = data.aws_availability_zones.azs.names[0]
}

module "private_subnet" {
  source        = "./modules/subnet"
  #subnet_az = [for k, v in data.aws_subnets.filtered_public : v.ids[1]]
  vpc_id        = module.vpc.vpc_id
  subnet_cidr   = "12.0.32.0/20"
  build_name    = var.build_name
  subnetname    = "private"
  #count = length(data.aws_availability_zones.azs.names)
  subnet_az     = data.aws_availability_zones.azs.names[1]
  map_public_ip = false
}

module "security_group_8080" {
  source     = "./modules/securitygroup"
  build_name = var.build_name
  cidrblock  = "0.0.0.0/0"
  fromport   = 8080
  toport     = 8080
  vpcid      = module.vpc.vpc_id
  protocol   = "tcp"
}

module "igw" {
  source = "./modules/internetgateway"
  vpcid = module.vpc.vpc_id
  build_name = var.build_name
}

module "route_table" {
  source = "./modules/routetable"
  build_name = var.build_name
  igwId = module.igw.igwId
  pubEc2NetworkInterfaceId = module.server1.pubEc2NetworkInterfaceId
  vpcid = module.vpc.vpc_id
}

resource "aws_route_table_association" "pub-sub-rt" {
  subnet_id      = module.public_subnet.subnetid
  route_table_id = module.route_table.rt_public_id
}

resource "aws_route_table_association" "pri-sub-rt" {
  subnet_id      = module.private_subnet.subnetid
  route_table_id = module.route_table.rt_private_id
}

module "server1" {
  source     = "./modules/ec2"
  ami        = data.aws_ami.linux.id
  build_name = var.build_name
  sg         = module.security_group_8080.secgrp_id
  subnet     = module.public_subnet.subnetid
  ip_association = true
}

module "nacl-pub" {
  source = "./modules/nacl"
  vpcid = module.vpc.vpc_id
  build_name = var.build_name
  subnetid = module.public_subnet.subnetid
}

resource "aws_network_acl_association" "nacl-pub-sub" {
  network_acl_id = module.nacl-pub.naclid
  subnet_id      = module.public_subnet.subnetid
}