terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-backend"
    key    = "default/terra-ci-cd/terraform.tfstate" # path & file which will hold the state #
    region = "ap-south-1"
    ##dynamodb_table = "test"
  }
}