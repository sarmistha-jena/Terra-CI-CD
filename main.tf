module "vpc" {
  source = "./modules/vpc"
  build_name = var.build_name
}

module "public_subnet" {
  source = "./modules/subnet"
  #subnet_az = data.aws_availability_zones.azs.id[0]
  vpc_id = module.vpc.vpc_id
  build_name = var.build_name
  subnet_cidr = "12.0.16.0/20"
  subnetname = "public"
  count = length(data.aws_availability_zones.azs.names)
  subnet_az = data.aws_availability_zones.azs.names[count.index]
}

module "private_subnet" {
  source = "./modules/subnet"
  #subnet_az = [for k, v in data.aws_subnets.filtered_public : v.ids[1]]
  vpc_id = module.vpc.vpc_id
  subnet_cidr = "12.0.32.0/20"
  build_name = var.build_name
  subnetname = "private"
  map_public_ip_on_launch = false
  count = length(data.aws_availability_zones.azs.names)
  subnet_az = data.aws_availability_zones.azs.names[count.index]
}