module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = module.vpc.vpc_cidr
  build_name = var.build_name
}

module "public_subnet" {
  source = "./modules/subnet"
  subnet_az = data.aws_availability_zones.azs.id[0]
  vpc_id = module.vpc.vpc_id
  build_name = var.build_name
  subnet_cidr = "12.0.16.0/20"
  subnetname = "public"
}

module "private_subnet" {
  source = "./modules/subnet"
  subnet_az = data.aws_availability_zones.azs.id[1]
  vpc_id = module.vpc.vpc_id
  subnet_cidr = "12.0.32.0/20"
  build_name = var.build_name
  subnetname = "private"
}