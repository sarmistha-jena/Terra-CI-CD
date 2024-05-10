data "aws_availability_zones" "azs" {
  state = "available"
  for_each = data.aws_availability_zones.azs.id
  id = each.value
}