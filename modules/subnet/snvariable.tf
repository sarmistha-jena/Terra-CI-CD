variable "vpc_id" {}
#variable "subnet_az" {}
#variable "subnet_cidr" {}
variable "list_subnet_cidrs" {}
variable "build_name" {}
variable "subnetname" {
  default = "public"
}
variable "map_public_ip" {
  type    = bool
  default = true
}