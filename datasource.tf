data "aws_availability_zones" "azs" {
  state = "available"
  for_each = data.aws_availability_zones.azs.id
  id = each.value
}

data "aws_subnets" "filtered_public" {
  for_each = toset(data.aws_availability_zones.azs.id)

  filter {
    name   = "tag-key"
    values = ["public"]
  }

  filter {
    name   = "availability-zone-id"
    values = ["${each.value}"]
  }
}