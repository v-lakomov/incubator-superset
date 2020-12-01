provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "bitpesa-staging-terraform-backend-state-storage"
    key            = "incubator-superset/devops/terraform/main/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "dynamo-staging-terraform-state-lock"
  }
}
