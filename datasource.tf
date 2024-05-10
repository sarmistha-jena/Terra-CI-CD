data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_subnets" "filtered_public" {
  for_each = toset(data.aws_availability_zones.azs.zone_ids)

  filter {
    name   = "tag-key"
    values = ["public"]
  }

  filter {
    name   = "availability-zone-id"
    values = ["${each.value}"]
  }
}