terraform {
required_providers {
  aws = {
    version = "~> 5.41.0"
  }
}
}
provider "aws" {
  region = "ap-south-1"
  alias = "mumbai"
}